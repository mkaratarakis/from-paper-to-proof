import Mathlib

/-!
# Session 3: live demos

Everything is commented out. In the lecture, uncomment one block at a time
(select the lines, then Cmd+/ in VS Code) and let the infoview update.
Each demo has a fallback: the slide it belongs to shows the same code.

The demo with an agent is in its own file, `AgentDemo.lean`.
-/

namespace Demo3

/-! ## Demo 1: the statement behind the headline (at the slide of that name)

Uncomment the line. Lean prints Mathlib's statement of Fermat's Last Theorem. -/

-- #print FermatLastTheorem

/-! ## Demo 2: an agent proves a statement (at the slide "A run (1): my part")

Open `AgentDemo.lean` and give the agent the text at the top of that file.
While it works, go on with the slides "A run (2)" and "A run (3)": they show
the same statement, from a run recorded on 15 November. Come back when it is done. -/

/-! ## Demo 3: what Lean says when a step is wrong (at the slide "A run (4)")

Uncomment the block. The last line is `linarith`, and Lean reports an error there.
Read the error with the room. Then replace `linarith` by
`nlinarith [sq_nonneg (x - 1)]`: the error goes away. -/

-- example : ∀ x : ℝ, 0 < x → 2 ≤ x + 1 / x := by
--   intro x hx
--   have hx0 : x ≠ 0 := ne_of_gt hx
--   have h : x + 1 / x = (x ^ 2 + 1) / x := by
--     field_simp
--   rw [h, le_div_iff₀ hx]
--   linarith

/-! ## Demo 4: checking an AI's proof (at the slide of that name)

Uncomment one block at a time, and read what `#print axioms` prints.
First: a new axiom. Second: a `sorry` inside the proof. Third: a clean proof. -/

-- axiom helpful_fact : (2 : ℕ) + 2 = 5
-- theorem looks_fine : (2 : ℕ) + 2 = 5 := helpful_fact
-- #print axioms looks_fine

-- theorem almost (x : ℝ) (hx : 0 < x) : Real.log x ≤ x - 1 := by
--   have key : ∀ y > 0, Real.log y ≤ y - 1 := by
--     sorry
--   exact key x hx
-- #print axioms almost

-- theorem log_le (x : ℝ) (hx : 0 < x) : Real.log x ≤ x - 1 :=
--   Real.log_le_sub_one_of_pos hx
-- #print axioms log_le

end Demo3
