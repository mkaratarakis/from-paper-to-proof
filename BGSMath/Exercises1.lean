import Mathlib

/-!
# Session 1: exercises

Replace each `sorry` with a proof. Keep the infoview open.

Each exercise has two ratings out of 5: how hard it is to *state*, and how hard to *prove*.
With AI tools, the first number is the one to watch.
-/

namespace Exercises1

/-! ## Part 1: logic

Tactics: `intro`, `exact`, `apply`, `use`, `obtain`, `constructor`, `left`, `right`. -/

-- 1.1  Stating 1/5 · Proving 1/5
example (P Q R : Prop) (hpq : P → Q) (hqr : Q → R) : P → R := by
  sorry

-- 1.2  Stating 1/5 · Proving 1/5
example (P Q : Prop) (h : P ∧ Q) : P ∨ Q := by
  sorry

-- 1.3  Stating 1/5 · Proving 1/5
example : ∃ n : ℕ, 3 < n ∧ n < 5 := by
  sorry

-- 1.4  Stating 1/5 · Proving 1/5
example (f : ℕ → ℕ) (h : ∀ n, f n = 2 * n) : ∃ n, f n = 10 := by
  sorry

-- 1.5  Stating 1/5 · Proving 2/5.  Hint: `¬¬P` means `(P → False) → False`.
example (P : Prop) (hp : P) : ¬¬P := by
  sorry

-- 1.6  Stating 1/5 · Proving 2/5
example (s : ℕ → Prop) (h : ∀ n, s n → s (n + 1)) (h0 : s 0) : s 2 := by
  sorry

/-! ## Part 2: automation

One tactic each: `ring`, `linarith`, `positivity`, `norm_num`, `omega`, `fun_prop`, `gcongr`. -/

-- 2.1  Stating 1/5 · Proving 1/5
example (x y : ℝ) : (x - y) * (x + y) = x ^ 2 - y ^ 2 := by
  sorry

-- 2.2  Stating 1/5 · Proving 1/5
example (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) : 0 ≤ a * b + a ^ 2 := by
  sorry

-- 2.3  Stating 1/5 · Proving 1/5
example (x : ℝ) (h : 2 * x + 1 < 7) : x < 3 := by
  sorry

-- 2.4  Stating 1/5 · Proving 1/5
example : (123 : ℕ) * 45 = 5535 := by
  sorry

-- 2.5  Stating 1/5 · Proving 1/5
example (n : ℕ) (h : n % 6 = 5) : n % 3 = 2 := by
  sorry

-- 2.6  Stating 1/5 · Proving 1/5
example : Continuous (fun x : ℝ => Real.exp x * Real.cos x) := by
  sorry

-- 2.7  Stating 1/5 · Proving 1/5
example (a b : ℝ) (h : a ≤ b) : Real.exp a ≤ Real.exp b := by
  sorry

/-! ## Part 3: search

Each of these is already in Mathlib. Find it with `exact?`, Loogle or LeanSearch,
then replace the `by exact?` with the lemma, so the file does not search every time. -/

-- 3.1  Stating 1/5 · Proving 1/5
example (a b : ℝ) : |a + b| ≤ |a| + |b| := by
  sorry

-- 3.2  Stating 1/5 · Proving 1/5
example (p : ℕ) (hp : p.Prime) (h2 : p ≠ 2) : Odd p := by
  sorry

-- 3.3  Stating 1/5 · Proving 1/5
example (x : ℝ) (n : ℕ) : Real.log (x ^ n) = n * Real.log x := by
  sorry

-- 3.4  Stating 1/5 · Proving 1/5
example (n m : ℕ) (hn : Even n) : Even (n * m) := by
  sorry

-- 3.5  Stating 2/5 · Proving 1/5.  Why is it stated with `* 2` and not with `/ 2`?
example (n : ℕ) : (∑ i ∈ Finset.range n, i) * 2 = n * (n - 1) := by
  sorry

/-! ## Part 4: reading

Each statement below is true, false, or true for a silly reason.
Decide which. Then delete the line that does not hold and prove the other one. -/

-- 4.1  Stating 1/5 · Proving 1/5
example : ∀ x : ℝ, x / x = 1 := by sorry
example : ¬ ∀ x : ℝ, x / x = 1 := by sorry

-- 4.2  Stating 1/5 · Proving 1/5
example : ∀ n : ℕ, (n - 3) + 3 ≥ n := by sorry
example : ¬ ∀ n : ℕ, (n - 3) + 3 ≥ n := by sorry

-- 4.3  Stating 1/5 · Proving 2/5
example : ∀ x : ℝ, Real.sqrt (x ^ 2) = x := by sorry
example : ¬ ∀ x : ℝ, Real.sqrt (x ^ 2) = x := by sorry

-- 4.4  Stating 1/5 · Proving 1/5.  Is this a theorem worth having?
example (x : ℕ) (h₁ : x < 2) (h₂ : 5 < x) : x = 100 := by sorry

-- 4.5  Stating 2/5 · Proving 2/5
example : ∃ x : ℝ, ∀ y : ℝ, y ≤ x := by sorry
example : ¬ ∃ x : ℝ, ∀ y : ℝ, y ≤ x := by sorry

-- 4.6  Stating 2/5 · Proving 1/5.  Compare with 4.5.
example : ∀ y : ℝ, ∃ x : ℝ, y ≤ x := by sorry
example : ¬ ∀ y : ℝ, ∃ x : ℝ, y ≤ x := by sorry

-- 4.7  Stating 2/5 · Proving 3/5.  Hint: search for a lemma about `1 / (n + 1) < ε`.
example (ε : ℝ) (hε : 0 < ε) : ∃ N : ℕ, ∀ n ≥ N, (1 : ℝ) / (n + 1) < ε := by sorry

end Exercises1
