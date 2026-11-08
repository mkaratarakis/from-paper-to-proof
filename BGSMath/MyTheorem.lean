import Mathlib

/-!
# My theorem

A template for session 4. Fill in the sections in order; the slides show each step
on one example (`Session4.lean`).
-/

namespace MyTheorem

/-! ## 1. The paper statement

Copy it here, with every hypothesis, including the ones the paper leaves implicit.

-/

/-! ## 2. Definitions

Only if Mathlib does not have them (search first). Under each one, one example that has
the property and one that does not. -/

/-! ## 3. The statement

Pinned: the agent may not edit this section. -/

def Statement : Prop :=
  sorry

/-! ## 4. Tests

- The hypotheses can hold together: give an example.
- Each hypothesis is needed: remove it, and prove that the statement fails.
- A special case you know. -/

/-! ## 5. Steps

The plan, as precise statements. A step you cannot prove yet stays here as a `def ... : Prop`,
and the main theorem takes it as a hypothesis. -/

/-! ## 6. The proof -/

theorem main : Statement := by
  sorry

/-! ## 7. Audit

Only `propext`, `Classical.choice` and `Quot.sound` may appear. -/

#print axioms main

end MyTheorem
