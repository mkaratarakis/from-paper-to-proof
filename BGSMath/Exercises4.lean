import Mathlib

/-!
# Session 4: exercises on four areas

Graph theory, analysis, commutative algebra and category theory: the same few steps in each.

1. Find how Mathlib says it. Each section starts with `#check` lines: click on them and read
   the infoview. The section's comment explains the notation.
2. Try `exact?` first. Many basic facts are already in Mathlib, and `exact?` finds them by
   their statement. If it fails, a search engine (Loogle, LeanSearch) or an AI can find the name.
3. Otherwise a short tactic proof: `simp`, `decide`, `ring`, `linarith`, `fun_prop`, `positivity`.

The last exercise of each section is "with an AI": only the English is given. Ask an AI for a
Lean statement, read it aloud (session 1), test it (session 2), and only then prove it. Compare
with the statement in `Solutions4.lean`.

Solutions: `Solutions4.lean`.
-/

namespace Exercises4

/-! ## 1. Graph theory

A graph on a vertex type `V` is `G : SimpleGraph V`. Its one field is `G.Adj u v`, "u and v are
adjacent". Finite graphs need `[Fintype V]` to count, and `[DecidableRel G.Adj]` to compute
degrees. -/

section Graphs

open Finset SimpleGraph

#check SimpleGraph
#check @SimpleGraph.degree
#check completeGraph
#check pathGraph

variable {V : Type} (G : SimpleGraph V)

-- 1.1  Paper: no vertex is adjacent to itself.
theorem g1_1 (v : V) : ¬ G.Adj v v := by
  sorry

-- 1.2  Paper: if u is adjacent to v, then v is adjacent to u.
theorem g1_2 (u v : V) (h : G.Adj u v) : G.Adj v u := by
  sorry

-- 1.3  Paper: adjacent vertices are distinct.
theorem g1_3 (u v : V) (h : G.Adj u v) : u ≠ v := by
  sorry

-- 1.4  Paper: the sum of the degrees is twice the number of edges (the handshake lemma).
theorem g1_4 [Fintype V] [DecidableRel G.Adj] : ∑ v, G.degree v = 2 * #G.edgeFinset := by
  sorry

-- 1.5  Paper: in the complete graph on n vertices, every vertex has degree n - 1.
theorem g1_5 (n : ℕ) (v : Fin n) : (completeGraph (Fin n)).degree v = n - 1 := by
  sorry

-- 1.6  Paper: in the path 0 - 1 - 2 - 3, the vertices 1 and 2 are adjacent and 0 and 2 are not.
-- Hint: `rw [pathGraph_adj]`, then `decide`.
theorem g1_6 : (pathGraph 4).Adj 1 2 ∧ ¬ (pathGraph 4).Adj 0 2 := by
  sorry

-- 1.7  A graph of your own: the square 0 - 1 - 2 - 3 - 0, defined by "j = i + 1" in `Fin 4`,
-- where 3 + 1 = 0. `fromRel` makes the relation symmetric and removes loops.
def square : SimpleGraph (Fin 4) := SimpleGraph.fromRel fun i j => j = i + 1

theorem g1_7 : square.Adj 0 3 ∧ ¬ square.Adj 0 2 := by
  sorry

-- 1.8  With an AI. Paper: every finite graph has an even number of vertices of odd degree.

/-! ### Step up

A few lines each: a Mathlib fact and a tactic together. Each has a hint. -/

-- 1.9  Paper: every vertex of the 5-cycle has degree 2.
-- Hint: `decide`.
theorem g1_9 : ∀ v, (cycleGraph 5).degree v = 2 := by
  sorry

-- 1.10  Paper: the complete graph on n vertices has n(n - 1)/2 edges, that is, n choose 2.
-- Hint: `rw [card_edgeFinset_top_eq_card_choose_two, Fintype.card_fin]`.
theorem g1_10 (n : ℕ) : #(completeGraph (Fin n)).edgeFinset = n.choose 2 := by
  sorry

-- 1.11  Paper: a path can be coloured with 2 colours.
-- Hint: `exact?`.
theorem g1_11 (n : ℕ) : (pathGraph n).Colorable 2 := by
  sorry

-- 1.12  Paper: if every vertex has degree 3, the number of vertices is even.
-- Hint: take the handshake lemma (1.4) as `have`, then `simp [h] at this`, then `omega`.
theorem g1_12 [Fintype V] [DecidableRel G.Adj] (h : ∀ v, G.degree v = 3) :
    Even (Fintype.card V) := by
  sorry

end Graphs

/-! ## 2. Analysis

Limits are written with filters: `Tendsto u atTop (𝓝 a)` means "u n → a as n → ∞". You do not
need to know what a filter is to use them; read it as the sentence in quotes. -/

section Calculus

open Filter Topology

#check @Tendsto
#check @Continuous
#check @deriv
#check @tsum

-- 2.1  Paper: 1/n → 0.
theorem a2_1 : Tendsto (fun n : ℕ => 1 / (n : ℝ)) atTop (𝓝 0) := by
  sorry

-- 2.2  The same, by hand, with ε and N: for every ε > 0 there is N with 1/(n + 1) < ε for n ≥ N.
-- Hint: `exists_nat_one_div_lt`, then `gcongr`.
theorem a2_2 (ε : ℝ) (hε : 0 < ε) : ∃ N : ℕ, ∀ n ≥ N, 1 / ((n : ℝ) + 1) < ε := by
  sorry

-- 2.3  Paper: x ↦ 2x + 1 is continuous.
theorem a2_3 : Continuous (fun x : ℝ => 2 * x + 1) := by
  sorry

-- 2.4  The same, by hand, with ε and δ (in fact uniformly: δ does not depend on x).
theorem a2_4 :
    ∀ ε > 0, ∃ δ > 0, ∀ x y : ℝ, |x - y| < δ → |(2 * x + 1) - (2 * y + 1)| < ε := by
  sorry

-- 2.5  Paper: the derivative of x² at 3 is 6.
theorem a2_5 : deriv (fun x : ℝ => x ^ 2) 3 = 6 := by
  sorry

-- 2.6  Paper: 1 + 1/2 + 1/4 + ... = 2.
theorem a2_6 : ∑' n : ℕ, (1 / 2 : ℝ) ^ n = 2 := by
  sorry

-- 2.7  With an AI. Paper: a continuous function on [0, 1] attains its maximum.

/-! ### Step up

A few lines each: a Mathlib fact and a tactic together. Each has a hint. -/

-- 2.8  Paper: 1 + 1/n → 1.
-- Hint: from 2.1, with `Tendsto.const_add`; then `simpa`.
theorem a2_8 : Tendsto (fun n : ℕ => 1 + 1 / (n : ℝ)) atTop (𝓝 1) := by
  sorry

-- 2.9  Paper: if 0 ≤ uₙ ≤ 1/n for all n, then uₙ → 0 (the squeeze theorem).
-- Hint: `squeeze_zero`, with 2.1.
theorem a2_9 (u : ℕ → ℝ) (h0 : ∀ n, 0 ≤ u n) (h1 : ∀ n, u n ≤ 1 / n) :
    Tendsto u atTop (𝓝 0) := by
  sorry

-- 2.10  Paper: the derivative of x sin x is sin x + x cos x.
-- Hint: `simp`.
theorem a2_10 (x : ℝ) :
    deriv (fun x => x * Real.sin x) x = Real.sin x + x * Real.cos x := by
  sorry

-- 2.11  Paper: x ↦ sin(x² + 1) is continuous.
-- Hint: `fun_prop`.
theorem a2_11 : Continuous fun x : ℝ => Real.sin (x ^ 2 + 1) := by
  sorry

-- 2.12  Paper: x ↦ 2x + 1 is strictly increasing.
-- Hint: `intro a b h`, then `linarith`. (`StrictMono f` means: a < b → f a < f b.)
theorem a2_12 : StrictMono fun x : ℝ => 2 * x + 1 := by
  sorry

end Calculus

/-! ## 3. Commutative algebra

A commutative ring is a type `R` with `[CommRing R]`. An ideal is `I : Ideal R`; the ideal
generated by `a` is `Ideal.span {a}`. Prime and maximal are `I.IsPrime` and `I.IsMaximal`. -/

section CommAlg

#check CommRing
#check Ideal
#check @Ideal.span
#check @Ideal.IsPrime
#check @Ideal.IsMaximal
#check ZMod

variable {R : Type} [CommRing R]

-- 3.1  Paper: (a + b)² = a² + 2ab + b² in any commutative ring.
-- Hint: `ring`.
theorem c3_1 (a b : R) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by
  sorry

-- 3.2  Paper: (a + b)(a - b) = a² - b².
-- Hint: `ring`.
theorem c3_2 (a b : R) : (a + b) * (a - b) = a ^ 2 - b ^ 2 := by
  sorry

-- 3.3  Paper: in ℤ/5, 3 · 2 = 1, so 3 is invertible.
-- Hint: `decide`.
theorem c3_3 : (3 : ZMod 5) * 2 = 1 := by
  sorry

-- 3.4  Paper: 6 ∈ (2) in ℤ.
-- Hint: `simp [Ideal.mem_span_singleton]`.
theorem c3_4 : (6 : ℤ) ∈ Ideal.span {2} := by
  sorry

-- 3.5  Paper: 3 ∉ (2) in ℤ.
-- Hint: `simp [Ideal.mem_span_singleton]`.
theorem c3_5 : (3 : ℤ) ∉ Ideal.span {2} := by
  sorry

-- 3.6  Paper: every ideal contains 0.
-- Hint: `exact?`.
theorem c3_6 (I : Ideal R) : (0 : R) ∈ I := by
  sorry

-- 3.7  Paper: every maximal ideal is prime.
-- Hint: `exact?`.
theorem c3_7 (I : Ideal R) (h : I.IsMaximal) : I.IsPrime := by
  sorry

-- 3.8  Paper: a field has only two ideals, 0 and the whole field.
-- Hint: `exact?`.
theorem c3_8 {K : Type} [Field K] (I : Ideal K) : I = ⊥ ∨ I = ⊤ := by
  sorry

-- 3.9  With an AI. Paper: the sum of two nilpotent elements is nilpotent.
-- Try `exact?` on your statement first. Why does it fail?

/-! ### Step up

One tactic each, as before: mostly `exact?`. -/

-- 3.10  Paper: ℤ/6 has zero divisors.
-- Hint: `decide`.
theorem c3_10 : ∃ a b : ZMod 6, a ≠ 0 ∧ b ≠ 0 ∧ a * b = 0 := by
  sorry

-- 3.11  Paper: an ideal is closed under addition.
-- Hint: `exact?`.
theorem c3_11 (I : Ideal R) (a b : R) (ha : a ∈ I) (hb : b ∈ I) : a + b ∈ I := by
  sorry

-- 3.12  Paper: the kernel of a ring homomorphism absorbs products.
-- Hint: `exact?`.
theorem c3_12 (f : R →+* R) (x y : R) (hx : x ∈ RingHom.ker f) : x * y ∈ RingHom.ker f := by
  sorry

-- 3.13  Paper: if x² = 0, then x is nilpotent.
-- Hint: `exact?`.
theorem c3_13 (x : R) (h : x ^ 2 = 0) : IsNilpotent x := by
  sorry

-- 3.14  Paper: the units of ℤ are 1 and -1.
-- Hint: `exact?`.
theorem c3_14 (u : ℤ) : IsUnit u ↔ u = 1 ∨ u = -1 := by
  sorry

-- 3.15  Paper: IJ ⊆ I ∩ J.
-- Hint: `exact?`.
theorem c3_15 (I J : Ideal R) : I * J ≤ I ⊓ J := by
  sorry

-- 3.16  Paper: I ⊆ I + J.
-- Hint: `simp`.
theorem c3_16 (I J : Ideal R) : I ≤ I ⊔ J := by
  sorry

-- 3.17  Paper: a ring homomorphism from a field to a nonzero ring is injective.
-- Hint: `exact?`.
theorem c3_17 {K S : Type} [Field K] [CommRing S] [Nontrivial S] (f : K →+* S) :
    Function.Injective f := by
  sorry

end CommAlg

/-! ## 4. Category theory

A category is a type of objects `C` with `[Category C]`. Morphisms from `X` to `Y` are
`f : X ⟶ Y` (type `\hom`). Composition is written in diagram order: `f ≫ g` is "first f, then g"
(type `\gg`), that is g ∘ f. Identities are `𝟙 X` (type `\b1`). Isomorphisms are `e : X ≅ Y`,
functors `F : C ⥤ D` (type `\func`). -/

section Cats

open CategoryTheory

#check Category
#check @Iso
#check Functor
#check @Mono

variable {C : Type} [Category C] {D : Type} [Category D]

-- 4.1  Paper: composition is associative.
theorem k4_1 {W X Y Z : C} (f : W ⟶ X) (g : X ⟶ Y) (h : Y ⟶ Z) :
    (f ≫ g) ≫ h = f ≫ g ≫ h := by
  sorry

-- 4.2  Paper: the identity is a left unit, and an isomorphism followed by its inverse is
-- the identity.
theorem k4_2 {X Y : C} (f : X ⟶ Y) (e : X ≅ Y) : 𝟙 X ≫ f = f ∧ e.hom ≫ e.inv = 𝟙 X := by
  sorry

-- 4.3  Paper: a functor preserves composition.
theorem k4_3 (F : C ⥤ D) {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) :
    F.map (f ≫ g) = F.map f ≫ F.map g := by
  sorry

-- 4.4  Paper: composing functors composes what they do on objects.
theorem k4_4 (F : C ⥤ D) (G : D ⥤ C) (X : C) : (F ⋙ G).obj X = G.obj (F.obj X) := by
  sorry

-- 4.5  Paper: in the category of sets, morphisms are functions and f ≫ g is g ∘ f.
theorem k4_5 {X Y Z : Type} (f : X ⟶ Y) (g : Y ⟶ Z) (x : X) : (f ≫ g) x = g (f x) := by
  sorry

-- 4.6  Paper: in the category of sets, the monomorphisms are the injective functions.
theorem k4_6 {X Y : Type} (f : X ⟶ Y) : Mono f ↔ Function.Injective f := by
  sorry

-- 4.7  Paper: a composition of monomorphisms is a monomorphism.
-- Hint: `inferInstance`. Why does that work?
theorem k4_7 {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) [Mono f] [Mono g] : Mono (f ≫ g) := by
  sorry

-- 4.8  With an AI. Paper: a functor sends isomorphisms to isomorphisms.

/-! ### Step up

A few lines each: a Mathlib fact and a tactic together. Each has a hint. -/

-- 4.9  Paper: an isomorphism is a monomorphism and an epimorphism.
-- Hint: `exact ⟨inferInstance, inferInstance⟩`.
theorem k4_9 {X Y : C} (e : X ≅ Y) : Mono e.hom ∧ Epi e.hom := by
  sorry

-- 4.10  Paper: a composition of epimorphisms is an epimorphism.
-- Hint: `inferInstance`, as in 4.7.
theorem k4_10 {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) [Epi f] [Epi g] : Epi (f ≫ g) := by
  sorry

-- 4.11  Construct, do not prove: a functor turns an isomorphism X ≅ Y into F X ≅ F Y.
-- Hint: `F.mapIso`. The answer is an isomorphism, not a proof, so this is a `def`.
def k4_11 (F : C ⥤ D) {X Y : C} (e : X ≅ Y) : F.obj X ≅ F.obj Y :=
  sorry

-- 4.12  Paper: two morphisms into a terminal object are equal.
-- Hint: `exact?`.
theorem k4_12 {T X : C} (h : Limits.IsTerminal T) (f g : X ⟶ T) : f = g := by
  sorry

-- 4.13  Paper: in the category of sets, the epimorphisms are the surjective functions.
-- Hint: `exact?`.
theorem k4_13 {X Y : Type} (f : X ⟶ Y) : Epi f ↔ Function.Surjective f := by
  sorry

end Cats

end Exercises4
