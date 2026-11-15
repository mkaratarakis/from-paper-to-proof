import Mathlib

-- The statement. Do not edit anything above the line of dashes.
def Statement : Prop :=
  ∀ n : ℕ, ∑ i ∈ Finset.range n, (1 : ℚ) / ((i + 1) * (i + 2)) = n / (n + 1)

--------------------------------------------------------------------------------
-- Your work goes below this line.

theorem main : Statement := by
  intro n
  exact Finset.sum_range_induction _ (fun m : ℕ => (m : ℚ) / (m + 1)) (by simp) n
    (fun k _ => by
      push_cast
      field_simp
      ring)

#print axioms main
