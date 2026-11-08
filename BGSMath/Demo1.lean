import Mathlib

/-!
# Session 1: live demos

Everything is commented out. In the lecture, uncomment one block at a time
(select the lines, then Cmd+/ in VS Code) and let the infoview update.
Each demo has a fallback slide that shows the same thing.
-/

namespace Demo1

/-! ## Demo 1: first contact (after the slide "Getting started")

Put the cursor on each line and show the infoview. Fallback: slide "First contact". -/

-- #eval 2 + 2
-- #check (2 : ℝ)
-- #check Nat.Prime 7
-- example : 2 + 2 = 4 := rfl

/-! ## Demo 2: a proof, step by step (at the slide "A proof, step by step")

Uncomment the statement with `sorry` first and show the goal. Then replace `sorry`
by the tactics, one line at a time, and show the goal after each.
Fallback: click through the overlay slide. -/

-- example (m n : ℕ) (hm : Even m) (hn : Even n) :
--     Even (m + n) := by
--   sorry

-- The tactics, in order:
--   obtain ⟨a, ha⟩ := hm
--   obtain ⟨b, hb⟩ := hn
--   use a + b
--   rw [ha, hb]
--   ring

/-! ## Demo 3: when the search fails (at the slide "When the search fails")

First block: `exact?` fails, because the statement is false for x < 0.
Second block: add `(hx : 0 ≤ x)` and it succeeds. `exact?` can take a few seconds:
say what it is doing while it runs. Fallback: slide "When the search fails". -/

-- example (x : ℝ) : Real.sqrt x ^ 2 = x := by
--   exact?

-- example (x : ℝ) (hx : 0 ≤ x) : Real.sqrt x ^ 2 = x := by
--   exact?

end Demo1
