#!/usr/bin/env python3
"""Extract local PDF source pages for Chapter 1 citation checking.

This script is deterministic and local-only. It reads the existing raw citation
report, extracts the listed PDF target pages with pdftotext, and writes an index
that records where search terms were found. It does not judge citations.
"""

from __future__ import annotations

import datetime as _dt
import hashlib
import os
import re
import subprocess
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
RAW_REPORT = ROOT / "tracking/codex_reports/2026-06-25_chapter1_raw_citation_passages.md"
CHAPTER1 = ROOT / "Chapters/Chapter1.tex"
OUT_DIR = ROOT / "tracking/codex_reports/chapter1_citation_source_pages"
INDEX = ROOT / "tracking/codex_reports/2026-06-25_chapter1_local_source_index.md"


@dataclass
class CEItem:
    ce_id: str
    chapter_line: int | None = None
    sentence_opening: str = ""
    citekey: str = ""
    pdf_path: Path | None = None
    printed_page: str = "NA"
    pdf_page_index: int | None = None
    section: str = ""
    search_terms_raw: str = ""
    source_txt: str = ""
    found_lines: str = ""
    adjacent_needed: str = "no"

    @property
    def search_terms(self) -> list[str]:
        if not self.search_terms_raw:
            return []
        return [t.strip() for t in self.search_terms_raw.split(";") if t.strip()]


@dataclass
class PageExtraction:
    citekey: str
    pdf_path: Path
    page_index: int
    printed_page: str
    section: str
    ce_ids: list[str] = field(default_factory=list)
    filename: str = ""
    relpath: str = ""
    empty: bool = False
    ocr_used: bool = False
    adjacent: bool = False


def run(cmd: list[str], *, cwd: Path = ROOT, check: bool = True) -> subprocess.CompletedProcess[str]:
    return subprocess.run(cmd, cwd=cwd, text=True, capture_output=True, check=check)


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def pdftotext_version() -> str:
    proc = run(["pdftotext", "-v"], check=False)
    data = (proc.stderr or proc.stdout).splitlines()
    return data[0].strip() if data else "pdftotext version unavailable"


def parse_report() -> list[CEItem]:
    text = RAW_REPORT.read_text()
    ce_items: dict[str, CEItem] = {}

    table_re = re.compile(r"^\|\s*(CE-\d{3})\s*\|\s*(\d+)\s*\|\s*(.*?)\s*\|\s*`([^`]+)`\s*\|", re.M)
    for ce_id, line, opening, citekey in table_re.findall(text):
        ce_items[ce_id] = CEItem(
            ce_id=ce_id,
            chapter_line=int(line),
            sentence_opening=opening.strip(),
            citekey=citekey.strip(),
        )

    card_re = re.compile(r"^## (CE-\d{3})\n(.*?)(?=^## CE-\d{3}\n|^## Completeness check|\Z)", re.M | re.S)
    for ce_id, block in card_re.findall(text):
        item = ce_items.setdefault(ce_id, CEItem(ce_id=ce_id))

        cite = re.search(r"\*\*Citekey\*\*\s*```(?:\n)?([^`\n]+)(?:\n)?```", block)
        if cite:
            item.citekey = cite.group(1).strip()

        pdf = re.search(r"^-   Local PDF path:\s*(.+)$", block, re.M)
        if pdf:
            item.pdf_path = Path(pdf.group(1).strip())

        printed = re.search(r"^-   Printed page number:\s*(.+)$", block, re.M)
        if printed:
            item.printed_page = printed.group(1).strip()

        pdf_index = re.search(r"^-   PDF page index:\s*(\d+)$", block, re.M)
        if pdf_index:
            item.pdf_page_index = int(pdf_index.group(1))

        section = re.search(r"^-   Section:\s*(.+)$", block, re.M)
        if section:
            item.section = section.group(1).strip()

        terms = re.search(r"^-   Local text-search terms used to locate page:\s*(.+)$", block, re.M)
        if terms:
            item.search_terms_raw = terms.group(1).strip()

    return [ce_items[k] for k in sorted(ce_items)]


def sanitize_part(value: str) -> str:
    value = value.strip()
    if not value or value.lower().startswith("article number"):
        return "NA"
    value = re.sub(r"[^A-Za-z0-9_-]+", "_", value)
    return value.strip("_") or "NA"


def page_filename(citekey: str, page_index: int, printed_page: str, *, adjacent: bool = False) -> str:
    if adjacent:
        return f"{citekey}__pdfpage_{page_index}__adjacent.txt"
    return f"{citekey}__pdfpage_{page_index}__printed_{sanitize_part(printed_page)}.txt"


def extract_page(page: PageExtraction, tool_version: str) -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    page.filename = page_filename(page.citekey, page.page_index, page.printed_page, adjacent=page.adjacent)
    out_path = OUT_DIR / page.filename
    tmp_path = OUT_DIR / f".{page.filename}.body"

    # The raw report defines PDF page index as zero-based.
    pdftotext_page = page.page_index + 1
    proc = run(
        [
            "pdftotext",
            "-layout",
            "-enc",
            "UTF-8",
            "-f",
            str(pdftotext_page),
            "-l",
            str(pdftotext_page),
            str(page.pdf_path),
            str(tmp_path),
        ],
        check=False,
    )
    body = ""
    if tmp_path.exists():
        body = tmp_path.read_text(errors="replace")
        tmp_path.unlink()

    page.empty = not body.strip()
    header = "\n".join(
        [
            f"CITEKEY: {page.citekey}",
            f"SOURCE PDF: {page.pdf_path}",
            f"PDF PAGE INDEX: {page.page_index}",
            f"PDFTOTEXT PAGE NUMBER: {pdftotext_page}",
            f"PRINTED PAGE: {page.printed_page}",
            f"SECTION: {page.section}",
            f"RELATED CE IDS: {', '.join(page.ce_ids)}",
            f"EXTRACTION TOOL: {tool_version}",
            "OCR USED: no",
            "LINE-BREAK HYPHENATION NORMALIZED: no",
            "------------------------------------------------------------",
            "",
        ]
    )
    out_path.write_text(header + body, errors="replace")
    page.relpath = out_path.relative_to(ROOT).as_posix()
    if proc.returncode != 0 and page.empty:
        page.empty = True


def normalized(text: str) -> str:
    return re.sub(r"[^a-z0-9]+", " ", text.lower()).strip()


def term_variants(term: str) -> list[str]:
    raw = term.strip()
    variants = [raw]
    if "/" in raw:
        variants.extend([p.strip() for p in raw.split("/") if p.strip()])
    no_hyphen = raw.replace("-", "")
    if no_hyphen != raw:
        variants.append(no_hyphen)
    # Keyword split fallback for semicolon-separated phrases from the raw report.
    words = [w.lower() for w in re.findall(r"[A-Za-z0-9]+", raw)]
    stop = {"and", "or", "the", "to", "of", "in", "a", "an", "for", "with", "by", "at"}
    keywords = [w for w in words if w not in stop and len(w) > 2]
    if keywords:
        variants.append(" ".join(keywords))
    dedup: list[str] = []
    for v in variants:
        if v and v not in dedup:
            dedup.append(v)
    return dedup


def search_lines(txt_path: Path, term: str) -> list[str]:
    lines = txt_path.read_text(errors="replace").splitlines()
    hits: list[int] = []
    norm_lines = [normalized(line) for line in lines]

    for variant in term_variants(term):
        v = variant.lower()
        v_norm = normalized(variant)
        for idx, line in enumerate(lines, start=1):
            if v and v in line.lower():
                hits.append(idx)
        if not hits and v_norm:
            for idx, line_norm in enumerate(norm_lines, start=1):
                if v_norm and v_norm in line_norm:
                    hits.append(idx)
        if not hits and " " in v_norm:
            words = v_norm.split()
            for idx in range(len(norm_lines)):
                window = " ".join(norm_lines[idx : idx + 3])
                if all(word in window for word in words):
                    hits.extend(range(idx + 1, min(idx + 4, len(lines) + 1)))
        if hits:
            break

    return format_line_ranges(sorted(set(hits)))


def format_line_ranges(nums: list[int]) -> list[str]:
    if not nums:
        return []
    ranges: list[str] = []
    start = prev = nums[0]
    for num in nums[1:]:
        if num == prev + 1:
            prev = num
            continue
        ranges.append(f"L{start}" if start == prev else f"L{start}-L{prev}")
        start = prev = num
    ranges.append(f"L{start}" if start == prev else f"L{start}-L{prev}")
    return ranges


def page_count(pdf_path: Path) -> int | None:
    proc = run(["pdfinfo", str(pdf_path)], check=False)
    for line in (proc.stdout + proc.stderr).splitlines():
        if line.startswith("Pages:"):
            try:
                return int(line.split(":", 1)[1].strip())
            except ValueError:
                return None
    return None


def build_index(items: list[CEItem], pages: dict[tuple[str, int], PageExtraction], tool_version: str) -> str:
    branch = run(["git", "rev-parse", "--abbrev-ref", "HEAD"]).stdout.strip()
    head = run(["git", "rev-parse", "HEAD"]).stdout.strip()
    now = _dt.datetime.now().astimezone().isoformat(timespec="seconds")

    lines: list[str] = []
    lines.extend(
        [
            f"- Current branch: `{branch}`",
            f"- HEAD commit: `{head}`",
            f"- Chapter1.tex SHA-256: `{sha256(CHAPTER1)}`",
            f"- Raw citation report SHA-256: `{sha256(RAW_REPORT)}`",
            f"- Extraction time: `{now}`",
            f"- Extraction tool version: `{tool_version}`",
            "",
            "| CE ID | Citekey | Chapter 1 line | Source TXT | PDF page index | Printed page | Search terms | Found lines | Adjacent page needed |",
            "| ----- | ------- | -------------: | ---------- | -------------: | ------------ | ------------ | ----------- | -------------------- |",
        ]
    )
    for item in items:
        source = item.source_txt or "MISSING"
        found = item.found_lines or "NOT FOUND IN TARGET OR ADJACENT PAGES"
        terms = item.search_terms_raw.replace("|", "\\|")
        lines.append(
            f"| {item.ce_id} | `{item.citekey}` | {item.chapter_line or ''} | {source} | "
            f"{item.pdf_page_index if item.pdf_page_index is not None else ''} | {item.printed_page} | "
            f"{terms} | {found} | {item.adjacent_needed} |"
        )

    by_citekey: dict[str, dict[str, object]] = defaultdict(lambda: {"pdf": "", "pages": set(), "ce_ids": []})
    for item in items:
        entry = by_citekey[item.citekey]
        entry["pdf"] = str(item.pdf_path)
        if item.pdf_page_index is not None:
            entry["pages"].add(item.pdf_page_index)
        entry["ce_ids"].append(item.ce_id)

    lines.extend(
        [
            "",
            "## Unique-source summary",
            "",
            "| Citekey | PDF path | Target pages extracted | Related CE IDs |",
            "| ------- | -------- | ---------------------- | -------------- |",
        ]
    )
    for citekey in sorted(by_citekey):
        entry = by_citekey[citekey]
        pages_s = ", ".join(str(p) for p in sorted(entry["pages"]))
        ce_s = ", ".join(entry["ce_ids"])
        lines.append(f"| `{citekey}` | {entry['pdf']} | {pages_s} | {ce_s} |")

    return "\n".join(lines) + "\n"


def main() -> int:
    tool_version = pdftotext_version()
    items = parse_report()
    OUT_DIR.mkdir(parents=True, exist_ok=True)

    missing = [item.ce_id for item in items if not item.pdf_path or item.pdf_page_index is None]
    if missing:
        raise SystemExit(f"Missing PDF path or page index for: {', '.join(missing)}")

    target_pages: dict[tuple[str, int], PageExtraction] = {}
    for item in items:
        assert item.pdf_path is not None and item.pdf_page_index is not None
        if not item.pdf_path.exists():
            raise SystemExit(f"Invalid PDF path for {item.ce_id}: {item.pdf_path}")
        key = (str(item.pdf_path), item.pdf_page_index)
        page = target_pages.get(key)
        if page is None:
            page = PageExtraction(
                citekey=item.citekey,
                pdf_path=item.pdf_path,
                page_index=item.pdf_page_index,
                printed_page=item.printed_page,
                section=item.section,
            )
            target_pages[key] = page
        page.ce_ids.append(item.ce_id)

    for page in target_pages.values():
        extract_page(page, tool_version)

    # Search target pages first, then adjacent pages only when needed.
    adjacent_pages: dict[tuple[str, int, str], PageExtraction] = {}
    for item in items:
        assert item.pdf_path is not None and item.pdf_page_index is not None
        target_page = target_pages[(str(item.pdf_path), item.pdf_page_index)]
        target_path = ROOT / target_page.relpath
        item.source_txt = target_page.relpath
        found_records: list[str] = []
        missing_terms: list[str] = []
        for term in item.search_terms:
            hits = search_lines(target_path, term)
            if hits:
                found_records.append(f"{term}: {', '.join(hits)}")
            else:
                missing_terms.append(term)

        if missing_terms:
            item.adjacent_needed = "yes"
            page_total = page_count(item.pdf_path)
            adjacent_hits: list[str] = []
            for adj_index in [item.pdf_page_index - 1, item.pdf_page_index + 1]:
                if adj_index < 0:
                    continue
                if page_total is not None and adj_index >= page_total:
                    continue
                adj_key = (str(item.pdf_path), adj_index, item.citekey)
                adj_page = adjacent_pages.get(adj_key)
                if adj_page is None:
                    adj_page = PageExtraction(
                        citekey=item.citekey,
                        pdf_path=item.pdf_path,
                        page_index=adj_index,
                        printed_page="NA",
                        section=f"Adjacent page for {item.ce_id}",
                        ce_ids=[item.ce_id],
                        adjacent=True,
                    )
                    adjacent_pages[adj_key] = adj_page
                    extract_page(adj_page, tool_version)
                elif item.ce_id not in adj_page.ce_ids:
                    adj_page.ce_ids.append(item.ce_id)
                adj_path = ROOT / adj_page.relpath
                for term in list(missing_terms):
                    hits = search_lines(adj_path, term)
                    if hits:
                        adjacent_hits.append(f"{term}: {adj_page.relpath} {', '.join(hits)}")
                        missing_terms.remove(term)
            found_records.extend(adjacent_hits)
            for term in missing_terms:
                found_records.append(f"{term}: NOT FOUND IN TARGET OR ADJACENT PAGES")

        if not found_records:
            item.found_lines = "NOT FOUND ON TARGET PAGE"
        else:
            item.found_lines = "; ".join(found_records).replace("|", "\\|")

    INDEX.write_text(build_index(items, {**target_pages}, tool_version))

    # Quiet machine-readable summary for verification without printing source text.
    complete = all(f"CE-{i:03d}" in {item.ce_id for item in items} for i in range(1, 36))
    empty_txt = [p.relpath for p in list(target_pages.values()) + list(adjacent_pages.values()) if p.empty]
    all_found = sum(1 for item in items if "NOT FOUND" not in item.found_lines)
    partial = sum(1 for item in items if "NOT FOUND" in item.found_lines and any("L" in part for part in item.found_lines.split(";")))
    none = len(items) - all_found - partial
    print(f"ce_items={len(items)}")
    print(f"unique_pdfs={len({str(item.pdf_path) for item in items})}")
    print(f"unique_target_pages={len(target_pages)}")
    print(f"source_txt_files={len(list(target_pages.values()) + list(adjacent_pages.values()))}")
    print(f"all_ce_present={complete}")
    print(f"empty_txt_count={len(empty_txt)}")
    print(f"all_terms_found_ce={all_found}")
    print(f"partial_terms_found_ce={partial}")
    print(f"no_terms_found_ce={none}")
    print("ocr_pages=0")
    print(f"index={INDEX.relative_to(ROOT).as_posix()}")
    print(f"source_dir={OUT_DIR.relative_to(ROOT).as_posix()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
