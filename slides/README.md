# Slides on Overleaf

This zip holds the slides of all four sessions, the setup sheet, and the Lean files the slides read.

1. New Project → Upload Project → this zip.
2. Compiler: pdfLaTeX, the default. No shell escape is needed.
3. Menu → Main document: `session1.tex` to `session4.tex`, or `setup.tex`.

The fonts (Fira Sans and Fira Mono) come with TeX Live, so nothing needs to be installed.

Lean code is set with `listings` and `lstlean.tex`. `\lean{tag}` shows the code between `-- !begin tag` and `-- !end tag` of the session's Lean file (`\leanfile{Session1.lean}`); `\lean[highlightlines={1-3}]{tag}` puts a bar behind those lines. Inline code is `\lc{...}`, or `\lc|...|` if the code contains braces.

The master copy of everything is the repository `from-paper-to-proof`. After editing here, copy the changed files back there.
