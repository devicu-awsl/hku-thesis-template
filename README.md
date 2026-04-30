# HKU MSc Dissertation LaTeX Template

An unofficial LaTeX template for the HKU MSc Final Report / Dissertation, strictly following the DOCX template formatting guidelines. 

[Updated on 18 April 2026] Also accessed in Documentation folder in Github.

Original - Dissertation report (MS word template, Arthor: Dr. Andrew Ho Chun WU): https://docs.google.com/document/d/1-CYaa02tVP_KbrOG3NTDs8q2SehJ-lYF/edit?usp=sharing&ouid=107516997935154803843&rtpof=true&sd=true

The recommended length for a dissertation is 25,000 words. However, this can vary depending on the specific research area. **Ultimately, the focus should be on the quality and depth of content rather than the word count**. Students are advised to discuss with their supervisors what should be included in their dissertation or project reports.

**Plagiarism:** single source < 1%. 
If you have figures, DO NOT DIRECTLY PASTE FIGURES FROM OTHER SOURCES; they should be re-drawn (even if cited). Otherwise, just simply don't include the figure.

**GenAI:** Less than 20%. AI scores under 20% are suppressed by Turnitin. If your AI percentage is higher than 20%, consult your supervisor for his/her opinion as there are recent literature suggesting Turnitin may misclassify non-native English writing as AI-generated. We will also reach out to your supervisor if needed.

---
## Preview

[To do]

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
│   ├── cover.tex                  ← ★ THESIS cover page
│   ├── abstract.tex               ← Abstract
│   ├── declaration.tex            ← Declaration of authorship
│   ├── acknowledgment.tex         ← Acknowledgements
│   ├── glossary.tex               ← Glossary & acronym definitions
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
├── references.tex                 ← Bibliography entries (IEEE style)
└── appendices.tex                 ← Appendix chapters
```

---

## Quick Start

### 1. Edit Your Thesis Details

Open **`Preliminary/cover.tex`** — this is the only file you need to edit for
your personal details:

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

This template **requires XeLaTeX**. pdfLaTeX will not work. 

> If using pdfLaTeX need to change "Font" section in `Config/config.tex` file to the following code and delete the `.latexmkrc` file.
>
> ```tex
> \usepackage[utf8]{inputenc}
> \usepackage[T1]{fontenc}
> \usepackage{times}
> ```

| Platform    | How to set XeLaTeX                              |
|-------------|-------------------------------------------------|
| **Overleaf** | Menu (top-left) → Compiler → **XeLaTeX**       |
| **Prism**   | XeLaTeX is the default — no change needed       |

### 3. Compile

**Overleaf / Prism** — click Compile. Glossaries are handled automatically.

### 4. Write Your Content

- Edit chapter files in `Chapters/`
- Add glossary terms and acronyms in `Preliminary/glossary.tex`
- Add references to `references.tex`
- Place figure files in `Figures/`

---

## Formatting Specifications

| Property        | Value                                         |
|-----------------|-----------------------------------------------|
| Paper           | A4                                            |
| Margins         | L=3.17cm  R=3.17cm  T=2.54cm  B=2.54cm       |
| Font            | Times New Roman 12pt (via `fontspec`)         |
| Line spacing    | Double (2.0)                                  |
| Chapter heading | 16pt bold                                     |
| Section heading | 14pt bold                                     |
| Subsection      | 12pt bold italic                              |
| Numbering       | Chapter-based: Table 2.1, Fig. 2.1, Eq. 2.1  |
| References      | IEEE style                                    |

---

## Dates

| Location              | Command               | Example Output |
| --------------------- | --------------------- | -------------- |
| Cover page            | `\monthandyear\today` | MM YYYY        |
| Declaration signature | `\fulldate\today`     | DD MM YYYY     |

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

Replace `Figures/Signature.png` with your own signature (transparent PNG, ~500px wide recommended). It overlays the signature line in`Preliminary/declaration.tex`. To use a plain underline instead, comment out the `tikzpicture` block in that file.

---

## Notes

- The compiler must be **XeLaTeX** — pdfLaTeX will fail due to `fontspec`.

- On systems without Times New Roman (e.g. local Linux), the template
  automatically falls back to TeX Gyre Termes (a metrically identical substitute).
  On Overleaf and Prism, Times New Roman loads directly.

## 

