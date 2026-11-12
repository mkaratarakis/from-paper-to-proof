import Mathlib

/-!
# Session 2: exercises

Parts 1 and 2: you write the definition or the statement, then prove it.
Part 3: each statement is true, false, or true for a silly reason.
Part 4: a statement from your own work.

Each exercise has two ratings out of 5: how hard it is to *state*,
and how hard to *prove*.
With AI tools, the first number is the one to watch.
-/

namespace Exercises2

open Filter Topology

/-! ## Part 1: definitions

Replace each `sorry` in a `def` by a definition.
The examples below it are its tests:
if your definition is right, you can prove them. -/

-- 1.1  Stating 1/5 · Proving 1/5
-- "M is an upper bound of s": every element of s is at most M.
def IsUpperBound (s : Set ℝ) (M : ℝ) : Prop :=
  sorry

example : IsUpperBound (Set.Icc 0 1) 1 := by
  sorry

example : ¬ IsUpperBound (Set.Icc 0 1) (1 / 2) := by
  sorry

-- Mathlib's version is `upperBounds s`, the set of upper bounds of `s`.
-- If your definition says the same, `Iff.rfl` proves this.
example (s : Set ℝ) (M : ℝ) : IsUpperBound s M ↔ M ∈ upperBounds s := by
  sorry

-- 1.2  Stating 2/5 · Proving 2/5
-- "The sequence a is eventually zero": from some index on, every term is 0.
def EventuallyZero (a : ℕ → ℝ) : Prop :=
  sorry

example : EventuallyZero (fun n => if n < 5 then 1 else 0) := by
  sorry

example : ¬ EventuallyZero (fun _ => 1) := by
  sorry

-- 1.3  Stating 2/5 · Proving 2/5
-- "f is periodic": f (x + c) = f x for all x, for some period c.
-- Careful: every function has period 0 (session 1).
def HasPeriod (f : ℝ → ℝ) : Prop :=
  sorry

example : HasPeriod Real.sin := by
  sorry

example : ¬ HasPeriod (fun x => x) := by
  sorry

-- 1.4  Stating 2/5 · Proving 2/5
-- "n is perfect": n is the sum of its divisors smaller than n (6 = 1 + 2 + 3).
-- Use `n.properDivisors`. Then: is 0 perfect by your definition? Compare with `#print Nat.Perfect`.
def MyPerfect (n : ℕ) : Prop :=
  sorry

example : MyPerfect 6 := by
  sorry

example : ¬ MyPerfect 0 := by
  sorry

/-! ## Part 2: statements

Write the statement in place of the first `sorry`, then prove it. Every one of these
is in Mathlib: search with `exact?`, Loogle or LeanSearch. -/

-- 2.1  Stating 1/5 · Proving 1/5
-- Paper: the sum of two odd integers is even.
example : sorry := by
  sorry

-- 2.2  Stating 2/5 · Proving 1/5
-- Paper: there are infinitely many primes. (Hint: `Set.Infinite`.)
example : sorry := by
  sorry

-- 2.3  Stating 2/5 · Proving 2/5
-- Paper: a continuous function on [a, b] is bounded.
-- (Hint: `ContinuousOn f (Set.Icc a b)`. Do you need a ≤ b?)
example : sorry := by
  sorry

-- 2.4  Stating 2/5 · Proving 1/5
-- Paper: a differentiable function f : ℝ → ℝ with f' = 0 everywhere is constant.
example : sorry := by
  sorry

-- 2.5  Stating 2/5 · Proving 1/5
-- Paper: an injective map from a finite set to itself is surjective.
example : sorry := by
  sorry

-- 2.6  Stating 3/5 · Proving 1/5
-- Paper: a nonzero real polynomial has at most as many roots as its degree.
-- (Hint: `p.roots` is the multiset of roots. Is `p ≠ 0` needed in Lean?)
example : sorry := by
  sorry

/-! ## Part 3: find the bug

Each statement is true, false, or true for a silly reason. Decide which.
If false: prove its negation, then write a corrected statement and prove it. -/

-- 3.1  Stating 1/5 · Proving 1/5
example : ∀ a b c : ℝ, a * c = b * c → a = b := by
  sorry

-- 3.2  Stating 1/5 · Proving 2/5
example : ∀ n : ℕ, ∑ i ∈ Finset.range n, (2 * i + 1) = n ^ 2 := by
  sorry

-- 3.3  Stating 1/5 · Proving 1/5
example : ∀ p : ℕ, p.Prime → Odd p := by
  sorry

-- 3.4  Stating 2/5 · Proving 3/5.  Paper: 1/x is unbounded on (0, 1).
example : ∃ x ∈ Set.Ioo (0 : ℝ) 1, ∀ M : ℝ, M < 1 / x := by
  sorry

-- 3.5  Stating 1/5 · Proving 1/5.  Is this a theorem worth having?
example (f : ℝ → ℝ) (h : ∀ x, f x = 0 ∧ f x = 1) : f 0 = 5 := by
  sorry

-- 3.6  Stating 2/5 · Proving 3/5.  Hint: from `h`, get `Monotone a` first.
example (a : ℕ → ℝ) (h : ∀ n, a n ≤ a (n + 1))
    (hlim : Tendsto a atTop (𝓝 1)) : ∀ n, a n ≤ 1 := by
  sorry

/-! ## Part 4: your own statement

Take the result from your own work that you thought of after session 1.

1. Write it on paper, with every hypothesis.
2. Ask an AI to formalize it, with the prompt from the slides. Do not let it prove it.
3. Go through the checklist. Write down every change you make, and why.
4. Show that the hypotheses can hold together, and check one special case you know.

Bring the statement to session 3: there we will try to prove it with AI tools. -/

end Exercises2
