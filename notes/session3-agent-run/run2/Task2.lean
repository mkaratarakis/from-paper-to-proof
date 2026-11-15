import Mathlib

-- The statement. Do not edit anything above the line of dashes.
def Statement : Prop :=
  ∀ n : ℕ, 4 ≤ n → 2 ^ n < n.factorial

--------------------------------------------------------------------------------
-- Your work goes below this line.

theorem main : Statement := by
  intro n hn
  induction n, hn using Nat.le_induction with
  | base => decide
  | succ k hk ih =>
    rw [pow_succ, Nat.factorial_succ]
    nlinarith [Nat.factorial_pos k]

#print axioms main
