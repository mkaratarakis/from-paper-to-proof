import Mathlib

-- The statement. Do not edit anything above the line of dashes.
def Statement : Prop :=
  ∀ a b : ℚ, a / b * b = a

--------------------------------------------------------------------------------
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
