import Mathlib

-- The statement. Do not edit anything above the line of dashes.
def Statement : Prop :=
  ∀ n : ℕ, ∑ i ∈ Finset.range n, (2 * i + 1) = n ^ 2

--------------------------------------------------------------------------------
-- Your work goes below this line.

theorem main : Statement := by
  intro n
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ, ih]
    ring

#print axioms main
