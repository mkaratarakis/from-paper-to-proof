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
| 15:05 | One theorem, start to finish | "The statement" → "The audit"; `Session4.lean` for the two live slides |
| 15:25 | Graph theory | slides "Four areas, the same steps" and "Graph theory"; `Exercises4.lean`, section 1 |
| 15:40 | Analysis | slide "Analysis"; section 2 |
| 15:55 | Break | 5 minutes |
| 16:00 | Commutative algebra | slides "Commutative algebra" and "When the search finds nothing"; section 3 |
| 16:15 | Category theory | slide "Category theory"; section 4 |
| 16:30 | At home | "Your own theorem" → "When you are stuck" |
| 16:40 | After the course | "Where to go next" → "The one idea of the course" |
| 16:45 | Questions | |

**Running late?** In each area, drop the tactic exercise and keep the `exact?` ones and the AI
one. Never skip exercise 3.8: it is the one where the search fails and the room has to think.

**Time left over?** Ask the room for a statement in one of the four areas, and try it with the
same steps.

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
| Commutative algebra | `CommRing`, `Ideal`, `Ideal.span`, `IsPrime`, `IsMaximal`, `ZMod` | 3.5 ideals of a field | 3.2 6 ∈ (2), 3 ∉ (2): `Ideal.mem_span_singleton`, `decide` | 3.8 nilpotents |
| Category theory | `Category`, `Iso`, `Functor`, `Mono` | 4.6 monos in sets | 4.2 identities and isos: `simp` | 4.8 functors and isos |

`exact?` finds 1.4, 2.1, 2.6, 3.5, 4.6 and the AI exercises 1.8 and 4.8 in a few seconds each.

**Exercise 3.8, the one to slow down on.** `exact?` fails on "the sum of two nilpotent elements is
nilpotent". Ask the room why. Answer: Mathlib states the lemma for any ring, where it needs
x and y to commute; in a commutative ring, `Commute.all x y` gives that. The proof is
`Commute.isNilpotent_add (Commute.all x y) hx hy`. The point: a search fails when your statement
and Mathlib's differ, even if they are the same mathematics.

## Questions you may get

| Question | Answer |
|---|---|
| *What is a filter?* | Not needed today: read `Tendsto u atTop (𝓝 a)` as "u n → a". |
| *Why `[DecidableRel G.Adj]`?* | To compute a degree, Lean must be able to decide adjacency. For counting, the vertex type must be finite: `[Fintype V]`. |
| *Why `f ≫ g` and not `g ∘ f`?* | Mathlib writes composition in diagram order. `≫` is "then". |
| *Why does `inferInstance` prove 4.7?* | `Mono` is a class. Mathlib registers "a composition of monos is mono" as an instance, and Lean finds it by itself. |
| *Why is 3.6 stated as 3 · 2 = 1 and not 3⁻¹ = 2?* | `decide` cannot compute the inverse in `ZMod 5` directly. The two say the same thing in a field. |
| *Does Mathlib have more than this?* | Much more in each area: the documentation has an overview page per area. These exercises are the entry point. |
| *The AI's statement differs from yours.* | Good: read both aloud. If they say the same thing, either is fine. If not, which one says what the paper says? |

## If something goes wrong

- **`exact?` is slow or times out.** Say what it is doing (searching Mathlib by the statement),
  then paste the name from `Solutions4.lean`.
- **The AI gives a wrong statement.** Good material: read it aloud, and ask the room what is wrong.
- **No network.** Skip the AI step; give the statement from `Solutions4.lean` and continue.
- **A question you cannot answer.** "Good question. I don't know; I'll check and post the answer
  in the course repository." Write it down.
