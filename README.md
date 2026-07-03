# HKU MSc Dissertation LaTeX Template

An unofficial LaTeX template for the HKU MSc Final Report / Dissertation, strictly following the formatting of the official Word template.

The official Word template (author: Dr. Andrew Ho Chun Wu, updated 18 April 2026) is available [on Google Docs](https://docs.google.com/document/d/1-CYaa02tVP_KbrOG3NTDs8q2SehJ-lYF/edit?usp=sharing&ouid=107516997935154803843&rtpof=true&sd=true) and in the `Documentation/` folder of this repository.

## Submission Guidelines

- **Length:** The recommended length for a dissertation is 25,000 words, though this varies by research area. **Ultimately, the focus should be on the quality and depth of content rather than the word count.** Discuss with your supervisor what should be included.
- **Plagiarism:** similarity to any single source must be below 1%. If you use figures, **do not paste figures directly from other sources** — redraw them yourself (even when cited), or omit them entirely.
- **GenAI:** the AI-generated score must be below 20% (scores under 20% are suppressed by Turnitin). If your score exceeds 20%, consult your supervisor — recent literature suggests Turnitin may misclassify non-native English writing as AI-generated. Your supervisor may also be contacted if needed.

---

## Preview

A compiled sample is available at `Documentation/main.pdf`.

---

## File Structure

```
.
├── main.tex                       ← Master file (document body only — no editing needed)
│
├── Config/
│   └── config.tex                 ← All packages & global settings
│
├── Preliminary/
│   ├── cover.tex                  ← ★ Thesis details + cover page (EDIT THIS)
│   ├── abstract.tex               ← Abstract
│   ├── declaration.tex            ← Declaration of authorship
│   ├── acknowledgment.tex         ← Acknowledgements
│   └── symbols.tex                ← List of symbols
│
├── Chapters/
│   ├── chapter01.tex              ← Chapter 1: Introduction
│   ├── chapter02.tex              ← Chapter 2: Literature Review
│   ├── chapter03.tex              ← Chapter 3: Proposed Methodology
│   ├── chapter04.tex              ← Chapter 4: Experimental Results
│   └── chapter05.tex              ← Chapter 5: Conclusion
│
├── Figures/
│   └── Signature.png              ← Replace with your own signature image
│
├── Documentation/                 ← Official Word template + sample PDF
├── references.tex                 ← Bibliography entries (IEEE style)
├── appendices.tex                 ← Appendix chapters
└── .latexmkrc                     ← Forces XeLaTeX for latexmk / Overleaf
```

---

## Quick Start

### 1. Edit Your Thesis Details

Open **`Preliminary/cover.tex`** — this is the only file you need to edit for your personal details:

```latex
\newcommand{\ThesisTitle}{Your Thesis Title Here}
\newcommand{\AuthorName}{YOUR NAME}
\newcommand{\StudentID}{3036XXXXXX}
\newcommand{\PreviousDegree}{B.Eng.~(Your University)}
\newcommand{\DegreeName}{Master of Science in Engineering}
\newcommand{\Specialisation}{(Your Specialisation)}
\newcommand{\Department}{Your Department}
\newcommand{\SupervisorName}{Prof. Your Supervisor}
```

`\SubmissionDate` updates **automatically** on every compile (e.g. `April 2026`).

### 2. Set the Compiler to XeLaTeX

This template **requires XeLaTeX** (for `fontspec` / Times New Roman). pdfLaTeX will not work out of the box.

| Platform     | How to set XeLaTeX                        |
|--------------|-------------------------------------------|
| **Overleaf** | Menu (top-left) → Compiler → **XeLaTeX**  |
| **Prism**    | XeLaTeX is the default — no change needed |
| **Local**    | Run `latexmk main.tex` (the included `.latexmkrc` selects XeLaTeX automatically) |

> **pdfLaTeX fallback (not recommended):** replace the "Font" section of `Config/config.tex` with the lines below and delete `.latexmkrc`:
>
> ```latex
> \usepackage[utf8]{inputenc}
> \usepackage[T1]{fontenc}
> \usepackage{times}
> ```

### 3. Compile

On **Overleaf / Prism**, simply click Compile. Locally, run `latexmk main.tex` (compile twice if cross-references show as `??`).

### 4. Write Your Content

- Edit chapter files in `Chapters/`
- Add references to `references.tex`
- Place figure files in `Figures/`
- Edit the list of symbols in `Preliminary/symbols.tex`

---

## Formatting Specifications

These match the official Word template (note: this is the department's house style — it is neither APA nor IEEE page geometry, although references follow IEEE citation style).

| Property        | Value                                        |
|-----------------|----------------------------------------------|
| Paper           | A4                                           |
| Margins         | L=3.17cm R=3.17cm T=2.54cm B=2.54cm          |
| Font            | Times New Roman 12pt (via `fontspec`)        |
| Line spacing    | Double (2.0)                                 |
| Chapter heading | 16pt bold                                    |
| Section heading | 14pt bold                                    |
| Subsection      | 12pt bold italic                             |
| Header/Footer   | Chapter title in header with 0.4pt rule; centred page number in footer |
| Numbering       | Chapter-based: Table 2.1, Fig. 2.1, Eq. (2.1) |
| References      | IEEE citation style, numbered `[1]`          |

---

## Dates

| Location              | Command               | Example Output  |
|-----------------------|-----------------------|-----------------|
| Cover page            | `\monthandyear\today` | April 2026      |
| Declaration signature | `\fulldate\today`     | 28th April 2026 |

Both auto-update on every compile via the `datetime` package in `Config/config.tex`.

---

## Adding a New Chapter

1. Create `Chapters/chapter06.tex`
2. Add `\input{Chapters/chapter06}` in `main.tex` after `chapter05`

---

## Adding References

Add entries to `references.tex` in IEEE format:

```latex
\bibitem{key}
A.~Author, ``Title of paper,''
\emph{Journal Name}, vol.~X, no.~Y, pp.~Z--ZZ, 2026.
```

Cite in text with `\cite{key}`.

---

## Signature Image

Replace `Figures/Signature.png` with your own signature (transparent PNG, ~500 px wide recommended). It overlays the signature line in `Preliminary/declaration.tex`. To use a plain underline instead, comment out the `tikzpicture` block in that file.

---

## Notes

- The compiler must be **XeLaTeX** — pdfLaTeX will fail due to `fontspec`.
- On systems without Times New Roman (e.g. a plain Linux install), the template automatically falls back to TeX Gyre Termes, a metrically compatible substitute. On Overleaf and Prism, Times New Roman loads directly.
- Page breaks are permitted between consecutive headings (a small patch in `Config/config.tex`), so a draft full of empty placeholder sections still paginates correctly.
