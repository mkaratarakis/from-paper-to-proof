import Mathlib

/-!
# Session 1: Lean and Mathlib

Every block of code on the session 1 slides is cut out of this file between
`-- !begin <tag>` and `-- !end <tag>`, so the slides only ever show code that compiles.
Lines are kept short so that they fit in a half-width column.
-/

namespace Session1

/-! ## The game -/

-- !begin flt
theorem fermat (n : ℕ) (hn : n ≥ 3) (a b c : ℕ)
    (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0) :
    a ^ n + b ^ n ≠ c ^ n := by
  sorry
-- !end flt

/-! ## First contact -/

-- !begin first
#eval 2 + 2              -- 4
#check (2 : ℝ)           -- 2 : ℝ
#check Nat.Prime         -- Nat.Prime (p : ℕ) : Prop
#check Nat.Prime 7       -- Nat.Prime 7 : Prop
-- !end first

-- !begin rfl
example : 2 + 2 = 4 := rfl
-- !end rfl

/-! ## Finding things (placed before `sq_add_sq_ge`, so that `exact?` finds the Mathlib lemma) -/

-- !begin exact_q
example (a b : ℝ) :
    2 * a * b ≤ a ^ 2 + b ^ 2 := by
  exact?
-- !end exact_q

-- !begin sqrt_fixed
example (x : ℝ) (hx : 0 ≤ x) :
    Real.sqrt x ^ 2 = x := by
  exact?
-- !end sqrt_fixed

/-! ## Anatomy of a theorem -/

-- !begin anatomy
theorem sq_add_sq_ge (a b : ℝ) : 2 * a * b ≤ a ^ 2 + b ^ 2 := by
  nlinarith [sq_nonneg (a - b)]
-- !end anatomy

-- !begin calc
example (a b : ℝ) :
    2 * a * b ≤ a ^ 2 + b ^ 2 := by
  have h : 0 ≤ (a - b) ^ 2 := sq_nonneg _
  calc 2 * a * b
      = a ^ 2 + b ^ 2 - (a - b) ^ 2 := by ring
    _ ≤ a ^ 2 + b ^ 2 := by linarith
-- !end calc

-- !begin terms
theorem small (x : ℝ) (h : 0 < x) :
    0 < x + 1 := by
  linarith

#print small
-- !end terms

/-! ## A first tactic proof -/

-- !begin even_proof
example (m n : ℕ)
    (hm : Even m) (hn : Even n) :
    Even (m + n) := by
  obtain ⟨a, ha⟩ := hm
  obtain ⟨b, hb⟩ := hn
  use a + b
  rw [ha, hb]
  ring
-- !end even_proof

-- !begin even_def
#check Even  -- Even {α : Type u_2} [Add α] (a : α) : Prop
#print Even  -- fun {α} [Add α] a => ∃ r, a = r + r
-- !end even_def

-- !begin even_short
example (m n : ℕ) (hm : Even m) (hn : Even n) :
    Even (m + n) :=
  hm.add hn
-- !end even_short

/-! ## Logic -/

-- !begin forall_exists
example : ∀ n : ℕ, ∃ m, n < m := by
  intro n
  use n + 1
  omega
-- !end forall_exists

-- !begin and
example (P Q : Prop) (h : P ∧ Q) :
    Q ∧ P := by
  obtain ⟨hp, hq⟩ := h
  exact ⟨hq, hp⟩
-- !end and

-- !begin or
example (P Q : Prop) (h : P ∨ Q) :
    Q ∨ P := by
  rcases h with hp | hq
  · right
    exact hp
  · left
    exact hq
-- !end or

/-! ## Automation -/

-- !begin auto
example (a b : ℝ) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by ring
example (x y : ℝ) (h₁ : x < y) (h₂ : y < 3) : x < 3 := by linarith
example (x : ℝ) : 0 < x ^ 2 + 1 := by positivity
example : Nat.Prime 97 := by norm_num
example (n : ℕ) (h : n % 4 = 3) : n % 2 = 1 := by omega
example : Continuous (fun x : ℝ => x ^ 2 + Real.sin x) := by fun_prop
example (a b c : ℝ) (h : a ≤ b) (hc : 0 ≤ c) : a * c ≤ b * c := by gcongr
example (xs : List ℕ) : (xs ++ []).length = xs.length := by simp
-- !end auto

/-! ## Finding things in Mathlib -/

-- !begin names
#check mul_comm          -- a * b = b * a
#check mul_pos           -- 0 < a → 0 < b → 0 < a * b
#check add_le_add        -- a ≤ b → c ≤ d → a + c ≤ b + d
#check lt_of_le_of_lt    -- a ≤ b → b < c → a < c
#check Nat.Prime.two_le  -- p.Prime → 2 ≤ p
-- !end names

-- !begin library
#check irrational_sqrt_two         -- Irrational √2
#check Nat.exists_infinite_primes  -- ∀ n, ∃ p, n ≤ p ∧ p.Prime
#check Complex.exists_root         -- 0 < degree f → ∃ z, f.IsRoot z
-- !end library

/-! ## Reading a statement -/

-- !begin signature
#check mul_comm
-- mul_comm.{u_1} {G : Type u_1} [CommMagma G] (a b : G) : a * b = b * a
-- !end signature

-- !begin junk_basic
example : (5 : ℕ) - 7 = 0 := by norm_num
example : (7 : ℕ) / 2 = 3 := by norm_num
example : (1 : ℝ) / 0 = 0 := by norm_num
example : Real.sqrt (-1) = 0 := by norm_num
example : Real.log 0 = 0 := by norm_num
-- !end junk_basic

-- !begin junk_analysis
-- The harmonic series diverges, so its sum is 0.
example : ∑' n : ℕ, (1 / n : ℝ) = 0 :=
  tsum_eq_zero_of_not_summable Real.not_summable_one_div_natCast

-- The empty set of natural numbers has infimum 0.
example : sInf (∅ : Set ℕ) = 0 := Nat.sInf_empty

-- Every function is periodic with period 0.
example (f : ℕ → ℕ) : Function.Periodic f 0 := by
  simp [Function.Periodic]
-- !end junk_analysis

-- !begin coercion
example : ((7 : ℕ) : ℝ) / 2 = 3.5 := by norm_num
example : (((7 : ℕ) / 2 : ℕ) : ℝ) = 3 := by norm_num
-- !end coercion

-- !begin bug_div
-- Wrong as stated: take a = 1, b = 0.
example : ¬ ∀ a b : ℝ, a / b * b = a := by
  intro h
  have := h 1 0
  norm_num at this

-- The right statement needs a hypothesis.
example (a b : ℝ) (hb : b ≠ 0) : a / b * b = a :=
  div_mul_cancel₀ a hb
-- !end bug_div

-- !begin bug_nat
-- Wrong as stated: n = 0 gives 0 - 1 + 1 = 1.
example : ¬ ∀ n : ℕ, n - 1 + 1 = n := by
  intro h
  have := h 0
  omega
-- !end bug_nat

-- !begin vacuous
theorem everything_is_42 (x : ℝ) (h₁ : 0 < x) (h₂ : x < 0) :
    x = 42 := by
  linarith
-- !end vacuous

-- !begin quantifiers
def Cont (f : ℝ → ℝ) : Prop :=
  ∀ x, ∀ ε > 0, ∃ δ > 0, ∀ y, |y - x| < δ → |f y - f x| < ε

def UnifCont (f : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x y, |y - x| < δ → |f y - f x| < ε
-- !end quantifiers

-- !begin goldbach_defs
def Goldbach₁ : Prop :=
  ∀ n : ℕ, 2 < n → Even n → ∃ p q, p.Prime ∧ q.Prime ∧ n = p + q
def Goldbach₂ : Prop :=
  ∀ n : ℕ, Even n → ∃ p q, p.Prime ∧ q.Prime ∧ n = p + q
def Goldbach₃ : Prop :=
  ∀ n : ℕ, 2 < n → Even n → ∃ p q, p.Prime ∨ q.Prime ∧ n = p + q
-- !end goldbach_defs

-- !begin goldbach_two
-- Goldbach₂ is false: 0 is even, and not a sum of two primes.
example : ¬ Goldbach₂ := by
  intro h
  obtain ⟨p, q, hp, -, hpq⟩ := h 0 ⟨0, rfl⟩
  have := hp.two_le
  omega
-- !end goldbach_two

-- !begin goldbach_three
-- Goldbach₃ holds for a silly reason: `∨` binds weaker than `∧`.
example : Goldbach₃ := fun _ _ _ => ⟨2, 0, Or.inl Nat.prime_two⟩
-- !end goldbach_three

/-! ## Trust -/

-- !begin axioms
theorem not_proved : 1 = 2 := by sorry

#print axioms not_proved
-- depends on axioms: [sorryAx]
#print axioms sq_add_sq_ge
-- depends on axioms: [propext, Classical.choice, Quot.sound]
-- !end axioms

end Session1
