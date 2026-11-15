# Task 3

Statement: `Irrational (Real.sqrt 2 + Real.sqrt 3)`

## Plan

Square the number: `(√2 + √3)² = 2 + 3 + 2·√2·√3 = 5 + 2·√6`. The number `√6` is irrational because `6` is not a perfect square, and adding a rational (`5`) and multiplying by a non-zero rational (`2`) keep a number irrational, so `5 + 2·√6` is irrational. Finally, if a power of a real number is irrational then the number itself is irrational (a power of a rational is rational), so `√2 + √3` is irrational.

Mathlib search before writing: I grepped Mathlib (and its Archive and Counterexamples folders) for the statement itself (`sqrt 2 + sqrt 3`, `√2 + √3`, `sqrt_two_add`) and found nothing. The pieces are all there in `Mathlib/NumberTheory/Real/Irrational.lean`: `Irrational.of_pow : ∀ n : ℕ, Irrational (x ^ n) → Irrational x`, `Irrational.ratCast_add (q : ℚ) (h : Irrational x) : Irrational (q + x)`, `Irrational.ratCast_mul (h : Irrational x) {q : ℚ} (hq : q ≠ 0) : Irrational (q * x)`, and `irrational_sqrt_natCast_iff : Irrational (√n) ↔ ¬IsSquare n`. Mathlib also has a `norm_num` extension for goals of the form `Irrational (Real.sqrt _)` (`Mathlib/Tactic/NormNum/Irrational.lean`), so I try `norm_num` for `Irrational (√6)`. For the square roots: `Real.sq_sqrt (h : 0 ≤ x) : √x ^ 2 = x` and `Real.sqrt_mul (hx : 0 ≤ x) (y : ℝ) : √(x * y) = √x * √y`.

## Attempt 1

```lean
-- Your work goes below this line.

theorem main : Statement := by
  have h6 : Irrational (Real.sqrt 6) := by norm_num
  have hsq : (Real.sqrt 2 + Real.sqrt 3) ^ 2 = ((5 : ℚ) : ℝ) + ((2 : ℚ) : ℝ) * Real.sqrt 6 := by
    have h2 : Real.sqrt 2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
    have h3 : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
    have h6' : Real.sqrt 6 = Real.sqrt 2 * Real.sqrt 3 := by
      rw [← Real.sqrt_mul (by norm_num)]
      norm_num
    rw [h6']
    push_cast
    linear_combination h2 + h3
  have h5 : Irrational (((5 : ℚ) : ℝ) + ((2 : ℚ) : ℝ) * Real.sqrt 6) :=
    (h6.ratCast_mul (q := 2) (by norm_num)).ratCast_add 5
  rw [← hsq] at h5
  exact h5.of_pow 2
```

```
(no output)
```

Lean accepted the file on the first run (exit code 0, nothing printed). Next I only append `#print axioms main` and run again.

## Axioms

```lean
-- Your work goes below this line.

theorem main : Statement := by
  have h6 : Irrational (Real.sqrt 6) := by norm_num
  have hsq : (Real.sqrt 2 + Real.sqrt 3) ^ 2 = ((5 : ℚ) : ℝ) + ((2 : ℚ) : ℝ) * Real.sqrt 6 := by
    have h2 : Real.sqrt 2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
    have h3 : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
    have h6' : Real.sqrt 6 = Real.sqrt 2 * Real.sqrt 3 := by
      rw [← Real.sqrt_mul (by norm_num)]
      norm_num
    rw [h6']
    push_cast
    linear_combination h2 + h3
  have h5 : Irrational (((5 : ℚ) : ℝ) + ((2 : ℚ) : ℝ) * Real.sqrt 6) :=
    (h6.ratCast_mul (q := 2) (by norm_num)).ratCast_add 5
  rw [← hsq] at h5
  exact h5.of_pow 2

#print axioms main
```

```
'main' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Result

Proved in 1 attempt (2 Lean runs in total: the attempt, then the axioms run). Only the three standard axioms are used.
