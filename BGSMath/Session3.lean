import Mathlib

/-!
# Session 3: AI tools

Every block of code on the session 3 slides is cut out of this file between
`-- !begin <tag>` and `-- !end <tag>`, so the slides only ever show code that compiles.
Some declarations here are deliberately bad proofs, to be caught by the checks on the slides.
-/

namespace Session3

open Filter Topology

/-! ## Pin the statement -/

-- !begin pinned
-- You write this, and the agent may not edit it.
def Statement : Prop :=
  ∀ n : ℕ, ∑ i ∈ Finset.range (n + 1), i
    = n * (n + 1) / 2

-- The agent writes this.
theorem main : Statement := by
  intro n
  rw [Finset.sum_range_id, Nat.add_sub_cancel,
    mul_comm]
-- !end pinned

/-! ## Things to catch -/

-- !begin cheat_axiom
axiom helpful_fact : (2 : ℕ) + 2 = 5

theorem looks_fine : (2 : ℕ) + 2 = 5 :=
  helpful_fact

#print axioms looks_fine
-- depends on axioms: [helpful_fact]
-- !end cheat_axiom

-- !begin cheat_sorry
theorem almost (x : ℝ) (hx : 0 < x) :
    Real.log x ≤ x - 1 := by
  have key : ∀ y > 0, Real.log y ≤ y - 1 := by
    sorry
  exact key x hx

#print axioms almost
-- depends on axioms:
--   [propext, sorryAx, Classical.choice, Quot.sound]
-- !end cheat_sorry

-- !begin cheat_native
theorem big_prime : Nat.Prime 1000003 := by
  native_decide

#print axioms big_prime
-- depends on axioms: [propext, Classical.choice,
--   Quot.sound, big_prime._native.native_decide.ax_1_1]
-- !end cheat_native

-- !begin honest
theorem log_le (x : ℝ) (hx : 0 < x) :
    Real.log x ≤ x - 1 :=
  Real.log_le_sub_one_of_pos hx

#print axioms log_le
-- depends on axioms:
--   [propext, Classical.choice, Quot.sound]
-- !end honest

end Session3
