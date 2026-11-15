# Task 4

Statement: `∀ a b : ℚ, a / b * b = a`

## Plan

On paper this is "dividing by b and multiplying back gives a", which is true when b ≠ 0, and
the Mathlib lemma for that case is `div_mul_cancel₀` (it needs the hypothesis `b ≠ 0`).
But the pinned statement has no hypothesis `b ≠ 0`: it quantifies over all rationals b,
including b = 0. In Lean/Mathlib division by zero is defined and equals zero, so for b = 0
the left side is a / 0 * 0 = 0, and the claim would say 0 = a for every a. Taking a = 1,
b = 0 the statement reads 0 = 1, which is false. So, reading the statement and before writing
any Lean, I believe it cannot be proved as it stands, and I do not plan a proof attempt.
Under rule 5 I stop here and only collect evidence: ask Lean to compute `(1 : ℚ) / 0 * 0`
with `#eval`, and check in Lean that the pinned `Statement` itself is refutable
(a proof of `¬ Statement` from the instance a = 1, b = 0). I will not change the statement
and I leave `theorem main` exactly as it was given.

Mathlib search: the true version of this fact is in Mathlib as `div_mul_cancel₀`
(`a / b * b = a` given `b ≠ 0`); it cannot be applied here because the statement gives no
such hypothesis. The convention `a / 0 = 0` is Mathlib's `div_zero`.

## Attempt 1

This is an evidence run, not a proof attempt: I made no attempt to prove `main`, and its
`sorry` is the one that was in the file when I received it. I added only the lines after it.

```lean
-- Your work goes below this line.

theorem main : Statement := by
  sorry

-- Evidence that `Statement` is false (project rule 5). `main` above is left exactly as given.
#eval ((1 : ℚ) / 0 * 0)

theorem statement_is_false : ¬ Statement := by
  intro h
  have h1 := h 1 0
  norm_num at h1

#print axioms statement_is_false
```

```
Task4.lean:10:8: warning: declaration uses `sorry`
0
'statement_is_false' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Reading the output: the warning on line 10 is `main`, still unproved (as given). The `0` is
Lean's value for `(1 : ℚ) / 0 * 0`, so with a = 1, b = 0 the statement claims 0 = 1. Lean
accepted `statement_is_false : ¬ Statement` with no error, and it depends only on the three
standard axioms (no `sorryAx`), so the pinned statement is formally refuted, not merely
unproved by me.

## Result

Not proved, and it cannot be: the statement is false. Counterexample a = 1, b = 0: Lean
computes `(1 : ℚ) / 0 * 0 = 0`, which is not 1, and Lean checks a proof of `¬ Statement`.
I stopped under rule 5 after one evidence run and did not change the statement; it would
become true (by `div_mul_cancel₀`) if the hypothesis `b ≠ 0` were added, but that is a
decision for whoever owns the statement. `Task4.lean` still contains the original `sorry`
in `main`, and I did not append `#print axioms main` because there is no proof of `main`.
