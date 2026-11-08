import Mathlib

/-!
# Session 2: From paper to Lean

Every block of code on the session 2 slides is cut out of this file between
`-- !begin <tag>` and `-- !end <tag>`, so the slides only ever show code that compiles.
Lines are kept short so that they fit in a half-width column.
-/

namespace Session2

open Filter Topology

/-! ## Definitions -/

-- !begin bounded_def
def Bounded (f : ℝ → ℝ) : Prop :=
  ∃ M, ∀ x, |f x| ≤ M
-- !end bounded_def

-- !begin bounded_tests
example : Bounded Real.sin :=
  ⟨1, fun x => Real.abs_sin_le_one x⟩

example : ¬ Bounded (fun x => x) := by
  intro ⟨M, hM⟩
  have h : |(|M| + 1)| ≤ M := hM (|M| + 1)
  rw [abs_of_pos (by positivity)] at h
  linarith [le_abs_self M]
-- !end bounded_tests

-- !begin isprime_bad
def IsPrime (n : ℕ) : Prop :=
  ∀ d, d ∣ n → d = 1 ∨ d = n

-- 1 is "prime" by this definition.
example : IsPrime 1 := by
  intro d hd
  left
  exact Nat.dvd_one.mp hd

-- But not by Mathlib's.
example : ¬ Nat.Prime 1 := Nat.not_prime_one
-- !end isprime_bad

-- !begin perfect
#print Nat.Perfect
-- def Nat.Perfect : ℕ → Prop :=
-- fun n => ∑ i ∈ n.properDivisors, i = n ∧ 0 < n
-- !end perfect

-- !begin mono_agree
def MyMono (f : ℝ → ℝ) : Prop :=
  ∀ x y, x ≤ y → f x ≤ f y

example (f : ℝ → ℝ) :
    MyMono f ↔ Monotone f := Iff.rfl
-- !end mono_agree

/-! ## Statements -/

-- !begin max_icc
theorem max_on_Icc (f : ℝ → ℝ) (a b : ℝ)
    (hab : a ≤ b)
    (hf : ContinuousOn f (Set.Icc a b)) :
    ∃ c ∈ Set.Icc a b,
      ∀ x ∈ Set.Icc a b, f x ≤ f c := by
  obtain ⟨c, hc, hmax⟩ := isCompact_Icc.exists_isMaxOn
    (Set.nonempty_Icc.2 hab) hf
  exact ⟨c, hc, isMaxOn_iff.mp hmax⟩
-- !end max_icc

-- !begin max_icc_bad
-- Without a ≤ b: take a = 1, b = 0.
example : ¬ ∀ (f : ℝ → ℝ) (a b : ℝ),
    ContinuousOn f (Set.Icc a b) →
    ∃ c ∈ Set.Icc a b,
      ∀ x ∈ Set.Icc a b, f x ≤ f c := by
  intro h
  obtain ⟨c, ⟨h1, h0⟩, -⟩ :=
    h (fun _ => 0) 1 0 continuousOn_const
  linarith
-- !end max_icc_bad

-- !begin infer_nat
-- No type given: Lean takes x : ℕ.
example : ¬ ∀ x, x - 1 < x := by
  intro h
  have := h 0
  omega

example : ∀ x : ℝ, x - 1 < x := by
  intro x
  linarith
-- !end infer_nat

-- !begin sum_eval
#eval (List.range 5).map fun n =>
  (∑ i ∈ Finset.range n, i, n * (n + 1) / 2)
-- [(0, 0), (0, 1), (1, 3), (3, 6), (6, 10)]
-- !end sum_eval

-- !begin sum_bug
example : ¬ ∀ n : ℕ,
    ∑ i ∈ Finset.range n, i = n * (n + 1) / 2 := by
  intro h
  have := h 1
  simp at this

example (n : ℕ) :
    ∑ i ∈ Finset.range (n + 1), i = n * (n + 1) / 2 := by
  rw [Finset.sum_range_id, Nat.add_sub_cancel, mul_comm]
-- !end sum_bug

-- !begin tendsto
example : Tendsto (fun n : ℕ => 1 / (n : ℝ))
    atTop (𝓝 0) :=
  tendsto_one_div_atTop_nhds_zero_nat
-- !end tendsto

-- !begin tendsto_iff
#check Metric.tendsto_atTop
-- Metric.tendsto_atTop : Tendsto u atTop (𝓝 a) ↔
--   ∀ ε > 0, ∃ N, ∀ n ≥ N, dist (u n) a < ε
-- !end tendsto_iff

/-! ## Checking a statement -/

-- !begin witness
-- The hypotheses of max_on_Icc can hold together.
example : ∃ (f : ℝ → ℝ) (a b : ℝ),
    a ≤ b ∧ ContinuousOn f (Set.Icc a b) :=
  ⟨fun x => x, 0, 1, zero_le_one, continuousOn_id⟩

-- Those of everything_is_42 (session 1) cannot.
example : ¬ ∃ x : ℝ, 0 < x ∧ x < 0 := by
  rintro ⟨x, h₁, h₂⟩
  linarith
-- !end witness

-- !begin special_case
example : ∃ c ∈ Set.Icc (0 : ℝ) 1,
    ∀ x ∈ Set.Icc (0 : ℝ) 1, x ^ 2 ≤ c ^ 2 :=
  max_on_Icc (fun x => x ^ 2) 0 1 zero_le_one
    (by fun_prop)
-- !end special_case

/-! ## Drafts from an AI -/

-- !begin draft_circular
-- Paper: a monotone sequence that is bounded above converges.
theorem draft (a : ℕ → ℝ) (hmono : Monotone a)
    (hbdd : BddAbove (Set.range a))
    (hconv : ∃ L, Tendsto a atTop (𝓝 L)) :
    ∃ L, Tendsto a atTop (𝓝 L) :=
  hconv
-- !end draft_circular

-- !begin draft_fixed
theorem mono_conv (a : ℕ → ℝ) (hmono : Monotone a)
    (hbdd : BddAbove (Set.range a)) :
    ∃ L, Tendsto a atTop (𝓝 L) :=
  ⟨_, tendsto_atTop_ciSup hmono hbdd⟩
-- !end draft_fixed

end Session2
