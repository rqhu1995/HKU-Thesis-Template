# HKU Thesis Template Audit

Date: 2026-06-17  
Scope: Local LaTeX project only. No web browsing was used. The local 2019 HKU Graduate School guide PDF supplied by the user was inspected for style/sample-page evidence.

## Files inspected

- `main.tex`
- `HKUThesis.cls`
- `Titlepage/library_titlepage.tex`
- `Titlepage/titlepage.tex`
- `Abstract/abstract.tex`
- `Declaration/declaration.tex`
- `Acknowledgments/acknowledgments.tex`
- `Abbreviations/abbreviations.tex`
- `Symbols/symbols.tex`
- `Chapters/Chapter1.tex` through `Chapters/Chapter6.tex`
- `Appendices/AppendixA.tex` through `Appendices/AppendixC.tex`
- `thesis.bib`
- `README.md`
- `main.log`, `main.pdf`
- Local guide PDF: `HKU Graduate School - 2019 - Preparing and Submitting Your Thesis A Guide for MPhil and PhD Students.pdf`

## Files changed

- `HKUThesis.cls`
  - Made numbered chapter titles bold, centered, and closer to the senior-thesis sample spacing.
  - Kept `CHAPTER X` on a separate centered line, in uppercase bold text matching the chapter title scale.
  - Added explicit serif heading hierarchy: section `\large` bold, subsection body-size bold, subsubsection body-size regular, paragraph body-size regular, subparagraph body-size italic.
  - Replaced oversized/decorative declaration and acknowledgements headings with restrained bold serif front-matter headings.
  - Reduced `\symboltitle` from `\LARGE` to `\large`.
  - Forced the final abstract page style to `empty` so multi-page abstracts do not pick up a footer page number.
- `Titlepage/titlepage.tex`
  - Rebuilt the formal title page as a single unnumbered `titlepage` using restrained title/name sizing.
  - Fixed the previous overflow where the date spilled onto a separate numbered roman page.
- `Abstract/abstract.tex`
  - Updated the abstract word-count argument from `340` to `341`, matching `texcount`.
- `HKU_THESIS_TEMPLATE_AUDIT.md`
  - Removed the stale prior report and regenerated this audit from scratch.
- `main.pdf`
  - Recompiled output PDF.

## Compilation command used

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

## Compilation result

- Result: pass. `latexmk` completed successfully and produced `main.pdf`.
- Final PDF: 42 pages.
- `pdfinfo main.pdf` reports A4 page size: `595.276 x 841.89 pts`.
- `pdffonts main.pdf` reports embedded Times-like text fonts (`TeXGyreTermes` / `TeXGyreTermesX`) and NewTX math/symbol fonts.
- `pdftotext main.pdf -` confirms text is extractable; the PDF is searchable/text-embedded, not image-only.
- No unresolved citations, undefined references, missing files, empty bibliography warning, or biblatex rerun warning remain in the final log.
- Remaining nonfatal log warnings:
  - Overfull boxes in the sample abstract content at `Abstract/abstract.tex` lines 7-8 and 19-20.
  - One overfull table-of-contents line from a very long Chapter 5 title.
  - One overfull alignment in the sample symbols table.

## Mandatory checks

| Check | Status | Notes |
| --- | --- | --- |
| Page size and margins | Pass | `main.tex` uses A4 paper with `left=3.5cm`, `right=3.6cm`, `bindingoffset=.5cm`, `top=2.5cm`, and `bottom=2.5cm`. In the retained two-sided layout, both physical left and right margins are at least 35 mm. |
| One-sided or two-sided layout | Pass | Two-sided layout was kept. This is acceptable, and no margin problem was found. |
| Abstract presence and length | Pass | `Abstract/abstract.tex` exists. `texcount Abstract/abstract.tex -sum -1` reports 341 words, within 200-500. The printed word-count line now says `An abstract of 341 words`. |
| Abstract placement and numbering | Fixed, with caveat | The formal abstract appears before the formal title page, is not in the table of contents, and no page number appears on its pages. Caveat: a user-requested library-style reference title page currently precedes the abstract. Remove or confirm this page before formal submission. |
| Abstract required front-page structure | Pass | The abstract heading includes thesis title, author, Doctor of Philosophy, The University of Hong Kong, and month/year from existing macros. |
| Title page | Fixed | The formal title page follows the abstract, fits on one unnumbered page, and contains title, author, degree, university, and month/year. |
| Front matter order and pagination | Pass, with caveat | Formal sequence is abstract, formal title page, declaration, acknowledgements, contents, lists, abbreviations/symbols, main text. Declaration starts roman `i`; Chapter 1 starts Arabic `1`; appendices and bibliography continue Arabic numbering. Caveat: the optional reference page before the abstract is outside the strict formal sequence. |
| Declaration | Pass | Declaration page exists and states that the thesis represents the candidate's own work. It is the first numbered front-matter page. |
| Table of contents and lists | Pass | TOC excludes abstract and formal title page, includes declaration/acknowledgements/lists and main chapters. Lists of figures/tables/algorithms are present because the template calls them. |
| Bibliography/reference list | Pass | `biblatex` bibliography appears in the PDF. `\nocite{Gershun1939Light}` keeps a sample bibliography item present while the chapter draft has no real citations. |
| PDF output | Pass | `pdfinfo`, `pdffonts`, and `pdftotext` checks passed. Fonts are embedded and text is extractable. |

## Recommended style checks

| Check | Status | Notes |
| --- | --- | --- |
| Body font | Pass | `newtxtext` provides a Times-like serif body font. |
| Equation font | Pass | `newtxmath` provides Times-like math fonts for equations and symbols. |
| Code-style text font | Adjusted earlier | `\ttdefault` is redirected to `\rmdefault`, avoiding a separate monospaced font in the compiled PDF. |
| Body font size | Pass | Document class uses `12pt`, which is within the guide's readable 10-12 pt range and matches the user's preference. |
| Line spacing | Pass | `onehalfspacing` is enabled. |
| Chapter title style | Fixed | Numbered chapter openings now follow the user's senior-thesis sample more closely: uppercase centered `CHAPTER X`, then centered bold chapter title with reduced top whitespace. |
| Section heading hierarchy | Fixed | Section/subsection/subsubsection/paragraph levels now use explicit Times-like serif sizes. They are slightly more restrained than the earlier guide-sample hierarchy to better match the senior-thesis screenshot. |
| Front-matter heading style | Fixed | Declaration and acknowledgements headings are no longer oversized/decorative. |
| Formal title page size | Fixed | Formal title page now uses restrained title/name sizing and fits on one unnumbered page. |
| Hyperlink appearance | Pass | Hyperlinks remain clickable but print in normal black text. |
| Decorative material | Uncertain by design | The library-style reference title page is intentionally present for the user's reference. It should be removed or confirmed before formal submission. |

## External submission/workflow items the user must still handle

- Notice of intention to submit thesis at least 3 months before expected submission.
- Originality/self-check before formal submission.
- Supervisor readiness proforma.
- Thesis submission form.
- Examination fee receipt.
- Dataset submission, where applicable.
- Bibliography upload during finalized online thesis submission.
- Final searchable PDF for electronic thesis submission.

## Remaining uncertainties

- The user-requested library-style page before the abstract may be added by the Library in senior students' final records, but this was not verified from the local LaTeX project. Treat it as a removable reference page before formal submission.
- The abstract currently contains template/sample wording. Replace it with the final thesis abstract, rerun `texcount Abstract/abstract.tex -sum -1`, and update the optional argument in `\begin{abstract}[...]`.
- The month/year currently comes from `\monthyeardate\today`, producing `June, 2026` at compile time. Confirm whether the final thesis should use the final submission month/year instead of the compile date.
- Optional files not included in `main.tex`, such as the old decorative cover/dedication/publications pages, were inspected but not treated as part of the compiled thesis. Recheck them if they are re-enabled.
- The remaining overfull boxes are nonfatal but should be revisited after real chapter/abstract content replaces the current placeholders and long all-caps chapter titles are finalized.
