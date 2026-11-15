# Task 1

Statement: `∀ n : ℕ, ∑ i ∈ Finset.range n, (1 : ℚ) / ((i + 1) * (i + 2)) = n / (n + 1)`

## Plan

This is a telescoping sum, proved by induction on `n`. For `n = 0` both sides are `0`. For the step, the sum up to `k + 1` is the sum up to `k` plus the new term `1 / ((k+1)(k+2))`, so it is enough to check the identity of fractions `(k+1)/(k+2) = k/(k+1) + 1/((k+1)(k+2))`, which holds after clearing denominators (both `k+1` and `k+2` are non-zero).

Mathlib search before writing: I grepped Mathlib for the sum itself (`(i + 1) * (i + 2)`) and found no ready-made lemma for it. Mathlib does have the general induction principle for sums over `Finset.range`, `Finset.sum_range_induction (f s : ℕ → M) (base : s 0 = 0) (n : ℕ) (step : ∀ k < n, s (k + 1) = s k + f k) : ∑ k ∈ Finset.range n, f k = s n`, which packages exactly the induction above, so I use that with `s n = n / (n + 1)` and prove the step with `push_cast`, `field_simp`, `ring`.

## Attempt 1

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro n
  exact Finset.sum_range_induction _ (fun m : ℕ => (m : ℚ) / (m + 1)) (by simp) n
    (fun k _ => by
      push_cast
      field_simp
      ring)
```

```
(no output)
```

Lean accepted the file on the first run (exit code 0, nothing printed). Next I only append `#print axioms main` and run again.

## Axioms

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro n
  exact Finset.sum_range_induction _ (fun m : ℕ => (m : ℚ) / (m + 1)) (by simp) n
    (fun k _ => by
      push_cast
      field_simp
      ring)

#print axioms main
```

```
'main' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Result

Proved in 1 attempt (2 Lean runs in total: the attempt, then the axioms run). Only the three standard axioms are used.
