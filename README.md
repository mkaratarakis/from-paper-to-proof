# From Paper to Proof: Formalizing Mathematics in Lean with AI

BGSMath graduate course, UPC Barcelona, November 2026. Michail Karatarakis.

Repository: https://github.com/mkaratarakis/from-paper-to-proof

Four sessions, each a lecture with live demonstrations in Lean. The exercises are done at home.

| Session | Date | Topic |
|---|---|---|
| 1 | 10 Nov | Lean and Mathlib: what formalizing means and does not mean; first proofs; finding things in Mathlib; reading a Lean statement |
| 2 | 12 Nov | From paper to Lean: writing definitions and statements; the usual mistakes; drafting statements with AI and checking them |
| 3 | 17 Nov | AI tools: what AI did this year; an agent proving a statement, live; checking what it hands back |
| 4 | 19 Nov | Your own theorem: statements sent in by participants, formalized live; how to do your own at home |

## What is here

```
BGSMath/          the Lean files: the code on the slides, exercises, solutions, the template, the demos
slides/           the slides (LaTeX, pdfLaTeX) and the setup sheet for participants
notes/            the run sheet for session 1
pdf/              the compiled slides and the setup sheet
lakefile.toml     makes this folder a Lean project with Mathlib
overleaf-zip.sh   builds the zip to upload to Overleaf
```

## The Lean files

This folder is a Lean project with Mathlib, pinned to Mathlib `v4.34.1` (Lean `v4.34.1`).

1. Install Lean: VS Code, the *Lean 4* extension, and its setup guide. `slides/setup.tex` has the steps.
2. Get this folder: `git clone https://github.com/mkaratarakis/from-paper-to-proof`, or *Code → Download ZIP* on GitHub.
3. In a terminal, in this folder: `lake exe cache get`. This downloads the compiled Mathlib (a few GB) instead of building it.
4. Open **this folder** in VS Code (File → Open Folder), then `BGSMath/Test.lean`. Click on `#eval 2 + 2`: the infoview shows `4`.

| File | What it is |
|---|---|
| `Session1.lean` … `Session4.lean` | every code block on the slides, cut out by tag (`-- !begin tag` … `-- !end tag`) |
| `Exercises1.lean` … `Exercises3.lean` | the exercises, with `sorry` to fill in |
| `Solutions1.lean` … `Solutions3.lean` | the solutions, added after each session |
| `MyTheorem.lean` | the template for your own theorem (session 4) |
| `Demo1.lean` | the live demos of session 1, commented out |
| `Test.lean` | checks that Lean and Mathlib work |

`lake build` checks every file. Expected warnings: `sorry` in the exercises, in the template and in the FLT statement on the slides; the two unused hypotheses of `draft` in `Session2.lean`, shown on a slide; and the deliberately bad proofs (an `axiom`, a buried `sorry`, `native_decide`, unused hypotheses) in `Session3.lean`, `Exercises3.lean` and `Solutions3.lean`, which are there for the audit slides and exercises.

## The slides

`slides/session1.tex` … `session4.tex`, and `setup.tex`. They compile with pdfLaTeX, twice:

```
cd slides && pdflatex session1.tex && pdflatex session1.tex
```

The Lean code on the slides is read from `BGSMath/`, so the slides only ever show code that compiles. The shared look is `slides/bgsmathlean.sty`; the Lean highlighting is `slides/lstlean.tex`.

**Overleaf.** Run `./overleaf-zip.sh`, then on Overleaf: New Project → Upload Project → the zip. The compiler is pdfLaTeX, the default; set the main document to `session1.tex` (or another session, or `setup.tex`). If you edit on Overleaf, download the project and copy the changed files back here: this folder is the master copy.
