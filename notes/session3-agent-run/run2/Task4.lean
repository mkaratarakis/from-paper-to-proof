import Mathlib

-- The statement. Do not edit anything above the line of dashes.
def Statement : Prop :=
  ¬ ∃ q : ℚ, q ^ 2 = 2

--------------------------------------------------------------------------------
-- Your work goes below this line.

theorem main : Statement := by
  rintro ⟨q, hq⟩
  have h : ¬ IsSquare (2 : ℚ) := by norm_num
  exact h ⟨q, hq.symm.trans (sq q)⟩

#print axioms main
