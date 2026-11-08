#!/bin/sh
# Builds FromPaperToProof-overleaf.zip: the slides, the setup sheet and the Lean files
# they read, in one flat folder, which is how Overleaf wants them.
# Upload it with New Project -> Upload Project; the compiler is pdfLaTeX.
cd "$(dirname "$0")" || exit 1
rm -f FromPaperToProof-overleaf.zip
zip -X -j -q FromPaperToProof-overleaf.zip slides/*.tex slides/*.sty slides/README.md BGSMath/*.lean
unzip -l FromPaperToProof-overleaf.zip | tail -1
