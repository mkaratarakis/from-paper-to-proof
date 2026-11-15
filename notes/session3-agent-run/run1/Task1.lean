import Mathlib

-- The statement. Do not edit anything above the line of dashes.
def Statement : Prop :=
  ∀ m n : ℕ, Odd m → Odd n → Odd (m * n)

--------------------------------------------------------------------------------
-- Your work goes below this line.

theorem main : Statement := by
  intro m n hm hn
  exact Odd.mul hm hn

#print axioms main
