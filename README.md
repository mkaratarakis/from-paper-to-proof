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
slides/           the slides of the four sessions and the setup sheet, as PDFs
notes/            the run sheets for sessions 1 and 2
lakefile.toml     makes this folder a Lean project with Mathlib
```

## The Lean files

This folder is a Lean project with Mathlib, pinned to Mathlib `v4.34.1` (Lean `v4.34.1`).

1. Install Lean: VS Code, the *Lean 4* extension, and its setup guide. `slides/BGSMath-Lean-setup.pdf` has the steps.
2. Get this folder: `git clone https://github.com/mkaratarakis/from-paper-to-proof`, or *Code → Download ZIP* on GitHub.
3. In a terminal, in this folder: `lake exe cache get`. This downloads the compiled Mathlib (a few GB) instead of building it.
4. Open **this folder** in VS Code (File → Open Folder), then `BGSMath/Test.lean`. Click on `#eval 2 + 2`: the infoview shows `4`.

| File | What it is |
|---|---|
| `Session1.lean` … `Session4.lean` | every code block on the slides, cut out by tag (`-- !begin tag` … `-- !end tag`) |
| `Exercises1.lean` … `Exercises3.lean` | the exercises, with `sorry` to fill in |
| `Solutions1.lean` … `Solutions3.lean` | the solutions, added after each session |
| `MyTheorem.lean` | the template for your own theorem (session 4) |
| `Demo1.lean`, `Demo2.lean` | the live demos of sessions 1 and 2, commented out |
| `Test.lean` | checks that Lean and Mathlib work |

`lake build` checks every file. Expected warnings: `sorry` in the exercises, in the template, in the FLT statement on the slides and in the three warm-up statements of `Session2.lean`; the unused hypotheses of the AI drafts `draft1` and `draft` in `Session2.lean`, the first shown on a slide; and the deliberately bad proofs (an `axiom`, a buried `sorry`, `native_decide`, unused hypotheses) in `Session3.lean`, `Exercises3.lean` and `Solutions3.lean`, which are there for the audit slides and exercises.

## The slides

The slides of each session and the setup sheet are in `slides/`, as PDFs. The Lean code on the slides is read from `BGSMath/`, so the slides only ever show code that compiles.
