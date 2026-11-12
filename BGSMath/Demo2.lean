import Mathlib

/-!
# Session 2: live demos

Everything is commented out. In the lecture, uncomment one block at a time
(select the lines, then Cmd+/ in VS Code) and let the infoview update.
Each demo has a fallback: the slide it belongs to shows the same code.
-/

namespace Demo2

/-! ## Demo 1: test your definition (at the slide "Test your definition")

Uncomment the definition, then the two tests, one at a time. -/

-- def IsEven (n : ℕ) : Prop :=
--   ∃ k, n = 2 * k

-- example : IsEven 4 := ⟨2, rfl⟩

-- example : ¬ IsEven 3 := by
--   intro ⟨k, hk⟩
--   omega

/-! ## Demo 2: a statement has three parts (at the slide of that name)

Uncomment the statement. Point at the three parts: objects, assumptions, claim.
Then replace `sorry` by `hm.add hn`. -/

-- theorem even_add_even (m n : ℕ)
--     (hm : Even m) (hn : Even n) :
--     Even (m + n) :=
--   sorry

/-! ## Demo 3: warm-up B (at the slide "Warm-up B: what went wrong?")

Uncomment the `#eval`: Lean answers 0, and the paper says 1. -/

-- #eval (1 : ℚ) / 0 * 0

/-! ## Demo 4: warm-up C (at the slide "Warm-up C: test on small cases")

Uncomment the `#eval`: the two sides differ. Then change `Finset.range n` to
`Finset.range (n + 1)`: now they agree. -/

-- #eval (List.range 5).map fun n =>
--   (∑ i ∈ Finset.range n, i, n * (n + 1) / 2)

end Demo2
