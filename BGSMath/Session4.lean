import Mathlib

/-!
# Session 4: Your own theorem

Every block of code on the session 4 slides is cut out of this file between
`-- !begin <tag>` and `-- !end <tag>`, so the slides only ever show code that compiles.
One theorem, from the paper statement to the audited proof.
-/

namespace Session4

open Set

/-! ## The statement -/

-- !begin fixed_stmt
-- Paper: a continuous f : [0, 1] → [0, 1]
-- has a fixed point.
def Statement : Prop :=
  ∀ f : ℝ → ℝ,
    ContinuousOn f (Icc 0 1) →
    (∀ x ∈ Icc (0 : ℝ) 1, f x ∈ Icc 0 1) →
    ∃ c ∈ Icc (0 : ℝ) 1, f c = c
-- !end fixed_stmt

/-! ## Tests -/

-- !begin fixed_tests
-- The hypotheses can hold: f = 1/2.
example : ContinuousOn (fun _ : ℝ => (1 / 2 : ℝ))
      (Icc 0 1) ∧
    ∀ x ∈ Icc (0 : ℝ) 1, (1 / 2 : ℝ) ∈ Icc 0 1 :=
  ⟨continuousOn_const, fun _ _ => by norm_num⟩

-- Without "f maps into [0, 1]": f x = x + 1.
example : ¬ ∀ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) →
    ∃ c ∈ Icc (0 : ℝ) 1, f c = c := by
  intro h
  obtain ⟨c, -, hc⟩ := h (fun x => x + 1) (by fun_prop)
  linarith
-- !end fixed_tests

/-! ## A conditional proof: the gap is stated, not hidden -/

-- !begin conditional
-- The step we need, stated precisely.
def IVT : Prop :=
  ∀ g : ℝ → ℝ, ContinuousOn g (Icc 0 1) →
    g 1 ≤ 0 → 0 ≤ g 0 →
    ∃ c ∈ Icc (0 : ℝ) 1, g c = 0

theorem main_of_ivt (h : IVT) :
    Statement := by
  intro f hf hmaps
  have h0 := (hmaps 0 ⟨le_rfl, zero_le_one⟩).1
  have h1 := (hmaps 1 ⟨zero_le_one, le_rfl⟩).2
  obtain ⟨c, hc, hgc⟩ :=
    h (fun x => f x - x)
      (hf.sub continuousOn_id)
      (by linarith) (by linarith)
  exact ⟨c, hc, by linarith⟩
-- !end conditional

/-! ## Closing the gap -/

-- !begin close_gap
theorem ivt : IVT := by
  intro g hg h1 h0
  exact intermediate_value_Icc' zero_le_one hg
    ⟨h1, h0⟩

theorem main : Statement :=
  main_of_ivt ivt
-- !end close_gap

/-! ## Audit -/

-- !begin audit
#print axioms main_of_ivt
-- depends on axioms:
--   [propext, Classical.choice, Quot.sound]
#print axioms main
-- depends on axioms:
--   [propext, Classical.choice, Quot.sound]
-- !end audit

/-! ## Four areas: one slide each (the exercises are in `Exercises4.lean`) -/

section Graphs

open Finset

-- !begin area_graphs
variable {V : Type} (G : SimpleGraph V)

-- No vertex is adjacent to itself.
example (v : V) : ¬ G.Adj v v :=
  G.irrefl

-- The handshake lemma: found by exact?
example [Fintype V] [DecidableRel G.Adj] :
    ∑ v, G.degree v = 2 * #G.edgeFinset :=
  G.sum_degrees_eq_twice_card_edges
-- !end area_graphs

end Graphs

section Calculus

open Filter

-- !begin area_analysis
-- 1/n → 0: found by exact?
example : Tendsto (fun n : ℕ => 1 / (n : ℝ))
    atTop (nhds 0) :=
  tendsto_one_div_atTop_nhds_zero_nat

-- Continuity: one tactic.
example : Continuous
    (fun x : ℝ => 2 * x + 1) := by
  fun_prop
-- !end area_analysis

end Calculus

section CommAlg

-- !begin area_algebra
variable {R : Type} [CommRing R]

-- 6 ∈ (2) in ℤ: membership is divisibility.
example : (6 : ℤ) ∈ Ideal.span {2} := by
  simp [Ideal.mem_span_singleton]

-- Maximal ideals are prime: found by exact?
example (I : Ideal R) (h : I.IsMaximal) :
    I.IsPrime :=
  h.isPrime
-- !end area_algebra

-- !begin nil_stmt
-- The sum of two nilpotents is nilpotent.
theorem nil_add (x y : R)
    (hx : IsNilpotent x) (hy : IsNilpotent y) :
    IsNilpotent (x + y) :=
-- !end nil_stmt
-- !begin nil_proof
  Commute.isNilpotent_add
    (Commute.all x y) hx hy
-- !end nil_proof

end CommAlg

section Cats

open CategoryTheory

-- !begin area_cats
variable {C : Type} [Category C]

-- f ≫ g is "first f, then g".
example {W X Y Z : C} (f : W ⟶ X)
    (g : X ⟶ Y) (h : Y ⟶ Z) :
    (f ≫ g) ≫ h = f ≫ g ≫ h := by
  simp

-- Monos in sets are injective: exact?
example {X Y : Type} (f : X ⟶ Y) :
    Mono f ↔ Function.Injective f :=
  mono_iff_injective f
-- !end area_cats

end Cats

end Session4
