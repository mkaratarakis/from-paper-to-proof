import Mathlib

/-!
# Session 3: exercises

Part 1: give these statements to an AI agent and let it prove them. Then check its work.
Part 2: proofs "from an agent". Lean accepts every one of them. Audit them.
Part 3: your own statement from session 2.

Each exercise has two ratings out of 5: how hard it is to *state*, and how hard to *prove*.
-/

namespace Exercises3

/-! ## Part 1: let an agent prove it

Tell the agent: do not change the statements, do not add axioms, no `sorry`.
For each one, write down how many attempts it took and what it got wrong on the way.
Then check its proof: does the statement still read as below? What does `#print axioms` say? -/

-- 1.1  Stating 1/5 · Proving 2/5
theorem p1_1 : ∀ n : ℕ, 3 ∣ n ^ 3 + 2 * n := by
  sorry

-- 1.2  Stating 1/5 · Proving 3/5
theorem p1_2 : ∀ n : ℕ, 4 * ∑ i ∈ Finset.range (n + 1), i ^ 3 = (n * (n + 1)) ^ 2 := by
  sorry

-- 1.3  Stating 2/5 · Proving 2/5
theorem p1_3 (f : ℝ → ℝ) (hf : Continuous f) (h0 : f 0 < 0) (h1 : 0 < f 1) :
    ∃ c ∈ Set.Icc (0 : ℝ) 1, f c = 0 := by
  sorry

-- 1.4  Stating 1/5 · Proving 3/5
theorem p1_4 (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    Real.sqrt (a * b) ≤ (a + b) / 2 := by
  sorry

-- 1.5  Stating 2/5 · Proving 2/5.  Paper: there is no surjection from ℕ onto its power set.
theorem p1_5 : ¬ ∃ f : ℕ → Set ℕ, Function.Surjective f := by
  sorry

/-! ## Part 2: audit

Each theorem below came with a paper statement (in the comment) and a proof that Lean accepts.
For each one, decide: is it a proof of the paper statement? If not, say why, show the evidence
(`#print axioms`, a warning, a counterexample, a contradiction in the hypotheses), and fix it. -/

-- 2.1  Paper: every prime p > 2 is odd.
theorem a2_1 (p : ℕ) (hp : p.Prime) (h : 2 < p) : Odd p :=
  hp.odd_of_ne_two (by omega)

-- 2.2  Paper: 1000003 is prime.
theorem a2_2 : Nat.Prime 1000003 := by
  native_decide

-- 2.3  Paper: for every real x, x² ≥ 2x − 1.
theorem a2_3 (x : ℕ) : x ^ 2 ≥ 2 * x - 1 := by
  rcases x with _ | k
  · simp
  · have h : 2 * (k + 1) - 1 = 2 * k + 1 := by omega
    rw [h]
    nlinarith

-- 2.4  Paper: a continuous function on [0, 1] is bounded on [0, 1].
theorem a2_4 (f : ℝ → ℝ) (hf : ContinuousOn f (Set.Icc 0 1))
    (hb : ∃ M, ∀ x, |f x| ≤ M) : ∃ M, ∀ x ∈ Set.Icc (0 : ℝ) 1, |f x| ≤ M :=
  let ⟨M, hM⟩ := hb
  ⟨M, fun x _ => hM x⟩

-- 2.5  Paper: log x ≤ x − 1 for x > 0.
theorem a2_5 (x : ℝ) (hx : 0 < x) : Real.log x ≤ x - 1 := by
  have key : ∀ y > 0, Real.log y ≤ y - 1 := by
    sorry
  exact key x hx

-- 2.6  Paper: every bounded monotone sequence of reals converges.
axiom monotone_bounded_converges (a : ℕ → ℝ) (hm : Monotone a)
    (hb : BddAbove (Set.range a)) : ∃ L, Filter.Tendsto a Filter.atTop (nhds L)

theorem a2_6 (a : ℕ → ℝ) (hm : Monotone a) (hb : BddAbove (Set.range a)) :
    ∃ L, Filter.Tendsto a Filter.atTop (nhds L) :=
  monotone_bounded_converges a hm hb

-- 2.7  Paper: if 0 < x < 1 then x² < x.
theorem a2_7 (x : ℝ) (h1 : 0 < x) (h2 : x < 1) (h3 : 1 < x) : x ^ 2 < x := by
  linarith

/-! ## Part 3: your own statement

Take the statement you wrote in session 2, part 4.

1. Put it in a `def Statement : Prop` that the agent may not edit (see the slides).
2. Ask an agent for `theorem main : Statement`. Let it split the work into lemmas.
3. Audit the result as in part 2.
4. If it gets stuck, write down where. That is where we start in session 4. -/

end Exercises3
