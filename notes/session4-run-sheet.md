# Session 4 run sheet — Thursday 19 November

Written for the slides `slides/BGSMath-Lean-session4-draft.pdf` and the exercise file
`BGSMath/Exercises4.lean`. Clock times assume the same slot as before, 15:00–17:00. If the slot
differs, shift them.

## The one rule

**On every slide, read the blue box aloud.** Then say what is on the slide in your own words,
and go on. This session is mostly live: the slides frame it, the four areas are the content.

## Before you leave home

- `lake build` in the course folder: it must finish with only the expected warnings (README).
- Solve `Exercises4.lean` once yourself, live-speed, and note where you hesitated.
  `Solutions4.lean` has every answer; it is git-ignored, so it is on your laptop only.
- Check that the AI you will use answers on the university network, or bring a hotspot.
- Afterwards, put `Exercises4.lean` back to its `sorry`s (`git checkout BGSMath/Exercises4.lean`,
  once the file is committed).

## In the room

- Slides PDF in full screen on one screen. VS Code on the other, or switch between them.
- In VS Code: `BGSMath/Exercises4.lean` open, `Solutions4.lean` in a second tab, the AI in a
  browser tab or a terminal panel. Font size up (Cmd+= twice): the infoview must be readable from
  the back row.

## Timing

| Time | Part | Where |
|---|---|---|
| 15:00 | Opening | title → "Today" |
| 15:05 | One theorem, start to finish, briskly | "The statement" → "The audit"; `Session4.lean` |
| 15:15 | Graph theory | slides "Four areas, the same steps" and "Graph theory"; `Exercises4.lean`, section 1 |
| 15:38 | Analysis | slide "Analysis"; section 2 |
| 16:00 | Break | 5 minutes |
| 16:05 | Commutative algebra | slides "Commutative algebra" and "When the search finds nothing"; section 3 |
| 16:28 | Category theory | slide "Category theory"; section 4 |
| 16:50 | At home, after the course | "Your own theorem" → "The one idea of the course", quickly |
| 16:55 | Questions | |

About 22 minutes per area: the basics in 10 (not all of them: the four steps below), then
the step-ups in 12 (two or three of them, the room suggesting the next tactic). Whatever is not
done live is homework.

**Running late?** Do fewer step-ups; never fewer basics than the four steps. Never skip
exercise 3.9: it is the one where the search fails and the room has to think.

**Time left over?** More step-ups, or ask the room for a statement in one of the four areas.

## Each area, the same four steps

Each area has one slide: the notation on the left, two examples on the right (from
`Session4.lean`). Show the slide, then switch to `Exercises4.lean` and do the steps live.

Each section of `Exercises4.lean` has the same shape, so after the first one the room knows what
comes next. Say so at the start of graph theory.

1. **The `#check` lines** at the top of the section. Click each one and read the infoview aloud.
   Explain the notation from the section comment.
2. **Two exercises with `exact?`.** Say: the basic facts are in Mathlib already; the work is to
   state what you want precisely enough to find it.
3. **One exercise by tactic.**
4. **The "with an AI" exercise.** Only the English is given. Ask an AI for a Lean statement, read
   it aloud (session 1), then try `exact?`. Compare with the statement in `Solutions4.lean`.

| Area | `#check` | With `exact?` | By tactic | With an AI |
|---|---|---|---|---|
| Graph theory | `SimpleGraph`, `degree`, `completeGraph`, `pathGraph` | 1.4 handshake | 1.6 path graph: `rw [pathGraph_adj]`, `decide` | 1.8 odd-degree vertices |
| Analysis | `Tendsto`, `Continuous`, `deriv`, `tsum` | 2.1 1/n → 0; 2.6 geometric series | 2.4 ε–δ by hand | 2.7 maximum on [0, 1] |
| Commutative algebra | `CommRing`, `Ideal`, `Ideal.span`, `IsPrime`, `IsMaximal`, `ZMod` | 3.7 maximal is prime; 3.8 ideals of a field | 3.4 6 ∈ (2): `simp [Ideal.mem_span_singleton]` | 3.9 nilpotents |
| Category theory | `Category`, `Iso`, `Functor`, `Mono` | 4.6 monos in sets | 4.2 identities and isos: `simp` | 4.8 functors and isos |

`exact?` finds 1.4, 2.1, 2.6, 3.6–3.8, 4.6 and the AI exercises 1.8 and 4.8 in a few seconds each.
In commutative algebra every exercise is one tactic: `ring`, `decide`, `simp`, or `exact?`.

**Exercise 3.9, the one to slow down on.** `exact?` fails on "the sum of two nilpotent elements is
nilpotent". Ask the room why. Answer: Mathlib states the lemma for any ring, where it needs
x and y to commute; in a commutative ring, `Commute.all x y` gives that. The proof is
`Commute.isNilpotent_add (Commute.all x y) hx hy`. The point: a search fails when your statement
and Mathlib's differ, even if they are the same mathematics.

## Every answer, at a glance

Every proof below compiles (`Solutions4.lean`). `exact?` means: type it, click the suggestion.

| # | Answer |
|---|---|
| 1.1 | `G.irrefl` |
| 1.2 | `h.symm` |
| 1.3 | `h.ne` |
| 1.4 | `exact?` (`G.sum_degrees_eq_twice_card_edges`) |
| 1.5 | `simp [complete_graph_degree]` |
| 1.6 | `constructor <;> rw [pathGraph_adj] <;> decide` |
| 1.7 | `constructor <;> simp [square]` |
| 1.8 | `exact?` (`G.even_card_odd_degree_vertices`) |
| 1.9 | `decide` |
| 1.10 | `rw [card_edgeFinset_top_eq_card_choose_two, Fintype.card_fin]` |
| 1.11 | `exact?` (`IsBipartite.pathGraph n`) |
| 1.12 | `have := G.sum_degrees_eq_twice_card_edges`, `simp [h] at this`, `rw [Nat.even_iff]`, `omega` |
| 2.1 | `exact?` (`tendsto_one_div_atTop_nhds_zero_nat`) |
| 2.2 | `obtain ⟨N, hN⟩ := exists_nat_one_div_lt hε`, then `refine ⟨N, fun n hn => lt_of_le_of_lt ?_ hN⟩`, `gcongr` |
| 2.3 | `fun_prop` |
| 2.4 | `intro ε hε`, `refine ⟨ε / 2, by positivity, fun x y h => ?_⟩`, rewrite to `2 * (x - y)`, `abs_mul`, `norm_num`, `linarith` |
| 2.5 | `simp`, then `norm_num` |
| 2.6 | `exact?` (`tsum_geometric_two`) |
| 2.7 | `isCompact_Icc.exists_isMaxOn (Set.nonempty_Icc.mpr zero_le_one) hf` |
| 2.8 | `simpa using tendsto_one_div_atTop_nhds_zero_nat.const_add (1 : ℝ)` |
| 2.9 | `squeeze_zero h0 h1 tendsto_one_div_atTop_nhds_zero_nat` |
| 2.10 | `simp` |
| 2.11 | `fun_prop` |
| 2.12 | `intro a b h`, `linarith` |
| 3.1 | `ring` |
| 3.2 | `ring` |
| 3.3 | `decide` |
| 3.4 | `simp [Ideal.mem_span_singleton]` |
| 3.5 | `simp [Ideal.mem_span_singleton]` |
| 3.6 | `exact?` (`I.zero_mem`) |
| 3.7 | `exact?` (`h.isPrime`) |
| 3.8 | `exact?` (`I.eq_bot_or_top`) |
| 3.9 | `exact Commute.isNilpotent_add (Commute.all x y) hx hy` (`exact?` fails: the point of the exercise) |
| 3.10 | `decide` |
| 3.11 | `exact?` (`I.add_mem ha hb`) |
| 3.12 | `exact?` (`Ideal.mul_mem_right y _ hx`) |
| 3.13 | `exact?` (`⟨2, h⟩`) |
| 3.14 | `exact?` (`Int.isUnit_iff`) |
| 3.15 | `exact?` (`Ideal.mul_le_inf`) |
| 3.16 | `simp` |
| 3.17 | `exact?` (`RingHom.injective f`) |
| 4.1 | `Category.assoc f g h`, or `simp` |
| 4.2 | `simp` |
| 4.3 | `F.map_comp f g` |
| 4.4 | `rfl` |
| 4.5 | `rfl` |
| 4.6 | `exact?` (`mono_iff_injective f`) |
| 4.7 | `inferInstance` |
| 4.8 | `exact?` (`Functor.map_isIso F f`), or `inferInstance` |
| 4.9 | `exact ⟨inferInstance, inferInstance⟩` |
| 4.10 | `inferInstance` |
| 4.11 | `F.mapIso e` |
| 4.12 | `exact?` (`h.hom_ext f g`) |
| 4.13 | `exact?` (`epi_iff_surjective f`) |

## Questions you may get

| Question | Answer |
|---|---|
| *What is a filter?* | Not needed today: read `Tendsto u atTop (𝓝 a)` as "u n → a". |
| *Why `[DecidableRel G.Adj]`?* | To compute a degree, Lean must be able to decide adjacency. For counting, the vertex type must be finite: `[Fintype V]`. |
| *Why `f ≫ g` and not `g ∘ f`?* | Mathlib writes composition in diagram order. `≫` is "then". |
| *Why does `inferInstance` prove 4.7?* | `Mono` is a class. Mathlib registers "a composition of monos is mono" as an instance, and Lean finds it by itself. |
| *Why is 3.3 stated as 3 · 2 = 1 and not 3⁻¹ = 2?* | `decide` cannot compute the inverse in `ZMod 5` directly. The two say the same thing in a field. |
| *Does Mathlib have more than this?* | Much more in each area: the documentation has an overview page per area. These exercises are the entry point. |
| *The AI's statement differs from yours.* | Good: read both aloud. If they say the same thing, either is fine. If not, which one says what the paper says? |

## If something goes wrong

- **`exact?` is slow or times out.** Say what it is doing (searching Mathlib by the statement),
  then paste the name from `Solutions4.lean`.
- **The AI gives a wrong statement.** Good material: read it aloud, and ask the room what is wrong.
- **No network.** Skip the AI step; give the statement from `Solutions4.lean` and continue.
- **A question you cannot answer.** "Good question. I don't know; I'll check and post the answer
  in the course repository." Write it down.
