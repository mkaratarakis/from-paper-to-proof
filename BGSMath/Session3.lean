import Mathlib

/-!
# Session 3: AI tools

Every block of code on the session 3 slides is cut out of this file between
`-- !begin <tag>` and `-- !end <tag>`, so the slides only ever show code that compiles.
Some declarations here are deliberately bad proofs, to be caught by the checks on the slides.
-/

namespace Session3

open Filter Topology

/-! ## The statement behind the headline -/

-- !begin flt_mathlib
#print FermatLastTheorem
-- def FermatLastTheorem : Prop :=
--   ∀ n ≥ 3, FermatLastTheoremFor n

-- The same, written out:
example : FermatLastTheorem ↔
    ∀ n ≥ 3, ∀ a b c : ℕ,
      a ≠ 0 → b ≠ 0 → c ≠ 0 →
      a ^ n + b ^ n ≠ c ^ n :=
  Iff.rfl
-- !end flt_mathlib

/-! ## What "conditional" means

A theorem proved from an assumed statement. The assumed statement is typed in
by someone and proved by nobody, so somebody has to read it. -/

-- !begin conditional
-- Assumed, not proved.
def Known : Prop :=
  ∀ n : ℕ, ∃ m, m + 1 = n

theorem new_result (h : Known) :
    (2 : ℕ) + 2 = 5 := by
  obtain ⟨m, hm⟩ := h 0
  omega
-- !end conditional

#print axioms new_result
-- depends on axioms: [propext, Quot.sound]

-- !begin conditional_fix
def KnownFixed : Prop :=
  ∀ n : ℕ, 0 < n → ∃ m, m + 1 = n
-- !end conditional_fix

-- The statement as typed is false (take n = 0); the fixed one is true.
example : ¬ Known := by
  intro h
  obtain ⟨m, hm⟩ := h 0
  omega

example : KnownFixed :=
  fun n hn => ⟨n - 1, by omega⟩

/-! ## Pin the statement -/

-- !begin pinned
-- Yours. The agent may not edit it.
def Statement : Prop :=
  ∀ n : ℕ, ∑ i ∈ Finset.range (n + 1), i
    = n * (n + 1) / 2

-- The agent's.
theorem main : Statement := by
  intro n
  rw [Finset.sum_range_id, Nat.add_sub_cancel,
    mul_comm]
-- !end pinned

/-! ## A run, start to finish

The statement is mine. The proof of `main` is what the agent wrote, unchanged
(recorded on 15 November 2026; the full log is in `notes/session3-agent-run/`). -/

namespace Run

-- !begin run_pinned
-- Mine. The agent may not edit it.
def Statement : Prop :=
  ∀ x : ℝ, 0 < x → 2 ≤ x + 1 / x
-- !end run_pinned

-- !begin run_proof
theorem main : Statement := by
  intro x hx
  have hx0 : x ≠ 0 := ne_of_gt hx
  have h : x + 1 / x = (x ^ 2 + 1) / x := by
    field_simp
  rw [h, le_div_iff₀ hx]
  nlinarith [sq_nonneg (x - 1)]
-- !end run_proof

#print axioms main
-- depends on axioms: [propext, Classical.choice, Quot.sound]

end Run

/-! ## A statement that is false

Warm-up B of session 2, handed to the agent as it stands. The evidence is what the
agent added to the file, unchanged; it left `main` as it was. -/

namespace FalseStatement

-- !begin false_pinned
def Statement : Prop :=
  ∀ a b : ℚ, a / b * b = a

theorem main : Statement := by
  sorry
-- !end false_pinned

-- !begin false_evidence
#eval ((1 : ℚ) / 0 * 0)
-- 0

theorem statement_is_false : ¬ Statement := by
  intro h
  have h1 := h 1 0
  norm_num at h1
-- !end false_evidence

-- What a careless agent hands back: a proof, of another statement.
-- !begin false_careless
theorem main' (a b : ℚ)
    (hb : b ≠ 0) :
    a / b * b = a :=
  div_mul_cancel₀ a hb
-- !end false_careless

end FalseStatement

/-! ## Things to catch: the proof is not a proof -/

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
-- depends on axioms: [propext,
--   Classical.choice, Quot.sound]
-- !end honest

/-! ## Things to catch: the proof is a proof, of another statement

Each of these has no `sorry`, no new axiom, and only the standard axioms. -/

-- The wrong type.
-- !begin cheat_type
-- Paper: for every integer n, n² ≥ n.
theorem sq_ge_self (n : ℕ) :
    n ^ 2 ≥ n :=
  Nat.le_self_pow two_ne_zero n
-- !end cheat_type

-- !begin cheat_type_fix
theorem sq_ge_self_int (n : ℤ) :
    n ^ 2 ≥ n :=
  Int.le_self_sq n

example : (-3 : ℤ) ^ 2 ≥ -3 :=
  sq_ge_self_int (-3)
-- !end cheat_type_fix

-- The claim, assumed.
-- !begin cheat_assumed
-- Paper: if n² is even, then n is even.
theorem even_of_sq_even (n : ℕ)
    (h : Even (n ^ 2))
    (hn : ∃ k, n = 2 * k) :
    Even n := by
  obtain ⟨k, hk⟩ := hn
  exact ⟨k, by omega⟩
-- !end cheat_assumed

-- !begin cheat_assumed_fix
theorem even_of_sq_even_fixed (n : ℕ)
    (h : Even (n ^ 2)) :
    Even n :=
  (Nat.even_pow.mp h).1
-- !end cheat_assumed_fix

-- Hypotheses that cannot all hold. Both are used, so Lean gives no warning.
-- !begin cheat_vacuous
-- Paper: a strictly increasing function
-- from ℝ to ℝ is injective.
theorem injective_of_increasing
    (f : ℝ → ℝ) (hf : StrictMono f)
    (hper : ∀ x, f (x + 1) = f x) :
    Function.Injective f := by
  have h : f 0 < f (0 + 1) :=
    hf (by norm_num)
  rw [hper 0] at h
  exact absurd h (lt_irrefl _)
-- !end cheat_vacuous

-- !begin cheat_vacuous_why
-- No function satisfies both hypotheses.
example : ¬ ∃ f : ℝ → ℝ,
    StrictMono f ∧ ∀ x, f (x + 1) = f x := by
  rintro ⟨f, hf, hper⟩
  have h : f 0 < f (0 + 1) := hf (by norm_num)
  rw [hper 0] at h
  exact lt_irrefl _ h
-- !end cheat_vacuous_why

theorem injective_of_increasing_fixed (f : ℝ → ℝ) (hf : StrictMono f) :
    Function.Injective f :=
  hf.injective

-- One case in place of all of them.
-- !begin cheat_special
-- Paper: there are infinitely
-- many primes.
theorem many_primes :
    ∃ p, 100 ≤ p ∧ Nat.Prime p :=
  ⟨101, by norm_num, by norm_num⟩
-- !end cheat_special

-- !begin cheat_special_fix
theorem many_primes_fixed :
    ∀ n, ∃ p, n ≤ p ∧ Nat.Prime p :=
  Nat.exists_infinite_primes
-- !end cheat_special_fix

end Session3
