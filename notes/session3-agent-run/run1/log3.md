# Task 3

Statement: `∀ n : ℕ, ∑ i ∈ Finset.range n, (2 * i + 1) = n ^ 2`

## Plan

The sum of the first n odd numbers is n². Proof by induction on n. For n = 0 the sum is
empty and 0² = 0. For the step, split off the last term with `Finset.sum_range_succ`:
the sum up to n + 1 is (sum up to n) + (2n + 1) = n² + 2n + 1 = (n + 1)², using the induction
hypothesis and `ring`. By rule 3 I first look in Mathlib for this identity (a name such as
`Finset.sum_range_odd` or similar); if it is there I use it directly.

Mathlib search before attempt 1. I grepped Mathlib (and its Archive and MathlibTest folders)
for the identity by text (`∑ i ∈ range n, (2 * i + 1)`, `2 * i + 1) = n ^ 2`, `= n * n`) and
by name (`sum_range_odd`, `sum_odd`, `sum_range_.*odd`). No hit for the identity itself; the
only text match was an unrelated intermediate step in `Analysis/SpecialFunctions/Log/Deriv.lean`.
What Mathlib does have is Gauss' formula, `Finset.sum_range_id_mul_two :
(∑ i ∈ range n, i) * 2 = n * (n - 1)` and `Finset.sum_range_id` (Algebra/BigOperators/Intervals.lean).
Those use subtraction and division on ℕ, so deriving the odd-number sum from them would be
more awkward than the three-line induction. As for Task 2, this is a search, not a proof of
absence. I go with the induction of the plan, using Mathlib's `Finset.sum_range_succ`.

## Attempt 1

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro n
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ, ih]
    ring
```

```
(no output)
```

Lean accepts it on the first run.

## Axioms

File below the dashes at this run:

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro n
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ, ih]
    ring

#print axioms main
```

```
'main' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Result

Proved in 1 attempt (plus the axiom run), by induction. Only the three standard axioms are used.
