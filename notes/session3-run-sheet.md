# Session 3 run sheet — Tuesday 17 November

Written for the slides `slides/BGSMath-Lean-session3-draft.pdf` (49 slides).
Clock times assume the same slot as before, 15:00–17:00. If the slot differs, shift them.

## The one rule

**On every slide, read the blue box aloud.** It is the sentence the slide is there for.
Then say what is on the slide in your own words, and go on.

On a slide with a white "hands up" tag, ask the room first, wait, then click: the answer appears.
A yellow "recorded run" tag means: what is quoted on this slide really happened, on 15 November.

## Before you leave home

- Nothing runs live this time. Every piece of Lean on the slides is code that already ran, on
  15 November. Read the run logs in `notes/session3-agent-run/` once, so that you can answer
  questions about what the agent actually did.

## In the room

- Slides PDF in full-screen mode; check that the projector shows it.
- Nothing else is needed. If you want a file open in case of a question, `BGSMath/Demo3.lean`
  has the code from the slides, and `BGSMath/AgentDemo.lean` the statement the agent was given.

## Timing

| Time | Part | Slides |
|---|---|---|
| 15:00 | Opening | title → "Four words for today" |
| 15:05 | What happened this year | "AlphaProof" → "What these have in common" |
| 15:33 | The tools | "The tools, November 2026" → "Rules for the agent" |
| 15:45 | A run, start to finish | "A run (1)" → "Eight statements, one agent" |
| 15:56 | Break | 5 minutes |
| 16:01 | A false statement; the platforms | "A false statement" → "Formal Conjectures" |
| 16:20 | Checking what comes back | "Lean accepted it. Now what?" → "Palomar" |
| 16:48 | At home, next time | "At home" → "Sources" |
| 16:52 | Questions | |

The deck is long for two hours. If you run late, the first places to go faster are the five
platform slides ("Prove2Me" to "Formal Conjectures") and "Spot the problem" (4)–(7).

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
| AlphaProof | Google DeepMind's prover; silver-medal level at IMO 2024, with AlphaGeometry 2. The problems were translated into formal language by hand. | *Where can I read about it?* Google DeepMind's blog post of 25 July 2024. |
| Seed-Prover | ByteDance Seed's prover; geometry goes to Seed-Geometry. Proofs public. | *Where are the proofs?* On GitHub, ByteDance-Seed/Seed-Prover. |
| AxiomProver | Axiom Math's multi-agent prover; Putnam 2025 proofs public, with a command that checks them. | |
| Fermat's Last Theorem | Claude, 11 days, 13 million lines. Read the box "How the result was checked". | |
| The statement behind the headline | Mathlib's statement of FLT: three lines. | *What is the comparator?* A program, now `lake comparator` in Lean. You give it your file with the statement and their file with the proof. It checks: same statement, no extra axioms, accepted by the kernel. |
| The unit distance conjecture | One formalization, conditional on two textbook theorems that Mathlib does not have yet. | |
| What "conditional" means | Hands up: is 2 + 2 = 5? The assumed statement lost its "n > 0". | *Is this from a real project?* No. It is my toy example. |
| Gauss | Two results from Math Inc's agent. | |
| OpenAI: a public repository | Manuscripts from an internal model on open problems; many with Lean proofs. | *Can I check a result?* Where there is a Lean proof, yes, with the comparator. |
| The same question, outside mathematics | One theorem: zlib proved correct in Lean. | *Is this the same thing as the mathematics?* Yes, with another word: the statement is called a specification, and somebody still has to write it. |
| What these have in common | People: statements. AI: proof. Lean: check. | |
| The tools, November 2026 | Read the last column. | *What is Open Math OS?* SAIR's platform: free accounts being granted to academic requesters, Lean and Mathlib on a machine per project. |
| A coding agent | The loop: write, run Lean, read, repeat. | *Why does it work for proofs?* Every attempt gets an exact answer from Lean. |
| Setting it up for Lean | Three steps; the third is optional. | *What is MCP?* A standard way to give an agent a new tool. |
| Pin the statement | `def Statement`, then `theorem main : Statement`. | *Can the agent not just edit the def?* It can. The rule says it may not, and the file history shows whether it did. |
| Rules for the agent | Five rules, each with its reason. | *Does it obey?* Usually. That is why you check afterwards. |
| A run (1): my part | The statement, and what I typed when the run was recorded. | *Why not run it here?* It takes minutes and a network. The next two slides are that run. |
| A run (2): the agent's plan | Its plan is the board proof. It searched Mathlib first. | |
| A run (3): the agent's proof | Four tactics, one line of meaning each. First attempt. | *What is `nlinarith`?* Arithmetic with products. The hint tells it which square to use. |
| A run (4) | I removed the hint. Lean's error says what is still to prove. | *Did the agent make this error?* No. I made it, to show you an error. |
| Eight statements, one agent | Seven first attempts, one refusal. Read the blue box. | *So proving is solved?* For textbook statements of a few lines. Not for yours: that is exercise 3. |
| A false statement: what should the agent do? | Hands up: A, B or C? | *Why not B?* B changes my statement. Maybe I wanted exactly this one, to see that it fails. |
| A false statement: what the agent did | It stopped, and proved the statement false. | |
| Without rule 5: spot the problem | Hands up. A proof of another statement. Say: this one I wrote myself. | |
| Prove2Me | One real mission. People check statements; agents prove. | *Can I join?* Yes, it is free. You bring your own agent. |
| Tau Ceti | One real target statement. People write roadmaps. | |
| Open Math OS | A place to work: free accounts being granted to academic requesters; Lean and Mathlib on a machine per project. | *Can I sign up alone?* No: accounts are per team. |
| Aristotle: Harmonic's prover | Olympiad proofs in 2025; today it works on Rust, Verilog and C. | *Can I use it?* "Pay for what you use"; see harmonic.fun/aristotle. |
| Leanstral | Open weights, Apache 2.0, free API. | *Can I run it on a laptop?* No: 119 billion parameters. Use the free API. |
| Formal Conjectures | Open problems with the statement in Lean and no proof. | *Can I contribute?* Yes: add a conjecture, or help review a statement. |
| Lean accepted it. Now what? | Seven things, in two groups. | |
| Spot the problem (1)–(3) | Hands up each time. Axiom, `sorry`, `native_decide`. | *Is `native_decide` wrong?* Not wrong: unchecked. The kernel did not see the computation. |
| What a clean proof looks like | The three standard axioms. | *What are they?* The three axioms all of Mathlib rests on. You do not need to know more today. |
| Spot the problem (4) | Hands up. `ℕ` where the paper says integer. | |
| Spot the problem (5) | Hands up. The claim is a hypothesis; Lean warns. | |
| Spot the problem (6) | Hands up. No function is increasing and periodic. No warning. | *How would I notice?* Try to give one f. You cannot. |
| Spot the problem (7) | Hands up. One prime in place of infinitely many. | |
| Seven things Lean accepted | One command for three, the paper for four. | |
| Checking an AI's proof | Five checks, and how to do each. | *What is the file history?* What git records: every change to a file, and who made it. |
| Palomar | A registry: the comparator, a second kernel, and its own note that readers still check the statement. | *Can I submit?* Yes, if you are an author or maintainer of the formalization. Human or AI written, both are welcome. |
| The comparator: steps 1 to 3, as a program | Left: what it checks. Right: what it cannot. The machine does steps 1 to 3; step 5 stays yours. | *Can I use it?* Yes: `lake comparator`, in Lean since 4.35. You give it a small JSON file naming your statement file, their proof file, the theorems to check and the axioms you allow. *So I can stop reading statements?* No: it trusts the statement file you give it. |

## The Lean on the slides

Nothing is typed live. The code on the slides is in `BGSMath/Demo3.lean`, commented out, and the
agent run is in `notes/session3-agent-run/`, log by log. Both are there for you to read before the
lecture, and for anyone who asks afterwards.

| At the slide | What it shows, and where it came from |
|---|---|
| "The statement behind the headline" | Mathlib's `FermatLastTheorem`, printed from `Demo3.lean`. |
| "A run (1)" to "A run (3)" | One run of 15 November, quoted from `notes/session3-agent-run/run1`. |
| "A run (4)" | The same run with the hint removed, so Lean reports an error at `linarith`. |
| "Checking an AI's proof" | Three `#print axioms` outputs, from `Demo3.lean`. |

## If something goes wrong

- **Somebody asks to see it run.** Say it takes minutes and a network, and that the run on the
  slides is a real one, logged in the repository. Offer to show the logs afterwards.
- **Somebody says their agent gives a different proof.** Good: say so. Any proof Lean accepts, of
  the same statement, with the standard axioms, is fine.
- **A question you cannot answer.** "Good question. I don't know; I'll check and come back to it on Thursday." Write it down.
