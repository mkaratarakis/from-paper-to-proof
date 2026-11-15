# Task 2

Statement: `∀ x : ℝ, 0 < x → 2 ≤ x + 1 / x`

## Plan

For x > 0 the claim 2 ≤ x + 1/x is equivalent, after multiplying by x, to 2x ≤ x² + 1,
that is 0 ≤ (x − 1)², which holds because a square is non-negative. In Lean: introduce x and
hx, rewrite x + 1/x as (x² + 1)/x using x ≠ 0 (`field_simp`), turn `2 ≤ (x² + 1)/x` into
`2 * x ≤ x² + 1` with `le_div_iff₀ hx`, and close with `nlinarith [sq_nonneg (x - 1)]`.
By rule 3 I first check whether Mathlib already has the inequality itself (something like
"two ≤ a + a⁻¹"); if so I use it and only convert `1 / x` to `x⁻¹`.

Mathlib search before attempt 1. I grepped the Mathlib sources for a ready-made lemma, with
these patterns: `two_le_add_inv`, `add_inv_ge_two`, `two_le_add_one_div`, `2 ≤ a + a⁻¹`,
`2 ≤ x + x⁻¹`, `2 ≤ a + 1 / a`, `2 ≤ x + 1 / x` (no hits); then
`two_le.*inv|inv.*two_le|add_inv_le|le_add_inv|two_le_add` (only an unrelated localization
lemma `mul_add_inv_left`); then `self_add_inv|add_inv_self|a + a⁻¹|x + x⁻¹` (only `cosh_log`
and a comment in Dickson.lean). One of these greps first failed for a shell reason (zsh
rejected my `--include=*.lean` glob) and I re-ran it without the glob. I did not find the
inequality as a named lemma. That is a search by name and by text, not a proof that Mathlib
lacks it. So I prove it directly, as in the plan.

## Attempt 1

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro x hx
  have hx0 : x ≠ 0 := ne_of_gt hx
  have h : x + 1 / x = (x ^ 2 + 1) / x := by
    field_simp
  rw [h, le_div_iff₀ hx]
  nlinarith [sq_nonneg (x - 1)]
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
  intro x hx
  have hx0 : x ≠ 0 := ne_of_gt hx
  have h : x + 1 / x = (x ^ 2 + 1) / x := by
    field_simp
  rw [h, le_div_iff₀ hx]
  nlinarith [sq_nonneg (x - 1)]

#print axioms main
```

```
'main' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Result

Proved in 1 attempt (plus the axiom run). Only the three standard axioms are used (expected
for anything about the real numbers).
