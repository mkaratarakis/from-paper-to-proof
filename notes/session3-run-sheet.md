# Session 3 run sheet — Tuesday 17 November

Written for the slides `slides/BGSMath-Lean-session3-draft.pdf` (38 slides).
Clock times assume the same slot as before, 15:00–17:00. If the slot differs, shift them.

## The one rule

**On every slide, read the blue box aloud.** It is the sentence the slide is there for.
Then say what is on the slide in your own words, and go on.

On a slide with a white "hands up" tag, ask the room first, wait, then click: the answer appears.
A yellow "recorded run" tag means: what is quoted on this slide really happened, on 15 November.

## Before you leave home

- Run the agent demo once at home, start to finish (see "The live demos" below), so that you
  have seen it work on your laptop and your account is logged in.
- Then put the file back: `git checkout BGSMath/AgentDemo.lean`.

## In the room

- Slides PDF in full-screen mode; check that the projector shows it.
- `BGSMath/Demo3.lean` and `BGSMath/AgentDemo.lean` open in VS Code about 10 minutes before the
  start, so that Mathlib is loaded. The agent panel (Claude Code) open and logged in.
- VS Code zoomed in, infoview open on the right. Do Not Disturb on.
- Check the network. The agent needs it. If there is none, skip Demo 2: the slides show a recorded run.

## Timing

| Time | Part | Slides |
|---|---|---|
| 15:00 | Opening | title → "Four words for today" |
| 15:08 | What happened this year | "Fermat's Last Theorem" → "What these have in common", with **Demo 1** |
| 15:30 | The tools | "The tools, November 2026" → "Rules for the agent" |
| 15:45 | A run, start to finish | "A run (1)" (**Demo 2**) → "Eight statements, one agent", with **Demo 3** |
| 16:00 | Break | 5 minutes |
| 16:05 | A false statement; two platforms | "A false statement" → "Tau Ceti" |
| 16:17 | Checking what comes back | "Lean accepted it. Now what?" → "Checking an AI's proof", with **Demo 4** |
| 16:42 | At home, next time | "At home" → "Sources" |
| 16:47 | Questions | |

**Time left over?** Open `BGSMath/Exercises3.lean` on the projector and do audit 2.3 with the room:
the paper says "for every real x", the Lean line says `ℕ`. It is "Spot the problem (4)" again.

**Running late?** Skip "Setting it up for Lean", "Prove2Me", "Tau Ceti" and "Spot the problem (3)".
Never skip "What 'conditional' means", "Rules for the agent", "A false statement" (both slides),
"Seven things Lean accepted" or "Checking an AI's proof".

## The first two minutes

Draft wording; change it to your own.

> Welcome back. On Thursday you wrote statements and tried to break them. Today somebody else
> writes the proof: an AI.
>
> *(Slide: Last time, and today)* Thursday's sentence was: before anyone proves a statement, try to
> break it. Today's is: the AI writes the proof, and you check what it proved. Not whether the proof
> is right: Lean does that. What it is a proof *of*.
>
> *(Slide: Four words for today)* Four words I will use all afternoon. The one to remember is
> *agent*: a model that can run Lean and read the answer.

## Slide by slide

| Slide | What is on it | A question you may get |
|---|---|---|
| Four words for today | Model, agent, formalization, kernel. | *Is ChatGPT an agent?* The chat window is a model. With tools and a loop, the same model becomes an agent. |
| Fermat's Last Theorem | Claude, 11 days, 13 million lines. Read the box "How the result was checked". | *Which Claude?* An internal research model, the post says, "roughly comparable" to a released one. *Is it useful?* The Xena post of 16 October says the code "probably has little ongoing value"; Buzzard continues his own project. |
| The statement behind the headline (**Demo 1**) | Mathlib's statement of FLT: three lines. | *What is the comparator?* A program, now `lake comparator` in Lean. You give it your file with the statement and their file with the proof. It checks: same statement, no extra axioms, accepted by the kernel. |
| The unit distance conjecture | Three dates. The middle one is conditional on two assumed theorems. | *What were the errors Buzzard found?* I do not know: no public source says. Only that they were in the assumed statements and were fixed. *Three weeks or a month?* Alexeev says "approximately one month"; Buzzard's blog says three weeks. |
| What "conditional" means | Hands up: is 2 + 2 = 5? The assumed statement lost its "n > 0". | *Is this what happened to them?* No. It is my toy example of the same kind of mistake. |
| Gauss | Two results and one criticism. Say "read both". | *Who wrote the criticism?* Avigad, Buzzard, Commelin, Degenne, Morrison, Nash and Topaz. |
| What these have in common | People: statements. AI: proof. Lean: check. | |
| The tools, November 2026 | Read the last column. | *Why not Aristotle?* Since 27 October it verifies C and Verilog only. Its FAQ says Lean support "will return in the coming months". |
| A coding agent | The loop: write, run Lean, read, repeat. | *Why does it work for proofs?* Every attempt gets an exact answer from Lean. |
| Setting it up for Lean | Three steps; the third is optional. | *What is MCP?* A standard way to give an agent a new tool. |
| Pin the statement | `def Statement`, then `theorem main : Statement`. | *Can the agent not just edit the def?* It can. The rule says it may not, and the file history shows whether it did. |
| Rules for the agent | Five rules, each with its reason. | *Does it obey?* Usually. That is why you check afterwards. |
| A run (1): my part (**Demo 2**) | The statement and what I type. Start the agent, then go on. | |
| A run (2): the agent's plan | Its plan is the board proof. It searched Mathlib first. | |
| A run (3): the agent's proof | Four tactics, one line of meaning each. First attempt. | *What is `nlinarith`?* Arithmetic with products. The hint tells it which square to use. |
| A run (4) (**Demo 3**) | I removed the hint. Lean's error says what is still to prove. | *Did the agent make this error?* No. I made it, to show you an error. |
| Eight statements, one agent | Seven first attempts, one refusal. Read the blue box. | *So proving is solved?* For textbook statements of a few lines. Not for yours: that is exercise 3. |
| A false statement: what should the agent do? | Hands up: A, B or C? | *Why not B?* B changes my statement. Maybe I wanted exactly this one, to see that it fails. |
| A false statement: what the agent did | It stopped, and proved the statement false. | |
| Without rule 5: spot the problem | Hands up. A proof of another statement. Say: this one I wrote myself. | |
| Prove2Me | One real mission. People check statements; agents prove. | *Can I join?* Yes, it is free. You bring your own agent. |
| Tau Ceti | One real target statement. People write roadmaps. | *Is the target proved?* On 9 November the main theorem of that roadmap was not yet proved. |
| Lean accepted it. Now what? | Seven things, in two groups. | |
| Spot the problem (1)–(3) | Hands up each time. Axiom, `sorry`, `native_decide`. | *Is `native_decide` wrong?* Not wrong: unchecked. The kernel did not see the computation. |
| What a clean proof looks like | The three standard axioms. | *What are they?* The three axioms all of Mathlib rests on. You do not need to know more today. |
| Spot the problem (4) | Hands up. `ℕ` where the paper says integer. | |
| Spot the problem (5) | Hands up. The claim is a hypothesis; Lean warns. | |
| Spot the problem (6) | Hands up. No function is increasing and periodic. No warning. | *How would I notice?* Try to give one f. You cannot. |
| Spot the problem (7) | Hands up. One prime in place of infinitely many. | |
| Seven things Lean accepted | One command for three, the paper for four. | |
| Checking an AI's proof (**Demo 4**) | Five checks, and how to do each. | *What is the file history?* What git records: every change to a file, and who made it. |

## The live demos

Demos 1, 3 and 4 are in `BGSMath/Demo3.lean`, commented out. Select a block and press Cmd+/.
The slide each demo belongs to shows the same code, so if Lean is slow, stay on the slide.

| | At the slide | What to do |
|---|---|---|
| 1 | "The statement behind the headline" | Uncomment `#print FermatLastTheorem`. |
| 2 | "A run (1): my part" | Open `BGSMath/AgentDemo.lean`. Paste the text from the top of that file into the agent panel. Go on with the slides while it works; come back at "Eight statements". |
| 3 | "A run (4)" | Uncomment the block: Lean reports an error at `linarith`. Read it. Replace `linarith` by `nlinarith [sq_nonneg (x - 1)]`. |
| 4 | "Checking an AI's proof" | Uncomment the three blocks, one at a time. Read what `#print axioms` prints each time. |

**Demo 2, in detail.** The agent asks permission before it edits the file or runs a command: say yes.
It should write a plan, then a proof, then run Lean. When you come back to it, show three things:
the statement above the dashes is untouched; there is no `sorry`; `#print axioms main` shows
the three standard axioms. If it is slow, stuck, or does something odd, say "this is why the
slides show a recorded run", and go on. After the lecture: `git checkout BGSMath/AgentDemo.lean`.

## If something goes wrong

- **No network, or the agent does not start.** Skip Demo 2. Slides "A run (2)" and "A run (3)" are the same run, recorded.
- **The agent's proof differs from the slide.** Good: say so. Any proof Lean accepts, of the same statement, with the standard axioms, is fine.
- **Lean is slow or stuck.** "It's still thinking. Here is what it shows," and go back to the slide.
- **A question you cannot answer.** "Good question. I don't know; I'll check and come back to it on Thursday." Write it down.
