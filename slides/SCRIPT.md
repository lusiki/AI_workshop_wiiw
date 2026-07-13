# Delivery script — the full hour

*"AI in Economics Research: From Frontier Ideas to a Working Agentic Pipeline"* · a seminar for wiiw.

This is the **spoken script** for the whole talk — what to **do**, what to **show**, and what to
**say**, slide by slide. It is the companion to two other documents:

- [`slides/slides.qmd`](slides.qmd) — the deck itself (the words on screen).
- [`demo/RUNBOOK.md`](../demo/RUNBOOK.md) — the authority for the live demo, minutes 30–44. Where
  this script and the run-book touch the demo, **the run-book wins**; here the demo is compressed to
  keep the whole hour in one document.

**One device carries the hour.** The AI is a brilliant intern. Free, tireless, fast, and
occasionally confidently wrong. The hook shows the intern already works here. Lens A is his job
description. Lens B is the rulebook you enforce before his work touches your numbers. Lens C asks
what happens to the economy when every firm hires a million of him. The pipeline in part two is how
you manage him, and the demo is you catching him. If you ever lose your place, go back to the intern.

**Register.** The room is research economists — causal-inference literate, professionally skeptical,
allergic to hype. Nothing here is oversold. The through-line is one sentence: *the intern generates,
you guarantee — the binding constraint is your verification, not his generation.* Say it early, land
it at the demo, close on it.

**The `SAY` lines are sayable, not read-aloud-verbatim.** Deliver them in your own cadence; the deck
holds the citations so your eyes can stay on the room. Bold inside a `SAY` line marks the one beat
per slide to lean on.

---

## Pre-flight (do this before anyone is in the room)

- [ ] Work through the **run-book pre-talk checklist** ([`demo/RUNBOOK.md`](../demo/RUNBOOK.md)) —
      `Rscript setup.R`, warm the data (`analysis/run.R --refresh`), warm `renv`, open one agent
      session, **record a clean run and keep it one keystroke away**, rehearse the catch once.
- [ ] **Re-verify pricing** against claude.com/pricing (deck slide 4 · handout). The numbers were
      correct when the deck was built; confirm them the week of the talk and edit the slide if they moved.
- [ ] Terminal at presentation font, light theme, notifications off. Confirm the active account and `git` identity.
- [ ] **Do not plant the bug yet.** Plant it in the last minute before you start (see minute 29 below),
      so the repo stays clean until the demo.
- [ ] Deck open in presenter view; this script or the one-line cheat sheet taped where you can see it.

**Timing spine (59 min + Q&A).** The demo is the protected block. If you run long, cut *from* Lens C,
the cost-engineering detail, or the reading-list slide — **never the demo, never the close.**

| Section | Ends at | Minutes |
|---|--:|--:|
| Open — "three things" | 02:00 | 2 |
| 0 · Hook | 06:00 | 4 |
| 1 · Three lenses | 17:00 | 11 |
| 2 · Anatomy of the pipeline | 30:00 | 13 |
| **3 · Live demonstration** | **44:00** | **14** |
| 4 · Pricing & infrastructure | 51:00 | 7 |
| 5 · Pitfalls & division of labour | 56:00 | 5 |
| 6 · Close | 59:00 | 3 |
| Q&A | — | to time |

---

# Open · 00:00 – 02:00

### ⏱ 00:00 — Title slide

**SHOW** Title slide (*AI in Economics Research — From Frontier Ideas to a Working Agentic Pipeline*).
**DO** Stand still. Don't touch the clicker for the first two sentences. Let the room settle.

**SAY** — "Thank you. The next hour is narrow and concrete on purpose. This is not a survey of
everything AI might one day do to economics. It is a **working pipeline** you can clone this
afternoon and use to produce a wiiw working-paper section. We go from the frontier literature, to
the machinery, to a live demonstration where the machinery catches a mistake in front of you."

**→ transition** — "Here is exactly what you leave with." *(advance)*

---

### ⏱ 00:30 — "By the end of the hour you leave with three things"

**SHOW** The three deliverables + the "smallest viable practical" note.
**DO** Count them on your fingers — physically. It cues the audience that the talk has three anchors.

**SAY** —
- "One, a **mental map** of the AI-in-economics literature. Three lenses, one flagship paper each, and the field stops being a firehose."
- "Two, a **cloneable repository**. A minimal agentic pipeline that produces a working-paper section. It is not a toy. It pulls live Eurostat data and compiles a branded PDF."
- "Three, a **realistic cost picture**, in euros per month, for running this at an institute like wiiw."

**SAY** *(the design philosophy)* — "One word governs the whole design: **minimal**. Not eighteen
agents and fifty-two skills. The smallest set of components that makes handing research work to an
AI agent both safe and productive. That minimum turns out to be exactly **five pieces**, and I will
name the specific failure each one prevents."

**→ transition** — "First, why this is already your problem, whether or not you opted in." *(advance)*

---

# 0 · Hook · 02:00 – 06:00

### ⏱ 02:00 — Section divider "0 · Hook"

**SHOW** Divider — *The technology is already inside the research production function.*
**DO** Read the divider line, then advance quickly. Dividers are breath, not content.

**SAY** — "The hook is one line. Somewhere in this building, the intern **already works here**. The
only decision left is whether he was hired deliberately or wandered in by accident."

---

### ⏱ 02:20 — "Adoption is happening — the only question is whether it is deliberate"

**SHOW** Two columns: Chatterji et al. (diffusion at scale) · Brynjolfsson, Li & Raymond (QJE field evidence).
**DO** Point to the left column, then the right. Two facts, two gestures.

**SAY** —
- "On the left, the population picture. **Chatterji and coauthors** looked at OpenAI's own usage logs — the first population-scale record of what people actually do with these tools. Roughly seven hundred million people use it weekly, and most messages ask for advice and judgment rather than finished output. The lesson is blunt. Adoption happens with or without an institutional decision, so the only real choice is deliberate versus accidental."
- "On the right, what happens when a real firm hands the intern to its workers. **Brynjolfsson, Li and Raymond**, in the *QJE*: a Fortune 500 support centre rolled out an AI assistant team by team, a clean natural experiment. Productivity rose about fifteen percent on average. But novices gained around thirty percent, and veterans gained almost nothing."

**SAY** *(the turn)* — "Sit with that second result. The tool **raises the floor, not the ceiling** —
which quietly makes experienced judgment the scarce input. **Hold that thought. It returns at the
end of the hour.** For now, the point is simpler: the question was never whether, it is deliberate
versus accidental."

**→ transition** — "So who is this new colleague? Economists already own the right frame for him. We invented it." *(advance)*

---

### ⏱ 04:00 — "A frame economists already own: this is a principal–agent problem"

**SHOW** The principal–agent framing + the catch line.
**DO** This slide is load-bearing. Slow down. Make eye contact on the last sentence.

**SAY** —
- "You have hired a brilliant intern. He is free, tireless, fast, and occasionally, confidently, wrong. **You are the principal. He is the agent.**"
- "And his output has one economic property that decides everything: it is **cheap to produce and costly to verify.** That asymmetry is the whole game."
- "So everything in the second half — the plan gate, the permission fence, the quality score — is not IT plumbing. It is contract design under asymmetric information. It is the set of mechanisms that make an intern like that safe to delegate to."

**SAY** *(the thesis — say it slowly, this is the spine of the hour)* — "Which gives us the sentence
the whole hour hangs on. **The binding constraint is not the machine's generation. It is your
verification.** The intern generates. You guarantee. Everything else follows from that."

**→ transition** — "With that frame, the literature stops being a pile and sorts into three lenses." *(advance)*

---

# 1 · Three lenses · 06:00 – 17:00

### ⏱ 06:00 — Section divider "1 · Three lenses on AI in economics"

**SHOW** Divider — *Tool · Instrument · Object.*
**DO** Introduce the scaffold before the detail — tell them the shape of the next eleven minutes.

**SAY** — "Three lenses, and in the intern's terms they are simple. Lens A is his **job
description** — AI as a tool, what to delegate to him. Lens B is the **rulebook** — AI as an
instrument inside your estimates, what you check before his work touches your numbers. Lens C asks
what happens to the economy when **every firm hires a million of him** — AI as an object of study.
One flagship paper per lens. If you remember nothing else, remember the anchor paper per lens."

---

### ⏱ 06:40 — "Lens A — AI as a *tool*"

**SHOW** Korinek ×2, Dell, Bahoo, Sant'Anna.
**DO** Don't read all five. Land Korinek and Dell; name the rest as a map.

**SAY** —
- "**Korinek, 2023, in the *JEL*,** wrote the job description — the catalogue. He walked an LLM through dozens of real research tasks, brainstorming, editing, coding, math, and graded each by a single criterion: how much human checking the output needs. Tasks needing little checking were already valuable; tasks needing much were not. That one variable, **verification cost**, organizes the whole field — and notice it is the same variable as our contract. That is not a coincidence."
- "**Korinek again, 2025,** reports that the intern grew hands. Chatbots became agents — a model plus tools, memory and iteration, able to run long research tasks alone. His warning is the part that matters: errors compound across steps, so manage an agent like a research assistant. **Plan before, watch during, vet after.** Part two of this talk is that sentence turned into machinery."
- "**Dell, 2025,** shows the intern as archivist. Deep learning reads old newspapers, firm filings and satellite images and turns them into datasets at trivial cost, so sources trapped on paper become research material."

**SAY** *(make it wiiw's)* — "For an institute sitting on historical CESEE statistics, national
gazettes and firm registries, that is the most directly profitable branch — sources that were
economically untouchable become tractable. And Dell's own caveat, that machine-read variables carry
measurement error, **hands the microphone to Lens B.** Two quick map entries before we go there:
**Bahoo and coauthors** took the census — 2,231 articles over 34 years, the official *before*
picture, taken just prior to the agentic turn. And **Sant'Anna, 2026,** wrote the manual — the
practitioner's template we actually deploy in the demo."

**→ transition** — "So Lens A is the upside. Lens B is where careful people get nervous — correctly." *(advance)*

---

### ⏱ 09:20 — "Lens B — AI as an *instrument*, with warnings"

**SHOW** Ludwig, Mullainathan & Rambachan (the highlighted discipline paper) + Athey, Gavrilova, Chen.
**DO** This is the slide that earns the room's trust. Frame it as four rules, one per paper, and give rule one its full weight.

**SAY** *(the frame)* — "Lens B is the rulebook. Four rules, one per paper, and nothing of the
intern's enters the paper before these checks."

**SAY** *(rule one — the discipline paper)* — "Rule one: **spot-check his data entry.** That is
**Ludwig, Mullainathan and Rambachan.** Their result is sharp: an LLM output can enter your pipeline
two valid ways, and only two. As a prediction, which needs an out-of-training-sample argument you
often cannot make, because you don't know what was in training — their models predicted congressional
bills at over ninety percent only because they had memorized the bills. Or as an estimation input,
which needs a **human-labelled validation subsample** to bound the measurement error — and the repair
is small, 125 to 250 human-labelled documents debias the downstream estimate. Any third way, and
measurement error quietly contaminates your estimates."

**SAY** *(rules two to four, fast)* —
- "Rule two: **he answers the question he can, not the question you asked.** That is **Athey and coauthors.** In a real experiment nudging some 65,000 students to renew financial aid, targeting the students predicted worst off captured under a third of the achievable benefit — because who is neediest and who is movable are different people. Whom to treat is a causal question, and only a design answers it."
- "Rule three: **let him hunt, keep the proof yours.** That is **Gavrilova.** A causal forest inside a difference-in-differences design around a Norwegian payroll tax change. The algorithm discovered the interesting pattern — large firms pass the tax to workers, small firms absorb it — and identification came entirely from the design. Flexibility where flexibility is safe, assumptions where credibility lives."
- "Rule four: **when data are thin, hand him the textbook first.** That is **Chen and coauthors.** Pretrain on data simulated from deliberately old option-pricing theory, then tune on real prices. Errors fell to a third of pure deep learning, and the advantage was biggest when the training data was cut to a tenth. Even a wrong theory disciplines a flexible learner in small samples — which is precisely the CESEE panel situation."

**SAY** *(land rule one as the house rule)* — "One of those four is non-negotiable in this room:
**no machine-generated variable enters a regression without a human-labelled validation set.**
Later you will see it encoded as an actual check in the pipeline."

**→ transition** — "Lens A, the job description. Lens B, the rulebook. Lens C zooms out: what if everyone hires a million of him?" *(advance)*

---

### ⏱ 13:00 — "Lens C — AI as an *object* of study"

**SHOW** Acemoglu, Jones, Brynjolfsson–Korinek–Agrawal, Mullainathan.
**DO** Frame it as a debate with a stake, not a reading list. *(This is the slide to compress if you're behind — hold Acemoglu vs Jones, name the other two.)*

**SAY** —
- "**Acemoglu** is the accountant. He forces the headline forecasts through task-level arithmetic — the share of tasks AI can profitably do, times the saving on each — and gets at most about two thirds of one percent of TFP over a decade. Small, defensible, and the floor every bigger claim must argue against."
- "**Jones, 2026,** is the growth theorist replying, and his is the more interesting argument. Tasks are complements, so the economy behaves like a chain capped by its **weakest link.** Automate half of everything infinitely well and output rises only about nineteen percent. Yet automate nearly all of it and growth explodes. So the real debate is not direction, it is **timing and bottlenecks** — and hold onto the weakest-link image, because we will meet the weakest link in research production before the hour ends."
- "**Brynjolfsson, Korinek and Agrawal** write the agenda in case it is big: if AI can hold productivity growth at several times the historical rate, nine challenges follow. Several are wiiw-sized questions in global clothing — convergence under AI, labour reallocation, nearshoring."

**SAY** *(the twist)* — "And **Mullainathan** is the twist: the interns started making decisions
themselves. A descendant of his pretrial algorithm now runs in every New York courtroom, and it
could cut jailing by around forty percent with no rise in crime. Once algorithms decide inside
courts, credit and labour markets, the parameters economists estimate become endogenous to the
algorithms. The profession studying the treatment **sits in the treatment group.**"

**→ transition** — "Three lenses. Let me collapse them into one sentence and get us to the machinery." *(advance)*

---

### ⏱ 15:30 — "The bridge"

**SHOW** The fitted line (Lens A raises productivity) + Lens B / Lens C recap + the catch.
**DO** This is a rhetorical hinge — deliver it as three beats and a promise, then move.

**SAY** — "Put the three together and the story is one sentence. **The intern generates, you
guarantee.** Lens A told you what to delegate. Lens B told you what to check before you sign.
Lens C told you what it means that everyone is signing."

**SAY** *(the promise)* — "So the entire job of part two is to capture the Lens A gains while
enforcing the Lens B rulebook. Get the productivity and keep the numbers honest. That is what the
five components are for. Let's build them."

**→ transition** *(advance into Section 2 divider)*

---

# 2 · Anatomy of the pipeline · 17:00 – 30:00

### ⏱ 17:00 — Section divider "2 · Anatomy of an agentic pipeline"

**SHOW** Divider — *The five components — and the failure each one prevents.*

**SAY** — "Five components — how you actually manage the intern. I will introduce each one with the
specific failure it prevents, because a safeguard you can't name the failure for is a safeguard
you'll delete the first time it's inconvenient."

---

### ⏱ 17:30 — "The operating loop is the entire rhythm"

**SHOW** The loop diagram (`assets/loop-diagram.svg`).
**DO** Trace the loop with your finger or the pointer, once, in order. Land on *you* at both ends.

**SAY** — "This is the rhythm, and it never changes. You describe a task in plain English. The
intern plans. You approve — that is a gate, and we come back to it. He executes under permissions,
verifies his own work, and reports back. You review the diff and say commit. Then the next task."

**SAY** *(the point of the picture)* — "Notice where the human stands: **at both ends.** You own the
intent at the start and the judgment at the end, and the intern owns the tedious middle. This is
Korinek's sentence — plan before, watch during, vet after — drawn as a circle. Not full autonomy,
not doing it all yourself. That division is the entire idea."

**→ transition** — "Five components sit on that loop. The first two come before the intern is allowed to touch anything." *(advance)*

---

### ⏱ 19:30 — "Context & the plan gate" (components 1–2)

**SHOW** Two columns — `CLAUDE.md` (context) · the plan gate.
**DO** If a terminal is handy, you *can* flash the real `CLAUDE.md` here for ten seconds — but the demo does this properly, so don't over-invest.

**SAY** *(component 1)* — "**Component one: context** — the briefing the intern reads every morning.
A file called `CLAUDE.md`, the project's constitution. Short by design, about a hundred and twenty
lines: principles, folder layout, key commands, current state. The detailed rules are path-scoped,
so the R conventions load only when he touches an `.R` file and the house style loads only with the
manuscript. The failure it prevents: **the intern forgetting your decisions** and sliding back to
generic defaults."

**SAY** *(component 2)* — "**Component two: the plan gate.** For anything nontrivial, he plans in
read-only mode first, writes the plan to disk, and waits for your approval before editing a single
file. The plan survives even when the conversation is compacted, and it leaves an audit trail. The
failure it prevents: **solving the wrong problem, fast** — and losing the reasoning behind the
choices. The plan gate is where alignment happens before action, while correction is still cheap."

**→ transition** — "Once you approve, he runs on his own. Two components make that safe." *(advance)*

---

### ⏱ 22:30 — "Permissions & verification" (components 3–4)

**SHOW** Two columns — permission-scoped execution · verification (three mechanisms).
**DO** This slide sets up the demo's two payoffs (the fence, the catch). Plant both phrases now so they pay off later.

**SAY** *(component 3)* — "**Component three: permissions** — the fence. A settings file allowlists
exactly which commands run without asking: `Rscript`, `quarto render`, read-only `git`. It denies
the rest: destructive git, `rm -rf`, and — importantly for an institute — any read under
`data/restricted/`. The failure it prevents: **an autonomous process with unbounded reach** into
your machine and your data. Watch for this in the demo. I will call it the **permission fence.**"

**SAY** *(component 4 — say "honest," it's the emotional core)* — "**Component four: verification.**
This is the Lens B rulebook turned into machinery, and it matters most, so I'll name all three
mechanisms. **Replication-first**: reproduce the known numbers before you extend them. An
**adversarial critic**: the intern does not grade his own homework — a separate read-only critic
tries to break the work, and a separate pass fixes what it finds. And **numeric provenance**: every
number quoted in the paper is anchored to the script that produced it. The failure it prevents:
**confident nonsense reaching the working paper.** This is the component that converts skeptics,
and in about ten minutes you will watch it fire."

**→ transition** — "And the fifth component ties the other four into something you can trust over time." *(advance)*

---

### ⏱ 26:00 — "Memory & git — and how it all binds" (component 5)

**SHOW** Component 5 (memory & git) + the binding catch line.
**DO** This is the summary of the whole section. Deliver the "remove any one" line as the closer, then let it breathe before the demo.

**SAY** *(component 5)* — "**Component five: memory and git.** Corrections accumulate as tagged
one-liners, so the intern makes a mistake **once** and then it is written down. And git is the
safety net: small commits, an advisory quality score — eighty to commit, ninety for a pull request,
ninety-five is genuinely excellent — and worktrees to sandbox risky experiments. The failure it
prevents: **repeating mistakes, and ending up somewhere you can't get back from.**"

**SAY** *(the binding — this is the money line of Part Two; deliver it deliberately)* — "Here is how
the five bind. Context makes the intern **competent.** The plan gate makes him **aligned.**
Permissions make him **contained.** Verification makes him **honest.** Git makes every step
**reversible.** Competent, aligned, contained, honest, reversible. **Remove any one, and a specific,
nameable failure walks back in.** That is why it's five and not fifty — and also why it's five and not three."

**SAY** *(pre-empt the "is that all?")* — "Everything else you have heard of — skills, subagents,
MCP servers — is a refinement of these five. Start with the constitution and two or three skills.
Don't build the cathedral first."

**→ transition** — "Enough architecture. Let me show you the whole loop fire on a real task — and catch the intern in a real mistake." *(advance to Section 3 divider)*

---

# 3 · Live demonstration · 30:00 – 44:00  ·  **PROTECTED BLOCK**

> **This is the demo. The authority is [`demo/RUNBOOK.md`](../demo/RUNBOOK.md) — follow its beat table.**
> What's below is the same beats compressed with the narration written out, so this script stands alone.
> **The 60-second rule governs:** if anything stalls for more than ~60 seconds, **cut to the recording
> without apology and keep narrating.** Do not debug live.

### ⏱ 29:00 — (just before you start) Plant the bug

**DO** *(off the main screen, in the last quiet minute)* Run:
```bash
Rscript demo/plant_bug.R      # injects a hand-typed "13.8 log points" into the Results paragraph
```
Confirm the repo is otherwise clean. Have the **recording one keystroke away.** Terminal at the cloned repo, agent session already warm.

---

### ⏱ 30:00 — Section divider + the artifact & stack

**SHOW** Divider "3 · Live demonstration", then the artifact/stack slide.
**DO** Set the frame *before* the terminal so nobody is reading econometrics while you talk.

**SAY** — "The artifact is a real working-paper section: income convergence in the CESEE EU members
since accession — a small staggered event study around the 2004, 2007 and 2013 waves. I chose it
deliberately. The data are public Eurostat and the econometrics are familiar — Sun and Abraham,
Callaway and Sant'Anna — which means **all your attention is free for the workflow**, not the economics."

**SAY** *(the aside — it usually gets a nod)* — "One pleasant detail: the workflow guide we deploy
and the modern DiD estimator in the `did` package share an author. The tooling and the econometrics
come from the same intellectual household. That is the state of this little field."

**→ transition** — "Let me switch to the terminal." *(switch to terminal)*

---

### ⏱ 31:00 — Show the constitution, then make one request

**SHOW** Terminal in the cloned repo; `CLAUDE.md` open for ~30 seconds; then the agent prompt.
**DO** Open `CLAUDE.md`, scroll once, close it. Then type (or paste) the request and let the agent enter **plan mode**.

**SAY** *(on `CLAUDE.md`)* — "This is the briefing I described — short, readable, and it is
**everything** the intern knows about this project. No hidden state."

**DO** Type the request (from the run-book):
> Extend the convergence sample through 2025, refresh Figure 2, rerun the event study, and update the results paragraph — planning first.

**SAY** — "One request, plain English. And watch: he does **not touch a single file yet.** He plans
first, because the briefing told him to."

---

### ⏱ 33:00 — Read the plan aloud, then approve

**SHOW** The agent's plan (files it will touch, scripts it will run, how it will verify).
**DO** Read two or three plan lines aloud so the audience sees the plan is legible. Then **approve.**

**SAY** — "Here is the plan. It names the files he will touch, the scripts he will run, and — this
is the part to notice — **how he will verify** before he claims to be done. I can read this in ten
seconds and know whether he understood me."

**SAY** *(as you approve — name the moment)* — "I approve. **This keystroke is the moment of
delegation.** From here he runs on his own until he reports back."

---

### ⏱ 35:00 — Execution — narrate the permission fence

**SHOW** Execution: cached Eurostat pull, `targets` recompute, `.qmd` edit, render starting.
**DO** Narrate — don't watch silently. This is your two minutes to explain what's scrolling.

**SAY** — "As he runs, notice what he is allowed to do without asking — `Rscript`, `quarto render`,
read-only `git`. That is the **permission fence** from component three. And notice what he cannot
touch: destructive git, and anything under `data/restricted/`. He is autonomous inside a fence, not
autonomous full stop. And because the sample end genuinely moves from 2023, `targets` recomputes
**only what changed** — the event study, Figure 2, the results numbers. You are watching an
incremental rebuild, not a no-op."

---

### ⏱ 40:00 — **THE CATCH** — verification catches the planted bug

**SHOW** The verification step failing on the provenance check; the offending literal; the fix; the clean re-render.
**DO** **Stop moving. Stop narrating over it.** Let the failure appear on screen for a beat before you speak. This is the slide the whole talk was built to reach.

**SAY** *(after the pause)* — "There. Stop. The results paragraph quotes a number — **13.8 log
points** — that no longer matches the refreshed table. A number that was, at some point, typed by a
human hand. The provenance check **failed the build.** The critic flagged it, a separate pass
repaired it — back to a code-backed reference — and the render now passes clean."

**SAY** *(the line to land — slow, then stop talking)* — "That is exactly the error a tired human on
a deadline ships. The pipeline caught it because it **checks every number against its source, every
time, and never gets tired.** Nothing of the intern's — and nothing of *yours* — enters the paper
before these checks. That is the binding constraint made mechanical. That is the whole hour in one screen."

> **If it stalled:** cut to the recording now, and deliver the two `SAY` lines above over the video. The
> narration is what matters, not whether it's live.

---

### ⏱ 43:00 — Diff, score, commit, hold up the PDF

**SHOW** `git diff` · the advisory quality score · the commit · the compiled PDF page.
**DO** Scroll the diff briefly; commit; **physically hold up / display the compiled PDF page.** End on the artifact.

**SAY** — "And to close the loop: here is the **diff**, small and reviewable. The advisory quality
score clears the bar. I say **commit**, and it becomes a small, reversible step in git history. And
here" — *(hold up the PDF)* — "is the compiled section. Describe, plan, approve, execute in the
fence, verify, commit. Small, reviewable, reversible. That is the entire loop, and you just watched it run."

**DO** *(after the talk — don't forget)* `Rscript demo/reset_demo.R` to restore the clean repo before pushing or re-rehearsing.

**→ transition** — "It works. The next question any institute asks is: what does the intern cost?" *(switch back to deck, advance to Section 4)*

---

# 4 · Pricing & infrastructure · 44:00 – 51:00

### ⏱ 44:00 — Section divider + "Any laptop suffices"

**SHOW** Divider "4 · Pricing & infrastructure", then the local-requirements + pricing table slide.
**DO** Kill the fear first (no special hardware), then the numbers. **Point at the on-slide "verify at claude.com/pricing" note yourself** — it buys you credibility.

**SAY** *(hardware)* — "First, the relief: **any laptop.** A terminal, git, R, Quarto, a LaTeX
distribution, and Node to install the tool. No GPU, no special hardware. The model runs in the
cloud; the analysis runs on the machine in front of you. The repo ships a `setup.R` that checks all of it."

**SAY** *(pricing — and flag the caveat before they can)* — "Two ways to pay, and let me flag the
honesty note on the slide before you do: **verify these at claude.com/pricing.** I re-checked the
week of this talk, but they move. Per million tokens, the cheap tier costs around a dollar in and
five out, the mid tier a few dollars, the high and frontier tiers more. The exact figures matter
less than the **spread**: the cheapest and the frontier model differ by roughly an order of
magnitude. That spread is a lever, not a bill."

**SAY** *(subscriptions — one line)* — "And there is a flat-rate door: subscriptions from twenty
dollars a month. For a steady working-paper habit, that turns a variable bill into a predictable line item."

**→ transition** — "Because of that ten-to-one spread, the single most useful skill is cost engineering." *(advance)*

---

### ⏱ 47:00 — "Cost engineering: route models, cache context, set effort"

**SHOW** Two columns — the 70/20/10 routing pattern · caching + effort.
**DO** This is the practical-takeaway slide. Say the 70/20/10 numbers clearly; people write these down.

**SAY** *(routing)* — "Lever one: **route by task.** A rule of thumb that holds up — call it
**seventy, twenty, ten.** About seventy percent of the work is mechanical, formatting and
first-pass scans; send it to the cheap model. About twenty percent is review and drafting; that is
the mid tier. Only the last ten percent — identification, the high-judgment calls — needs the
frontier model. Route like that and you halve the bill or better versus running everything on the frontier."

**SAY** *(the other two levers, fast)* — "Lever two: **prompt caching.** Most of an agentic session
is the same context sent again and again; cache it, and repeated context costs almost nothing.
Lever three: **effort per task.** You don't need maximum reasoning to reformat a table. Dial it."

**SAY** *(the honest number + the disclaimer — say the disclaimer out loud)* — "Honest order of
magnitude: a full iteration of the demo pipeline plausibly costs **low single-digit dollars** at
mid-tier API rates. But — and I mean this — trust no table, including mine. Use the built-in cost
commands and **measure your own workload.** Every claim in this talk is one you can verify. This one especially."

**→ transition** — "One more thing an institute has to get right, and it's not the money — it's the data." *(advance)*

---

### ⏱ 49:30 — "Data governance for an institute — three rules"

**SHOW** The three governance rules + the process rule.
**DO** This is the slide the compliance-minded person in the room is waiting for. Deliver it plainly and firmly — no hedging.

**SAY** —
- "Rule one: **restricted microdata never enters a prompt.** Ever. The intern edits code and reads aggregated outputs; the raw restricted files live in a path the permissions deny. He orchestrates an analysis whose sensitive inputs **he never sees.** You watched that fence in the demo."
- "Rule two: for institutional work, **prefer Team, Enterprise, or API access**, and read the current commercial terms on training-data use before you onboard — not individual consumer accounts on default settings."
- "Rule three: for data-residency needs, the same models are available through cloud providers with **EU-region endpoints.** Some setup friction; it is solvable."

**SAY** *(the process rule)* — "And one process rule that sounds boring and will save you a week:
**pin the tool version** in a shared config, so an overnight release can't silently change behaviour
in the middle of your project."

**→ transition** — "So it works, it's affordable, it's governable. Let me be equally clear about what you must never hand over." *(advance to Section 5)*

---

# 5 · Pitfalls & division of labour · 51:00 – 56:00

### ⏱ 51:00 — Section divider + "Each pitfall ties back to a paper"

**SHOW** Divider "5 · Pitfalls & the division of labour", then the five pitfalls.
**DO** Tie each pitfall to its Lens-B paper — it closes the loop with the first half and shows the literature was practical all along.

**SAY** — "Five pitfalls, and notice that each one ties back to a paper from the first half. The
literature wasn't decoration. It was the risk register."
- "**Machine-labelled variables in a regression** without a validation subsample. That is rule one — Ludwig, Mullainathan and Rambachan — and in this pipeline it is a literal check in the data skill."
- "**Training contamination.** Anything on the public internet may already sit inside the model, so a historical text or price exercise needs an explicit leakage argument. Same paper, same memorized bills."
- "**Fabricated citations.** So the bibliography is built only from fetched metadata, never from the model's memory of the literature, and a claim-verification pass runs before submission."
- "**Verification asymmetry.** Generation is cheap and checking is dear — the five components exist to industrialize the checking."
- "**The forking-paths problem gets worse.** Two hundred overnight specifications are a gift to honest robustness and a menace for selective reporting. Pair the capability with pre-registration or full specification disclosure. The tool doesn't decide which you are. You do."

**→ transition** — "Which sets up the only slide on this that really matters — what stays human." *(advance)*

---

### ⏱ 54:00 — "The division of labour"

**SHOW** Two columns — what agents excel at · what humans keep — + the Jones / Brynjolfsson catch.
**DO** Slow down. This is the reassurance the senior people in the room need, and it's **true**, so say it with conviction.

**SAY** *(the split)* — "So draw the line. The intern is excellent at mechanical transformation —
refactoring, formatting, first-pass literature scans, replication packaging, robustness sweeps. The
tireless middle. Humans keep the question, the identification argument, the interpretation, the
ethical judgment, and the final voice of the prose."

**SAY** *(the payoff — the two held thoughts come back)* — "And here is the part that should
reassure the senior people in this room, because two threads from earlier now meet. Remember Jones:
the economy is a chain capped by its **weakest link** — and in research production, the weakest
link is human judgment. And remember the hook: the tool **raises the floor, not the ceiling** — the
novices gained the most. Put those together and the conclusion is the opposite of the anxious one.
**Senior researchers matter more, not less.** The scarce input is no longer generation. It is
review — and the tool just made review the most valuable thing in the building."

**→ transition** — "Let me bring it home." *(advance to Section 6)*

---

# 6 · Close · 56:00 – 59:00

### ⏱ 56:00 — "Three takeaways"

**SHOW** The three takeaways.
**DO** Call back to the three things from slide one — the talk closes the loop it opened. Count them on your fingers again.

**SAY** —
- "One. **The literature gives you three lenses** — the job description, the rulebook, and the million-intern question. Know the flagship paper for each, and the field is no longer a firehose."
- "Two. **The smallest viable pipeline has five parts** — context, plan gate, permissions, verification, git. Start there, not with fifty skills you'll never audit."
- "Three — and if you forget the other two, keep this one. **The binding constraint is your verification, not the machine's generation.** The intern generates; you guarantee. Design for cheap checking and honest numbers, and everything else follows."

**→ transition** — "And I don't want you to leave with a feeling — I want you to leave with a repository." *(advance)*

---

### ⏱ 57:30 — The call to action + the starter prompt

**SHOW** The "clone it this afternoon" catch, then the starter-prompt slide.
**DO** Say the URL twice and make sure it's readable. **This is the single most important audience action** — the whole repo exists so they can do it.

**SAY** — "Everything you saw is at **github dot com, slash lusiki, slash AI underscore workshop
underscore wiiw.** Clone it this afternoon. Paste the starter prompt on the screen — it encodes the
whole plan-first, verify-everything discipline in one paragraph — fill in your project, and produce
a compiled section on your own machine, today."

**SAY** *(if time — otherwise skip straight to the last line)* — "The reading list on the next slide
maps every paper back to its lens, so your literature review has a spine before you write a word."

---

### ⏱ 58:30 — Last line + Q&A

**SHOW** Leave the takeaways or the repo slide up during Q&A (whichever you want them staring at — I'd leave the **repo URL**).
**DO** Land the final sentence, pause, *then* invite questions. Don't step on your own ending.

**SAY** *(the closer — memorize this one, don't read it)* — "The machine is a brilliant intern —
capable, tireless, occasionally overconfident. Your job, the one that just became more valuable,
not less, is to be the principal who designed the contract well. **Generation got cheap. Judgment
got scarce. Go be scarce.** Thank you."

*(pause for applause / the beat — then:)*

**SAY** — "I'd love your questions — and I'm especially happy to get concrete about **your** data and
**your** governance constraints."

---

## Q&A — have these ready

Short, honest answers. If you don't know, say so and offer to follow up — this audience respects that.

- **"Isn't this just autocomplete with extra steps?"** — "Autocomplete has no loop. This has a plan you approve, a fence he runs inside, and a verification step that can fail the build. The value isn't smarter text. It's delegation you can audit."
- **"How do I know the numbers are right?"** — "You don't take the intern's word for it — that is the point of numeric provenance. Every number traces to the script that made it, and the build fails if one doesn't. You saw it fail."
- **"What about our restricted microdata / GDPR?"** — Point back to the three governance rules: restricted paths are read-denied, so the intern never sees the sensitive inputs; prefer Team/Enterprise/API with reviewed terms; EU-region endpoints exist for residency.
- **"What does it *really* cost us?"** — "Low single-digit dollars per pipeline iteration at mid-tier rates is my honest estimate — but measure your own, and route seventy-twenty-ten. A subscription flattens it."
- **"Will this replace junior researchers?"** — The Brynjolfsson result says novices gain the most capacity; the Jones argument says judgment is the weak link and stays human. Review becomes the scarce, senior skill — the ladder changes shape, it doesn't disappear.
- **"Which model should we use?"** — "Route by task, don't pick one. Cheap for mechanical work, frontier for identification. The pipeline lets you swap per step."
- **"What if the tool changes next week?"** — "Pin the version in shared config. Upgrades become a deliberate choice, not a surprise mid-project."
- **"Can I trust it to write the prose?"** — "First draft and mechanical edits, yes. The final voice stays yours. That's in the division-of-labour slide, and it's a rule, not a preference."

---

## One-line cheat sheet (tape next to the demo cheat sheet)

```
OPEN 3 things → HOOK the intern already works here (verification is the constraint)
→ LENSES job description / rulebook / a million interns → FIVE competent·aligned·contained·honest·reversible
→ DEMO plan→approve→fence→CATCH→commit→PDF → COST 70/20/10 + "measure your own"
→ GOVERNANCE restricted never in a prompt → HUMANS keep judgement
→ CLOSE generation cheap, judgement scarce — go be scarce.     stall>60s → cut to recording, keep talking
```
