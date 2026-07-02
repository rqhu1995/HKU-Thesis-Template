#!/usr/bin/env python3
"""
Robustly insert locally extracted source passages into a Chapter 1 CE review table.

This version does NOT require the exact header name
"Source TXT and exact line range". It finds the source column by fuzzy matching
a header cell containing source + txt + line/range.

Run from the repository root, or pass --repo-root.
"""

from __future__ import annotations

import argparse
import html
import re
import sys
from pathlib import Path


REF_TOKEN_RE = re.compile(
    r"`(?P<path>[^`]+\.txt)`|"
    r"L(?P<start>\d+)(?:\s*[-–—]\s*L?(?P<end>\d+))?"
)


def split_markdown_row(line: str) -> list[str]:
    stripped = line.strip()
    if not (stripped.startswith("|") and stripped.endswith("|")):
        raise ValueError(f"Not a Markdown table row: {line!r}")

    body = stripped[1:-1]
    cells: list[str] = []
    buf: list[str] = []
    in_code = False
    escaped = False

    for ch in body:
        if escaped:
            buf.append(ch)
            escaped = False
            continue
        if ch == "\\":
            buf.append(ch)
            escaped = True
            continue
        if ch == "`":
            in_code = not in_code
            buf.append(ch)
            continue
        if ch == "|" and not in_code:
            cells.append("".join(buf).strip())
            buf = []
            continue
        buf.append(ch)

    cells.append("".join(buf).strip())
    return cells


def render_markdown_row(cells: list[str]) -> str:
    return "| " + " | ".join(cells) + " |\n"


def normalized_header(cell: str) -> str:
    cell = cell.replace("`", "")
    cell = re.sub(r"<[^>]+>", " ", cell)
    cell = re.sub(r"[_\-–—/]+", " ", cell)
    cell = re.sub(r"\s+", " ", cell)
    return cell.strip().lower()


def find_source_col(cells: list[str]) -> int:
    """
    Find the column containing source TXT line references.

    Accepted examples:
    - Source TXT and exact line range
    - Source TXT and exact line ranges
    - Source TXT / line range
    - Source file and line range
    """
    normed = [normalized_header(c) for c in cells]

    # Best match: explicitly source + txt + line/range.
    for i, c in enumerate(normed):
        if "source" in c and "txt" in c and ("line" in c or "range" in c):
            return i

    # Fallback: txt + line/range.
    for i, c in enumerate(normed):
        if "txt" in c and ("line" in c or "range" in c):
            return i

    # Fallback: source + line/range.
    for i, c in enumerate(normed):
        if "source" in c and ("line" in c or "range" in c):
            return i

    raise ValueError(
        "Could not identify the source TXT/line-range column.\n"
        "Header cells found:\n"
        + "\n".join(f"  {idx}: {cell!r}" for idx, cell in enumerate(cells))
    )


def parse_source_references(cell: str) -> list[tuple[str, int, int]]:
    refs: list[tuple[str, int, int]] = []
    current_path: str | None = None

    for m in REF_TOKEN_RE.finditer(cell):
        path = m.group("path")
        if path is not None:
            current_path = path
            continue

        if current_path is None:
            raise ValueError(
                f"Found line range before any TXT path in source cell: {cell}"
            )

        start = int(m.group("start"))
        end = int(m.group("end") or start)
        if start < 1 or end < start:
            raise ValueError(f"Invalid line range L{start}-L{end}: {cell}")
        refs.append((current_path, start, end))

    if not refs:
        raise ValueError(f"No TXT path + line range found in source cell: {cell}")
    return refs


def resolve_path(repo_root: Path, source: str) -> Path:
    p = Path(source).expanduser()
    return p if p.is_absolute() else repo_root / p


def read_lines(path: Path, start: int, end: int) -> str:
    try:
        lines = path.read_text(encoding="utf-8").splitlines()
    except UnicodeDecodeError:
        lines = path.read_text(encoding="utf-8-sig").splitlines()

    if end > len(lines):
        raise IndexError(
            f"{path}: requested L{start}-L{end}, but file has {len(lines)} lines"
        )
    return "\n".join(lines[start - 1:end])


def table_safe(text: str) -> str:
    text = html.escape(text, quote=False)
    text = text.replace("|", "&#124;")
    return text.replace("\n", "<br>")


def build_passage_cell(source_cell: str, repo_root: Path) -> tuple[str, int]:
    refs = parse_source_references(source_cell)
    chunks: list[str] = []

    for source, start, end in refs:
        path = resolve_path(repo_root, source)
        if not path.is_file():
            raise FileNotFoundError(f"Source TXT not found: {path}")
        passage = read_lines(path, start, end)
        chunks.append(
            f"**`{source}` L{start}–L{end}**<br>{table_safe(passage)}"
        )

    return "<br><br>".join(chunks), len(refs)


def is_separator_row(cells: list[str]) -> bool:
    return all(re.fullmatch(r":?-{3,}:?", c.strip()) for c in cells)


def process(input_path: Path, output_path: Path, repo_root: Path, force: bool) -> tuple[int, int]:
    if not input_path.is_file():
        raise FileNotFoundError(f"Input review not found: {input_path}")
    if output_path.exists() and not force:
        raise FileExistsError(
            f"Output already exists: {output_path}\nUse --force to overwrite."
        )

    lines = input_path.read_text(encoding="utf-8").splitlines(keepends=True)
    out: list[str] = []

    in_target_table = False
    source_col: int | None = None
    header_found = False
    rows = 0
    ranges = 0

    for line in lines:
        # Only treat as the main CE table if it has CE ID AND some source/txt/line column.
        if line.lstrip().startswith("|"):
            try:
                cells = split_markdown_row(line)
            except ValueError:
                cells = []
            if cells and normalized_header(cells[0]) == "ce id":
                try:
                    candidate_col = find_source_col(cells)
                except ValueError:
                    # This can be a later summary table that also begins with CE ID.
                    out.append(line)
                    continue

                source_col = candidate_col
                cells.insert(source_col + 1, "Exact source passage(s) from local TXT")
                out.append(render_markdown_row(cells))
                in_target_table = True
                header_found = True
                continue

        if in_target_table:
            if not line.lstrip().startswith("|"):
                in_target_table = False
                out.append(line)
                continue

            cells = split_markdown_row(line)
            assert source_col is not None

            if is_separator_row(cells):
                cells.insert(source_col + 1, "---")
                out.append(render_markdown_row(cells))
                continue

            if cells and re.fullmatch(r"CE-\d+", cells[0].strip()):
                passage_cell, n = build_passage_cell(cells[source_col], repo_root)
                cells.insert(source_col + 1, passage_cell)
                out.append(render_markdown_row(cells))
                rows += 1
                ranges += n
                continue

            out.append(line)
            continue

        out.append(line)

    if not header_found:
        raise ValueError(
            "Could not find a CE table with a source TXT / line range column."
        )
    if rows == 0:
        raise ValueError("Found the target table header but processed 0 CE rows.")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("".join(out), encoding="utf-8")
    return rows, ranges


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--repo-root",
        type=Path,
        default=Path.cwd(),
        help="Repository root. Default: current working directory.",
    )
    parser.add_argument(
        "--input",
        type=Path,
        default=Path("tracking/codex_reports/2026-06-25_chapter1_claim_evidence_review.md"),
        help="Input claim-evidence review markdown.",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=Path("tracking/codex_reports/2026-06-25_chapter1_claim_evidence_review_with_passages.md"),
        help="Output markdown.",
    )
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    repo_root = args.repo_root.expanduser().resolve()
    input_path = args.input.expanduser()
    if not input_path.is_absolute():
        input_path = repo_root / input_path

    output_path = args.output.expanduser()
    if not output_path.is_absolute():
        output_path = repo_root / output_path

    try:
        rows, ranges = process(input_path, output_path, repo_root, args.force)
    except Exception as e:
        print(f"ERROR: {e}", file=sys.stderr)
        return 1

    print(f"Created: {output_path}")
    print(f"CE rows processed: {rows}")
    print(f"Source line ranges inserted: {ranges}")
    print("No thesis source file was modified.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
