import Mathlib

/-!
# Session 2: From paper to Lean

Every block of code on the session 2 slides is cut out of this file between
`-- !begin <tag>` and `-- !end <tag>`, so the slides only ever show code that compiles.
Lines are kept short so that they fit in a half-width column.
-/

namespace Session2

open Filter Topology

/-! ## Warm-up

Three sentences from a paper, and a statement of each in Lean. Lean accepts all three
statements, and all three are false. Each is taken apart in part 2 below. -/

-- A. Paper: for every x, x - 1 < x.
-- !begin warm_a
example : ∀ x, x - 1 < x := sorry
-- !end warm_a

-- B. Paper: (a / b) · b = a.
-- !begin warm_b
example (a b : ℚ) : a / b * b = a := sorry
-- !end warm_b

-- C. Paper: 1 + 2 + ⋯ + n = n (n + 1) / 2.
-- !begin warm_c
example (n : ℕ) :
    ∑ i ∈ Finset.range n, i = n * (n + 1) / 2 := sorry
-- !end warm_c

/-! ## Part 1: definitions -/

-- Paper: a natural number n is even if n = 2k for some k.
-- !begin even_def
def IsEven (n : ℕ) : Prop :=
  ∃ k, n = 2 * k
-- !end even_def

-- !begin even_tests
-- 4 is even: take k = 2.
example : IsEven 4 := ⟨2, rfl⟩

-- 3 is not even.
example : ¬ IsEven 3 := by
  intro ⟨k, hk⟩
  omega
-- !end even_tests

-- Paper: a natural number n is prime if its only divisors are 1 and n.
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

-- !begin mathlib_defs
-- Mathlib has both notions already.
example : Even 4 := by decide
example : Nat.Prime 7 := by norm_num
example : ¬ Nat.Prime 1 := by norm_num

-- IsEven agrees with Mathlib's Even.
example (n : ℕ) : IsEven n ↔ Even n := by
  simp [IsEven, even_iff_two_dvd, dvd_def]
-- !end mathlib_defs

/-! ## Part 2: statements -/

-- Paper: the sum of two even numbers is even.
-- !begin anatomy
theorem even_add_even (m n : ℕ)    -- 1. objects
    (hm : Even m) (hn : Even n) :  -- 2. assumptions
    Even (m + n) :=                -- 3. claim
  hm.add hn                        -- the proof
-- !end anatomy

-- Your turn. Paper: the product of two odd numbers is odd.
-- !begin your_turn
theorem odd_mul_odd (m n : ℕ)      -- 1. objects
    (hm : Odd m) (hn : Odd n) :    -- 2. assumptions
    Odd (m * n) :=                 -- 3. claim
  hm.mul hn                        -- the proof
-- !end your_turn

-- Warm-up A. No type was written, so Lean took x : ℕ, and there 0 - 1 = 0.
-- !begin a_fix
#eval 0 - 1
-- 0

-- With the type written: true.
example : ∀ x : ℤ, x - 1 < x := by
  intro x
  omega
-- !end a_fix

-- Warm-up B. In Lean 1 / 0 = 0 (session 1), so a = 1, b = 0 breaks it.
-- !begin b_fix
#eval (1 : ℚ) / 0 * 0
-- 0, and the paper says 1

theorem div_mul_self (a b : ℚ)
    (hb : b ≠ 0) :    -- was hidden
    a / b * b = a :=
  div_mul_cancel₀ a hb
-- !end b_fix

example : ¬ ∀ a b : ℚ, a / b * b = a := by
  intro h
  have := h 1 0
  simp at this

-- Warm-up C. Test on small cases: n = 0, 1, 2, 3, 4.
-- !begin sum_eval
#eval (List.range 5).map fun n =>
  (∑ i ∈ Finset.range n, i, n * (n + 1) / 2)
-- [(0, 0), (0, 1), (1, 3), (3, 6), (6, 10)]
-- !end sum_eval

-- !begin c_fix
#eval Finset.range 4
-- {0, 1, 2, 3}

example (n : ℕ) :
    ∑ i ∈ Finset.range (n + 1), i = n * (n + 1) / 2 := by
  rw [Finset.sum_range_id, Nat.add_sub_cancel, mul_comm]
-- !end c_fix

/-! ## Part 3: checking a statement -/

-- True, and it says nothing: no n is below 3 and above 5.
-- !begin vacuous
theorem silly (n : ℕ) (h1 : n < 3) (h2 : 5 < n) :
    n = 42 := by
  omega
-- !end vacuous

/-! ## Part 4: drafts from an AI

Paper: if a ≤ b then a² ≤ b². Two drafts that Lean accepts, and the right statement. -/

-- !begin ai_draft1
-- Paper: if a ≤ b then a² ≤ b².
theorem draft1 (a b : ℕ) (h : a ≤ b)
    (h2 : a ^ 2 ≤ b ^ 2) :
    a ^ 2 ≤ b ^ 2 :=
  h2
-- !end ai_draft1

-- !begin ai_draft2
-- Paper: if a ≤ b then a² ≤ b².
theorem draft2 (a b : ℕ) (h : a < b) :
    a ^ 2 ≤ b ^ 2 :=
  Nat.pow_le_pow_left h.le 2
-- !end ai_draft2

-- !begin ai_fixed
theorem sq_le_sq_of_le (a b : ℕ) (h : a ≤ b) :
    a ^ 2 ≤ b ^ 2 :=
  Nat.pow_le_pow_left h 2

-- A case we know: a = b = 3.
example : 3 ^ 2 ≤ 3 ^ 2 :=
  sq_le_sq_of_le 3 3 (le_refl 3)
-- !end ai_fixed

/-! ## Three more, for fun

Lean accepts each of these, with a proof or by computation. Each sentence in quotes
is still wrong: read the Lean line back and see what it really says. -/

-- !begin fun_exists
-- "There is a number greater than 5 that is equal to 3."
example : ∃ n : ℕ, n > 5 → n = 3 :=
  ⟨0, by omega⟩
-- !end fun_exists

-- !begin fun_exists_fix
-- What was meant: ∧, not →. This one is false.
example : ¬ ∃ n : ℕ, n > 5 ∧ n = 3 := by
  omega
-- !end fun_exists_fix

-- !begin fun_harmonic
-- "1 + 1/2 + 1/3 + ⋯ + 1/100"
#eval ∑ i ∈ Finset.range 100, 1 / (i + 1)
-- 1
-- !end fun_harmonic

-- !begin fun_harmonic_fix
-- With the type written: the first four terms.
#eval ∑ i ∈ Finset.range 4, (1 : ℚ) / (i + 1)
-- 25 / 12
-- !end fun_harmonic_fix

-- The same for every number of terms: on ℕ the sum is always 1.
example (n : ℕ) : ∑ i ∈ Finset.range (n + 1), 1 / (i + 1) = 1 := by
  rw [Finset.sum_range_succ']
  simp

-- !begin fun_card
-- "ℕ and ℝ have the same number of elements."
example : Nat.card ℕ = Nat.card ℝ := by
  simp
-- !end fun_card

-- !begin fun_card_why
-- Nat.card of an infinite set is 0.
example : Nat.card ℕ = 0 := Nat.card_eq_zero_of_infinite
example : Nat.card ℝ = 0 := Nat.card_eq_zero_of_infinite
-- !end fun_card_why

-- With cardinals, ℕ is smaller than ℝ.
example : Cardinal.mk ℕ < Cardinal.mk ℝ := by
  rw [Cardinal.mk_nat, Cardinal.mk_real]
  exact Cardinal.aleph0_lt_continuum

/-! ## Further examples, for the exercises

The same ideas with objects from analysis: functions, intervals, limits.
They are not in the lecture. Read them before parts 2 and 3 of `Exercises2.lean`. -/

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

-- Paper: a continuous function on [a, b] attains its maximum. Note `hab`.
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

-- !begin draft_circular
-- Paper: a monotone sequence that is bounded above converges.
theorem draft (a : ℕ → ℝ) (hmono : Monotone a)
    (hbdd : BddAbove (Set.range a))
    (hconv : ∃ L, Tendsto a atTop (𝓝 L)) :
    ∃ L, Tendsto a atTop (𝓝 L) :=
  hconv
-- !end draft_circular

-- !begin draft_weaker
-- Paper: a monotone sequence that is bounded above converges.
theorem draft_strict (a : ℕ → ℝ) (hmono : StrictMono a)
    (hbdd : BddAbove (Set.range a)) :
    ∃ L, Tendsto a atTop (𝓝 L) :=
  ⟨_, tendsto_atTop_ciSup hmono.monotone hbdd⟩
-- !end draft_weaker

-- !begin draft_weaker_test
-- A constant sequence converges, and the draft does not cover it.
example : ¬ StrictMono (fun _ : ℕ => (1 : ℝ)) :=
  fun h => lt_irrefl _ (h Nat.zero_lt_one)
-- !end draft_weaker_test

-- !begin draft_fixed
theorem mono_conv (a : ℕ → ℝ) (hmono : Monotone a)
    (hbdd : BddAbove (Set.range a)) :
    ∃ L, Tendsto a atTop (𝓝 L) :=
  ⟨_, tendsto_atTop_ciSup hmono hbdd⟩
-- !end draft_fixed

end Session2
