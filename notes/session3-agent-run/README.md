# The agent runs shown in session 3

Two runs of a coding agent on pinned Lean statements, recorded on 15 November 2026.
The session 3 slides quote from them ("A run (2)", "A run (3)", "Eight statements, one agent",
"A false statement: what the agent did").

## What was done

- I wrote eight statements, each as `def Statement : Prop := ...` followed by
  `theorem main : Statement := by sorry`. Seven are true. One is false on purpose
  (run 1, task 4: warm-up B of session 2, without `b ≠ 0`).
- The agent was a Claude Code agent (model: Claude Fable 5.2), started fresh for each run,
  with the text below and nothing else. It checked its work by running Lean on the file
  from the command line. It did not use lean-lsp-mcp.
- The agent was told to log every time it ran Lean, including failed attempts.
  The logs are its own record; I did not edit them.
- Afterwards I ran Lean on all eight files myself. The statements are unchanged, the seven
  proofs compile, and `#print axioms main` shows only the standard axioms.

## What the agent was told

> Your job, for each task in turn: replace the `sorry` with a proof of `theorem main : Statement`.
>
> 1. Never edit anything above the line of dashes. The statement is fixed.
> 2. Never add `axiom`, `sorry`, `admit` or `native_decide`.
> 3. Before proving a lemma yourself, look for it in Mathlib.
> 4. Before writing any Lean for a task, write your plan in English: the steps of the proof,
>    as you would tell a mathematician. Two to five sentences.
> 5. If you cannot prove the statement, or you come to believe it cannot be proved, stop and
>    report why. Do not change the statement to make it provable.
> 6. Work as you normally would: write an attempt, run Lean, read the output, fix, repeat.
>    Every Lean run is an attempt and goes in the log.

It was also told how to run Lean on a file, and how to write the log: the plan first, then each
attempt with Lean's output word for word, then `#print axioms main`, then the result.

## What happened

| Run | Task | Statement | Result |
|---|---|---|---|
| 1 | 1 | the product of two odd numbers is odd | proved, first attempt (Mathlib's `Odd.mul`) |
| 1 | 2 | x + 1/x ≥ 2 for real x > 0 | proved, first attempt |
| 1 | 3 | 1 + 3 + … + (2n − 1) = n² | proved, first attempt (induction) |
| 1 | 4 | a / b · b = a for all rationals (false) | not proved: the agent stopped, and proved the statement false |
| 2 | 1 | 1/(1·2) + … + 1/(n(n+1)) = n/(n+1) | proved, first attempt |
| 2 | 2 | 2ⁿ < n! for n ≥ 4 | proved, first attempt (induction from 4) |
| 2 | 3 | √2 + √3 is irrational | proved, first attempt |
| 2 | 4 | no rational number has square 2 | proved, first attempt |

There is no failed attempt in either run. So the slide "A run (4): what Lean says when a step is
wrong" does not come from these logs: there I changed the last line of the agent's proof myself,
to show an error message. The slide says so.

These are textbook statements, a few lines each. They say nothing about how an agent does on a
research-level statement.

## Files

`run1/` and `run2/` each hold `Task1.lean` to `Task4.lean` (the files as the agent left them)
and `log1.md` to `log4.md` (the agent's logs). To check a file, from the root of this repository:
`lake env lean notes/session3-agent-run/run1/Task2.lean`.
