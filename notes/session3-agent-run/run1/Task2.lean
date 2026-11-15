import Mathlib

-- The statement. Do not edit anything above the line of dashes.
def Statement : Prop :=
  ∀ x : ℝ, 0 < x → 2 ≤ x + 1 / x

--------------------------------------------------------------------------------
-- Your work goes below this line.

theorem main : Statement := by
  intro x hx
  have hx0 : x ≠ 0 := ne_of_gt hx
  have h : x + 1 / x = (x ^ 2 + 1) / x := by
    field_simp
  rw [h, le_div_iff₀ hx]
  nlinarith [sq_nonneg (x - 1)]

#print axioms main
