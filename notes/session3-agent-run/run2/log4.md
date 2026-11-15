# Task 4

Statement: `¬ ∃ q : ℚ, q ^ 2 = 2`

## Plan

Suppose `q` is a rational number with `q² = 2`. Then `2 = q · q`, which says exactly that `2` is a square in `ℚ` (Mathlib's `IsSquare a` means `∃ r, a = r * r`). But `2` is not a square of a rational number, so this is a contradiction.

Mathlib search before writing: I grepped Mathlib for the statement in this exact shape (`q ^ 2 = 2`, `q * q = 2`) and found no lemma stated that way. The fact itself is in Mathlib in the `IsSquare` language: `Rat.isSquare_natCast_iff : IsSquare (n : ℚ) ↔ IsSquare n` and `Nat.Prime.not_isSquare`, and there is a `norm_num` extension that decides `IsSquare` for rational numerals (`Mathlib/Tactic/NormNum/IsSquare.lean`, tagged `@[norm_num @IsSquare ℚ _ _]`). So I get `¬ IsSquare (2 : ℚ)` from `norm_num` and feed it the witness `q` with `2 = q * q`, obtained from the hypothesis and `sq q : q ^ 2 = q * q`. (`irrational_sqrt_two` would be another way in, but it needs a detour through the real numbers.)

## Attempt 1

```lean
-- Your work goes below this line.

theorem main : Statement := by
  rintro ⟨q, hq⟩
  have h : ¬ IsSquare (2 : ℚ) := by norm_num
  exact h ⟨q, hq.symm.trans (sq q)⟩
```

```
(no output)
```

Lean accepted the file on the first run (exit code 0, nothing printed). Next I only append `#print axioms main` and run again.

## Axioms

```lean
-- Your work goes below this line.

theorem main : Statement := by
  rintro ⟨q, hq⟩
  have h : ¬ IsSquare (2 : ℚ) := by norm_num
  exact h ⟨q, hq.symm.trans (sq q)⟩

#print axioms main
```

```
'main' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Result

Proved in 1 attempt (2 Lean runs in total: the attempt, then the axioms run). Only the three standard axioms are used.
