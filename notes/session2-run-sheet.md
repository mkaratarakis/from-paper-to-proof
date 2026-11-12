# Session 2 run sheet — Thursday 12 November

Written for the slides `slides/BGSMath-Lean-session2-draft.pdf` (29 slides).
Clock times assume the same slot as session 1, 15:00–17:00. If the slot differs, shift them.

## The one rule

**On every slide, read the blue box aloud.** It is the sentence the slide is there for.
Then say what is on the slide in your own words, and go on.

On a slide with a white "hands up" tag, ask the room first, wait, then click: the answer appears.

## In the room

- Slides PDF in full-screen mode; check that the projector shows it.
- `BGSMath/Demo2.lean` open in VS Code about 10 minutes before the start, so that Mathlib is loaded.
- VS Code zoomed in, infoview open on the right. Do Not Disturb on.

## Timing

| Time | Part | Slides |
|---|---|---|
| 15:00 | Opening | title → "Last time, and today", with the warm-up quiz |
| 15:10 | Writing definitions | "A definition, from paper" → "Use Mathlib's definition", with **Demo 1** |
| 15:30 | Writing statements, first half | "A statement has three parts" (**Demo 2**), "Your turn", "Warm-up A" |
| 15:50 | Break | 5 minutes |
| 15:55 | Writing statements, second half | "Warm-up B" (**Demo 3**) → "Warm-up C: the fix" (**Demo 4**) |
| 16:10 | Checking a statement | "Is this theorem true?", "The four tests" |
| 16:20 | Drafting statements with AI | "What an AI can do here" → "The workflow" |
| 16:35 | Three for fun | "For fun (1)" → "For fun (3)" |
| 16:40 | Recap, at home, next time | "Today's six bugs" → "Resources" |
| 16:45 | Questions | |

**Time left over?** Open `BGSMath/Exercises2.lean` on the projector and do exercise 2.1 with the room:
"the sum of two odd integers is even". Ask for the objects, the assumptions, the claim.
The answer has the shape of the "Your turn" slide, with `ℤ`, `Odd` and `Even`; it is in `Solutions2.lean`.

**Running late?** Skip "Use Mathlib's definition", "A prompt that helps" and the three "For fun" slides.
Never skip the warm-up, "The four tests" or "Today's six bugs".

## The first two minutes

Draft wording; change it to your own.

> Welcome back. On Tuesday we read Lean statements that someone else wrote. Today you write your own.
>
> *(Slide: Warm-up)* Before anything else, a quiz. Three sentences from a paper, and next to each a Lean
> statement of it. Lean accepts all three. Hands up: who thinks A says what the paper says? B? C?
> *[Count the hands, then click.]* None of them. All three are false, and Lean did not complain.
>
> *(Slide: Last time, and today)* Tuesday's sentence was: Lean checks the proof, you check the statement.
> Today's is: before anyone proves a statement, try to break it. By the end you will have caught A, B and C.

## Slide by slide

| Slide | What is on it | A question you may get |
|---|---|---|
| Warm-up | Three false statements. Do not explain them yet: "We come back to each one." | *Why does Lean accept a false statement?* It only checks that the statement makes sense. `sorry` stands for the missing proof. |
| A definition, from paper | "n is even if n = 2k for some k", and the same in Lean, piece by piece. | *Why `Prop`?* `IsEven n` is a statement about `n`: it may be true or false. |
| Test your definition (**Demo 1**) | 4 is even, 3 is not. | *What is `⟨2, rfl⟩`?* The number k = 2, and the check that 4 = 2 · 2. |
| Spot the problem (1) | Hands up. The definition of prime forgets n > 1, so 1 is prime. | *What does Mathlib do?* `Nat.Prime`; there 1 is not prime. |
| Use Mathlib's definition | Mathlib has `Even` and `Nat.Prime`. Our `IsEven` says the same as `Even`. | |
| A statement has three parts (**Demo 2**) | "The sum of two even numbers is even." Objects, assumptions, claim: one line each. | *What is `hm`?* A name for the assumption "m is even". |
| Your turn | The room writes "the product of two odd numbers is odd". Two minutes, then click. | |
| Warm-up A | Hands up. No type written, so x is a natural number, and there 0 − 1 = 0. | *Why ℕ?* A numeral with nothing else to fix its type is a natural number. |
| Warm-up B (**Demo 3**) | Hands up. a = 1, b = 0: in Lean 1/0 = 0, so the left side is 0. The fix: add b ≠ 0. | *Why is 1/0 = 0?* Division must return something. Lean picks 0; theorems then need b ≠ 0. |
| Warm-up C: small cases (**Demo 4**) | `#eval` shows the two sides differ. Click: the picture, 6 against 10. | |
| Warm-up C: the fix | `range n` is 0, …, n − 1. Use `range (n + 1)`. | *Is there a set {1, …, n}?* Yes, `Finset.Icc 1 n`. |
| Is this theorem true? | Hands up. Yes, and it says nothing: no n is below 3 and above 5. | |
| The four tests | Read the first column. The last column is where they saw each one today. | |
| What an AI can do here | Good for names and drafts. You answer for what the statement says. | *Which AI?* Any current chat model. The checking is the same. |
| A prompt that helps | Read the prompt. It asks the AI to run tests 1 and 3 itself. | |
| Spot the problem (2) | Hands up. The claim is also an assumption (`h2`), and Lean warns that `h` is unused. | *Does Lean always warn?* Only about an assumption the proof never uses. |
| Spot the problem (3) | Hands up. The paper says a ≤ b, the draft says a < b. No warning. | *But it is still true?* Yes, and weaker: a = b is not covered. |
| The fix | The right statement, used on a = b = 3. | |
| The workflow | Paper, AI draft, you check, then the proof. | |
| For fun (1) | Hands up: what does the line say? Then: it says "if n > 5 then n = 3", and n = 0 does the job. | *What should it be?* `∧` in place of `→`; that statement is false. |
| For fun (2) | Hands up: why 1? Then: natural-number division, so 1/2, 1/3, … are all 0. | *And with the type?* With `(1 : ℚ)` the first four terms give 25/12. |
| For fun (3) | Hands up: has Lean refuted Cantor? Then: `Nat.card` of an infinite set is 0, so the line says 0 = 0. | *How do I say it properly?* With cardinals, `Cardinal.mk`; there ℕ is smaller than ℝ. The proof is in `Session2.lean`. |
| Today's six bugs | Four said something false. Two were true and still wrong. | |

## The live demos

All four are in `BGSMath/Demo2.lean`, commented out. Select a block and press Cmd+/ to uncomment it.
The slide each demo belongs to shows the same code, so if Lean is slow, stay on the slide.

| | At the slide | What to do |
|---|---|---|
| 1 | "Test your definition" | Uncomment the definition, then the two tests. |
| 2 | "A statement has three parts" | Uncomment the statement. Point at the three parts. Replace `sorry` by `hm.add hn`. |
| 3 | "Warm-up B" | Uncomment the `#eval`: Lean answers 0. |
| 4 | "Warm-up C: test on small cases" | Uncomment the `#eval`: the sides differ. Change `range n` to `range (n + 1)`: they agree. |

## If something goes wrong

- **Lean is slow or stuck.** "It's still thinking. Here is what it shows," and go back to the slide.
- **You make a mistake.** "Let me correct that," and correct it.
- **A question you cannot answer.** "Good question. I don't know; I'll check and come back to it on Tuesday." Write it down.
