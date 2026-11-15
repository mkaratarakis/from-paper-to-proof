# Task 2

Statement: `∀ n : ℕ, 4 ≤ n → 2 ^ n < n.factorial`

## Plan

Induction on `n` starting at `n = 4`. The base case is the numerical fact `2^4 = 16 < 24 = 4!`. For the step, assume `4 ≤ k` and `2^k < k!`; then `2^(k+1) = 2^k · 2` and `(k+1)! = (k+1) · k!`, and since `k + 1 ≥ 5 > 2` and `k! > 0`, we get `2^k · 2 < k! · 2 ≤ (k+1) · k!`.

Mathlib search before writing: I grepped Mathlib for a ready-made `2 ^ n < n !` (names like `two_pow_lt_factorial`, `pow_lt_factorial`, and the pattern itself). The nearest things are `Nat.eventually_pow_lt_factorial_sub` (only "for all large n", no explicit threshold) and `Nat.factorial_mul_pow_le_factorial : m ! * (m + 1) ^ n ≤ (m + n)!` (which with `m = 4` would give `24 · 5^n ≤ (4+n)!`, usable but more roundabout than the direct induction). So I do the induction directly, using Mathlib's `Nat.le_induction` for "induction from a lower bound" and `Nat.factorial_succ`, `Nat.factorial_pos`.

## Attempt 1

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro n hn
  induction n, hn using Nat.le_induction with
  | base => decide
  | succ k hk ih =>
    rw [pow_succ, Nat.factorial_succ]
    nlinarith [Nat.factorial_pos k]
```

```
(no output)
```

Lean accepted the file on the first run (exit code 0, nothing printed). Next I only append `#print axioms main` and run again.

## Axioms

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro n hn
  induction n, hn using Nat.le_induction with
  | base => decide
  | succ k hk ih =>
    rw [pow_succ, Nat.factorial_succ]
    nlinarith [Nat.factorial_pos k]

#print axioms main
```

```
'main' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Result

Proved in 1 attempt (2 Lean runs in total: the attempt, then the axioms run). Only the three standard axioms are used.
