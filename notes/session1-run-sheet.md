# Session 1 run sheet — Tuesday 10 November, 15:00–17:00

## Before you leave home

- Slides as a PDF on the laptop *and* on a USB stick (not only on Overleaf).
- `Demo1.lean` inside a Mathlib project, opened once at home so everything is built.
- Laptop charger, and an HDMI / USB-C adapter.

## In the room (from 14:30, with Marc and the technicians)

- Open the slides PDF in full-screen mode, and check that the projector shows it.
- Open `Demo1.lean` in VS Code, about 10 minutes before the start, so that Mathlib is loaded by 15:00.
- VS Code: zoom in (Cmd + three or four times), infoview open on the right.
- Do Not Disturb on. Quit Slack, mail, messages.
- Ask the technician what the recording captures: your screen, the camera, or both. Check that switching from the slides to VS Code is captured.
- Water on the desk.

## Timing

Two hours, in person and online. No laptops in class: you demonstrate, and they redo it at home.
The "Spot the problem" slides and the Goldbach quiz are the audience's part: ask for a show of hands
before you reveal the answer (online participants can answer in the chat).

| Time | Part | Slides |
|---|---|---|
| 15:00 | Opening | title → "The game", including "What formalizing means" and "… does not mean" |
| 15:12 | What Lean is | "A proof assistant" → "Getting started" |
| 15:20 | First steps | "First contact" (**Demo 1**) → "From paper to Lean" |
| 15:30 | Tactic proofs | "Reading the infoview" → "What Lean actually checks", with **Demo 2** |
| 15:45 | Break | 5 minutes |
| 15:50 | Finding things in Mathlib | "Ask Lean" → "The library also has big theorems", with **Demo 3** |
| 16:05 | Reading a Lean statement | "Three kinds of brackets" → checklist; hands up at each "Spot the problem" |
| 16:40 | At home, next time, resources | "At home" → "Resources" |
| 16:45 | Questions | |

The slides after "Resources" (tactic tables, "Propositions are types") are reference for the exercises at home. Do not present them; show one only if a question needs it.

**Running late?** Shorten "Junk values in analysis" and "Coercions", and skip one of the four "Spot the problem" slides. Never skip "What formalizing does not mean", "The one idea of today" or the checklist.

## The first two minutes

Draft wording; change it to your own. Say it out loud a few times before Tuesday.

> Good afternoon, and welcome. I'm Michail Karatarakis. *[One sentence about yourself.]*
>
> This course is about one question: how do you formalize a theorem from your own area, using AI tools? There are four sessions. Today is about Lean itself; the next three build on it. You do not need a laptop here: I will show everything live, and you redo it at home, with the exercises.
>
> *(Slides: What formalizing means / does not mean)* First, what formalizing is, and what it is not. *[Read the slides in your own words.]*
>
> *(Slide: Why now)* Why now? In the last twelve months, AI has written a large part of several major formalizations: Fermat's Last Theorem, sphere packing, the unit distance problem.
>
> *(Slide: The one idea of today)* If you remember one thing from today, let it be this: Lean checks the proof. You check the statement.

After that the slides carry you. If you lose the thread, read the sentence in the blue box on the current slide, and go on from there.

## The live demos

All three are in `Demo1.lean`, commented out. Select a block and press Cmd+/ to uncomment it. If anything is slow or strange, say "here is what it shows" and go to the fallback slide. Nothing is lost.

| | When | What to do | Fallback slide |
|---|---|---|---|
| 1 | After "Getting started" | Uncomment Demo 1. Click on each line and point at the infoview. | "First contact" |
| 2 | At "A proof, step by step" | Uncomment the statement with `sorry`; show the goal. Replace `sorry` by the five tactics, one line at a time; show the goal after each. | the same slide: click through it |
| 3 | At "When the search fails" | Uncomment the first block: `exact?` fails. Then the second: it suggests `exact Real.sq_sqrt hx`. While it searches, say what it is doing. | "When the search fails" |

## If something goes wrong

- **Lean is slow or stuck.** "It's still thinking. Here is what it shows," and go to the fallback slide.
- **You make a mistake.** "Let me correct that," and correct it. That is all.
- **A question you cannot answer.** "Good question. I don't know; I'll check and come back to it on Thursday." Write it down.
- **Someone asks how to install Lean.** The setup sheet. For sessions 1 and 2 the browser (live.lean-lang.org) is enough.
