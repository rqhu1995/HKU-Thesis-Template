# HKU Thesis Template Audit

Audit date: 2026-06-17

## Files Inspected

- `main.tex`
- `HKUThesis.cls`
- `Abstract/abstract.tex`
- `Titlepage/titlepage.tex`
- `Titlepage/library_titlepage.tex`
- `Declaration/declaration.tex`
- `Acknowledgments/acknowledgments.tex`
- `Abbreviations/abbreviations.tex`
- `Symbols/symbols.tex`
- `Chapters/Chapter1.tex`
- `Chapters/Chapter2.tex`
- `Chapters/Chapter3.tex`
- `Chapters/Chapter5.tex`
- `Appendices/AppendixA.tex`
- `Appendices/AppendixB.tex`
- `Appendices/AppendixC.tex`
- `thesis.bib`
- `README.md`
- `main.log`
- `main.blg`
- `main.pdf`

## Files Changed

- `main.tex`
- `HKUThesis.cls`
- `Abstract/abstract.tex`
- `Titlepage/titlepage.tex`
- `Titlepage/library_titlepage.tex`
- `Declaration/declaration.tex`
- `Acknowledgments/acknowledgments.tex`
- `Abbreviations/abbreviations.tex`
- `Symbols/symbols.tex`
- `main.pdf`
- `HKU_THESIS_TEMPLATE_AUDIT.md`

## Summary of Changes

- Set the formal default PDF to `12pt`, `oneside`, A4, one-and-a-half spacing, and symmetric margins: 35 mm left/right and 25 mm top/bottom.
- Disabled `headsepline` and simplified the formal page style to centered footer page numbers only.
- Moved page numbering control into `main.tex`: abstract/title pages use gobbled numbering, declaration starts Roman `i`, and Chapter 1 starts Arabic `1`.
- Added central switches for optional library title page, lists, abbreviations, symbols, and appendices. The library reference page and placeholder appendices are preserved in the repository but disabled by default.
- Removed visible demo abstract prose, old demo subject/keywords, demo `\nocite`, degree-placeholder text, auto date usage on formal title pages, manual page-counter hacks, and the signature image overlay.
- Revised the formal title page to a Shui-style block layout: title near the upper page, author block, department/university block, submission statement near the lower page, and month/year at the bottom.
- Kept previous degrees as an editable `\previousdegrees` macro and printed it only when non-empty.
- Removed visible acknowledgements placeholder text from the compiled PDF.
- Replaced declaration wording with a conservative own-work declaration.
- Kept the Times-like text/math setup via `newtxtext` and `newtxmath`.
- Set hyperlink, citation, and URL colors to black through the existing `hyperref` setup.
- Adjusted chapter headings to compact centered bold `\Large` formatting and changed numbered chapter entries in the ToC to `CHAPTER N TITLE`.
- Revised chapter-opening and section-heading style closer to the Shui Chin Sum 2016 HKU thesis sample: top-anchored centered chapter openings, uppercase bold section headings, and trailing dots after section/subsection numbers.

## Shui-Style Heading Update

- Files changed for this heading-style pass:
  - `HKUThesis.cls`
  - `main.pdf`
  - `HKU_THESIS_TEMPLATE_AUDIT.md`
- Exact chapter-spacing values now used in `HKUThesis.cls`:
  - `\abovechapterskip`: `\vspace*{-90pt}`
  - `\chapterinbetweenskip`: `\vspace*{10pt}`
  - `\chapterbelowskip`: `\vspace*{16pt}`
- Chapter heading appearance:
  - Numbered chapters print as centered `CHAPTER <number>` followed by the centered chapter title below it.
  - Chapter prefix and chapter title both use bold serif `\Large`.
  - No `\Huge` chapter heading is used.
  - The chapter heading block is now anchored close to the upper text area instead of appearing vertically centered.
- Section heading appearance:
  - `\section` headings are bold, left-aligned, compact, and uppercased in the body.
  - `\section` numbers now show a trailing dot, e.g. `2.1.`
  - `\subsection` numbers now show a trailing dot, e.g. `2.1.1.`
  - `\subsection` title text remains title case rather than being forced uppercase.
- ToC chapter entries:
  - Numbered chapter entries render in `CHAPTER N TITLE` form, e.g. `CHAPTER 2 LITERATURE REVIEW`.
  - This ToC format was retained; it causes underfull line-break warnings for very long all-caps chapter titles.
- Visual verification:
  - Chapter 1, Chapter 2, and long-title chapters including Chapter 5 were inspected from the rebuilt PDF.
  - The chapter heading blocks are near the top text area, section/body content follows soon after the title, and page numbers remain centered in the footer.
  - No standalone chapter-outline page or large display-title chapter page is generated.
- Remaining visual differences from Shui's sample:
  - The current chapter files are mostly skeletal, so the sample pages have less body text than Shui's completed thesis pages.
  - Exact line breaks for long chapter titles and ToC entries differ because the current thesis has very long all-caps paper-style chapter titles.
  - The Shui sample includes final thesis body paragraphs and library-stamped archival pages; this formal template does not reproduce those external archival marks by default.

## Compilation Command Used

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

## Compilation Result

- Result: **Success**. `main.pdf` was generated.
- Remaining LaTeX warnings:
  - `Empty bibliography` because the current chapter skeleton contains no citation commands after removing the demo-only `\nocite`.
  - Six underfull ToC hbox warnings caused by very long all-caps chapter titles in the Shui-style `CHAPTER N TITLE` ToC format. No overfull hbox warnings remain.
- No unresolved citation or undefined reference warnings were reported in the final log.

## Page Size / Margin Status

- Source status: **Pass**.
  - `main.tex` uses A4 paper, `left=35mm`, `right=35mm`, `top=25mm`, `bottom=25mm`.
  - `oneside` is enabled and `bindingoffset` is removed.
- PDF status: **Pass**.
  - `pdfinfo main.pdf` reports `Page size: 595.276 x 841.89 pts (A4)`.

## Page Numbering Status

- Status: **Pass**.
- Abstract and title page have no visible page numbers and are not counted in Roman front matter.
- Declaration starts at lower-case Roman `i`.
- Acknowledgements and contents continue lower-case Roman numbering.
- The table of contents is included in the Roman-numbered front matter and is listed in itself.
- Chapter 1 starts at Arabic page `1`.
- Bibliography continues Arabic numbering after the chapters.
- Page numbers are in the centered footer; no running header page numbers are used in the formal `thesis` style.

## Abstract / Title / Declaration / Front Matter Status

- Abstract: **Structurally pass, content incomplete**.
  - Abstract appears before the title page.
  - Abstract is unnumbered and absent from the table of contents.
  - Opening structure uses thesis title, author, degree, university, and `\submissionmonthyear`.
  - The body is a visible TODO placeholder; the final abstract must be supplied and checked for 200--500 words.
- Title page: **Structurally pass, date incomplete**.
  - Title page follows the abstract, is unnumbered, and is absent from the table of contents.
  - It follows the requested Shui-style block order and includes the department/university block.
  - It uses the conservative wording with British spelling `fulfilment`.
  - Previous degrees are controlled by `\previousdegrees` in `main.tex`; currently this prints `B.Eng.; M.Eng.` with no degree-awarding university names.
  - `\submissionmonthyear` is currently `TODO Month Year` because no final submission month/year was provided.
- Declaration: **Pass**.
  - Manual page-counter commands and signature image overlay were removed.
  - Declaration is included in the table of contents and uses the conservative own-work wording.
- Acknowledgements: **Structurally pass, content incomplete**.
  - Included in the table of contents and numbered as Roman `ii`.
  - The compiled page has no visible placeholder text; the source contains only a TODO comment.

## ToC / List Status

- Table of contents: **Pass**.
  - Abstract and title page are not listed.
  - Declaration, Acknowledgements, TABLE OF CONTENTS, chapters, and Bibliography are listed.
  - Numbered chapter entries render as `CHAPTER 1 INTRODUCTION` style entries.
  - No duplicate List of Algorithms entry is present.
- Lists of figures/tables/algorithms: **Not included by default**.
  - No `figure`, `table`, or `algorithm` environments were found in the current included chapter files.
  - Enable `\includeListOfFigurestrue`, `\includeListOfTablestrue`, or `\includeListOfAlgorithmstrue` in `main.tex` when real content requires those lists.
- Abbreviations and symbols: **Not included by default**.
  - Demo entries were removed from their files.
  - Enable `\includeAbbreviationstrue` or `\includeSymbolstrue` in `main.tex` when final content exists.
- Appendices: **Not included by default**.
  - The existing appendix files contain placeholder/instructional content and are preserved but disabled via `\includeAppendicesfalse`.

## Bibliography Status

- Status: **Uncertain / content incomplete**.
- The bibliography heading appears in the PDF and continues Arabic numbering.
- The previous demo `\nocite{Gershun1939Light}` was removed.
- The final PDF currently has an empty bibliography because no citation commands are present in the included chapters. Add real citations or intentional bibliography entries before final submission.

## PDF Searchability / Font Embedding Status

- Text extraction: **Pass**.
  - `pdftotext -layout -f 1 -l 8 main.pdf -` extracted readable text from the PDF.
- Font embedding: **Pass**.
  - `pdffonts main.pdf` reports embedded, subsetted TeX Gyre TermesX fonts.
- Searchable PDF: **Pass** based on successful text extraction.

## Recommended Style Checks

- Body font: **Pass**. `newtxtext` provides a Times-like serif text font.
- Math font: **Pass**. `newtxmath` provides Times-like math fonts.
- Body size: **Pass**. `12pt` is enabled.
- Spacing: **Pass**. `onehalfspacing` is enabled.
- Chapter headings: **Adjusted**. The formal chapter prefix and title use compact centered bold `\Large` settings.
- Decorative colors: **Adjusted**. Formal metadata macros no longer wrap supervisor, department, faculty, group, or related values in red. Hyperlinks are black.

## Remaining Uncertainties

- The final submission month/year must replace `TODO Month Year` in `main.tex`.
- The abstract must be written by the author and checked to be 200--500 words.
- Acknowledgements content still needs to be supplied if that page is retained.
- The table of contents uses the requested `CHAPTER N TITLE` format, but very long chapter titles produce underfull line-break warnings. This is a visual/readability warning rather than a compilation failure.
- Bibliography content is empty until real citations or bibliography entries are added.
- Optional lists and appendices are disabled by default because the current files do not contain final content. Re-enable only when real content exists.
- `Publications/publications.tex`, `Covers/cover.tex`, and `Copyrights/copyright.tex` still contain legacy optional template material, but they are not included by the formal default PDF.
- This audit only checks the local LaTeX source and compiled PDF against the user-provided checklist. It does not verify external university workflow requirements or any rules outside that checklist.
