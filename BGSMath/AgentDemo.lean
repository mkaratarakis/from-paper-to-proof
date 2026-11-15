import Mathlib

/-!
# Session 3: the live demo with an agent

This file is what the agent works on, live, at the slide "A run (1): my part".
The statement is pinned. The agent may change only what is below the line of dashes.

What to type to the agent:

  Prove `theorem main : Statement` in BGSMath/AgentDemo.lean. Rules:
  1. Never edit anything above the line of dashes. The statement is fixed.
  2. Never add `axiom`, `sorry` or `native_decide`.
  3. Before proving a lemma yourself, look for it in Mathlib.
  4. Before writing any Lean, write your plan in English, in a few sentences.
  5. If you cannot prove it, stop and say why. Do not change the statement.
  When Lean accepts the proof, add `#print axioms main` and tell me what it prints.

After the lecture, put the file back as it was: `git checkout BGSMath/AgentDemo.lean`.
-/

namespace AgentDemo

-- Paper: for every real number x > 0,  x + 1/x ≥ 2.
def Statement : Prop :=
  ∀ x : ℝ, 0 < x → 2 ≤ x + 1 / x

--------------------------------------------------------------------------------
-- The agent's work goes below this line.

theorem main : Statement := by
  sorry

end AgentDemo
