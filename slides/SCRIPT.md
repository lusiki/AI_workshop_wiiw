# Delivery script — the full hour

*"AI in Economics Research: From Frontier Ideas to a Working Agentic Pipeline"* · a seminar for wiiw.

This is the **spoken script** for the whole talk — what to **do**, what to **show**, and what to
**say**, slide by slide. It is the companion to two other documents:

- [`slides/slides.qmd`](slides.qmd) — the deck itself (the words on screen).
- [`demo/RUNBOOK.md`](../demo/RUNBOOK.md) — the authority for the live demo, minutes 30–44. Where
  this script and the run-book touch the demo, **the run-book wins**; here the demo is compressed to
  keep the whole hour in one document.

**Register.** The room is research economists — causal-inference literate, professionally skeptical,
allergic to hype. Nothing here is oversold. The through-line is one sentence: *the binding constraint
is your verification, not the machine's generation.* Say it early, land it at the demo, close on it.

**The `SAY` lines are sayable, not read-aloud-verbatim.** Deliver them in your own cadence; the deck
holds the citations so your eyes can stay on the room. Bold inside a `SAY` line marks the beat to lean on.

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

**SAY** — "Thank you. In the next hour I want to do something narrow and concrete. Not a survey of
everything AI might one day do to economics — a **working pipeline** you can clone this afternoon and
use to produce a wiiw working-paper section. We'll go from the frontier literature, to the machinery,
to a live demonstration where the machinery catches a mistake in front of you."

**→ transition** — "Here's exactly what you leave with." *(advance)*

---

### ⏱ 00:30 — "By the end of the hour you leave with three things"

**SHOW** The three deliverables + the "smallest viable practical" note.
**DO** Count them on your fingers — physically. It cues the audience that the talk has three anchors.

**SAY** —
- "**One — a mental map** of the AI-in-economics literature. Three lenses, and the flagship paper for each, so the field stops being a firehose."
- "**Two — a cloneable repository.** A minimal agentic pipeline for producing a working-paper section. Not a toy — it pulls live Eurostat data and compiles a branded PDF."
- "**Three — a realistic cost picture.** In euros per month. What this actually costs to run at an institute like wiiw."

**SAY** *(lean on the design philosophy)* — "One word governs the whole design: **minimal**. Not eighteen
agents and fifty-two skills. The *smallest* set of components that makes handing research work to an AI
agent both **safe** and **productive**. It turns out that minimum is exactly **five pieces** — and I'll
name the failure each one prevents."

**→ transition** — "Start with why this is already your problem, whether or not you've opted in." *(advance)*

---

# 0 · Hook · 02:00 – 06:00

### ⏱ 02:00 — Section divider "0 · Hook"

**SHOW** Divider — *The technology is already inside the research production function.*
**DO** Read the divider line, then advance quickly. Dividers are breath, not content.

**SAY** — "The framing for the hook is one line: this technology is **already inside** the research
production function. The only decision left is whether it's there **deliberately or by accident**."

---

### ⏱ 02:20 — "Adoption is happening — the only question is whether it is deliberate"

**SHOW** Two columns: Chatterji et al. (diffusion at scale) · Brynjolfsson, Li & Raymond (QJE field evidence).
**DO** Point to the left column, then the right. Two facts, two gestures.

**SAY** —
- "On the left, **diffusion**. Chatterji and co-authors, this year, measure usage at population scale — asking, doing, expressing, across work and personal life. The adoption curve is steeper than anything comparable we have on record."
- "On the right, the **causal microevidence** — the paper to know. Brynjolfsson, Li and Raymond, in the *QJE*: a real customer-support deployment. Average productivity up **fourteen to fifteen percent**. And two results that matter more than the average — the gains concentrate among the **newest** workers, and the skill distribution **compresses**."

**SAY** *(the turn)* — "Sit with the second one. The tool **raises the floor faster than the ceiling.**
For a research institute that is not a footnote — it changes **who** can produce competent knowledge
work, and **how fast**. So the question was never *whether*. It's **deliberate versus accidental**."

**→ transition** — "Economists already own the right frame for a tool this capable and this fallible. We invented it." *(advance)*

---

### ⏱ 04:00 — "A frame economists already own: this is a principal–agent problem"

**SHOW** The principal–agent framing + the catch line.
**DO** This slide is load-bearing. Slow down. Make eye contact on the last sentence.

**SAY** —
- "**You** are the principal. **The model** is the agent — capable, tireless, and occasionally, confidently, wrong."
- "Its output has a specific economic property: **cheap to produce, costly to verify.** That asymmetry is the whole game."
- "So everything I show you in the second half — the plan gate, the permission fence, the quality score — is not IT plumbing. It is **contract design under asymmetric information.** Mechanisms that make a cheap-to-generate, costly-to-verify agent safe to delegate to."

**SAY** *(the thesis — say it slowly, this is the spine of the hour)* — "Which gives us the one sentence
I want you to leave with. **The binding constraint is not the machine's generation. It's your
verification.** Hold onto that. Everything else hangs off it."

**→ transition** — "With that frame, the literature stops being a pile and sorts into three lenses." *(advance)*

---

# 1 · Three lenses · 06:00 – 17:00

### ⏱ 06:00 — Section divider "1 · Three lenses on AI in economics"

**SHOW** Divider — *Tool · Instrument · Object.*
**DO** Introduce the scaffold before the detail — tell them the shape of the next eleven minutes.

**SAY** — "Three lenses. AI as a **tool** that shifts how we produce research. AI as an **instrument**
inside our estimates — powerful and dangerous. And AI as an **object** of study, and a force on the
profession itself. Tool, instrument, object. One flagship paper each — if you remember nothing else,
remember the anchor paper per lens."

---

### ⏱ 06:40 — "Lens A — AI as a *tool*"

**SHOW** Korinek ×2, Dell, Bahoo, Sant'Anna.
**DO** Don't read all five. Land Korinek and Dell; name the rest as a map.

**SAY** —
- "The founding text is **Korinek, 2023, in the *JEL*** — the taxonomy of how LLMs assist across the whole research pipeline. And his organizing variable is the one we already care about: usefulness rises as **verification cost falls.** Same variable as the principal–agent frame. That's not a coincidence — it's the field's centre of gravity."
- "**Korinek again, 2025**, names the shift this seminar is actually about: **chatbots become agents.** An agent is model *plus tools, plus memory, plus iteration.* That's the object we're building today."
- "**Dell, 2025**, is the one economists underrate — deep learning as **data creation.** OCR, embeddings, record linkage. It unlocks sources that were previously trapped on paper."

**SAY** *(make it wiiw's)* — "Make that concrete for this institute: historical CESEE statistics,
national gazettes, firm registries — sources that were economically untouchable become **tractable.**
Sant'Anna, 2026 — the practitioner's manual — is the one we actually deploy in the demo."

**→ transition** — "So Lens A is the upside. Lens B is where careful people get nervous — correctly." *(advance)*

---

### ⏱ 09:20 — "Lens B — AI as an *instrument*, with warnings"

**SHOW** Ludwig, Mullainathan & Rambachan (the highlighted discipline paper) + Athey, Gavrilova, Chen.
**DO** This is the slide that earns the room's trust. Give the discipline paper its full weight.

**SAY** *(the discipline paper)* — "The paper to internalize is **Ludwig, Mullainathan and Rambachan.**
Their result is sharp: an LLM output can enter your pipeline **two** valid ways, and only two. As a
**prediction** — which needs an out-of-training-sample argument you frequently **cannot inspect**,
because you don't know what was in training. Or as an **estimation** input — which needs a
**human-labelled gold-standard subsample** to bound the measurement error. Any third way, and
measurement error quietly **contaminates your estimates.**"

**SAY** *(the supporting three, fast)* —
- "**Athey and co-authors** — predicting *who is worst off* is not predicting *who responds.* Whom to nudge is a **causal** question, not a predictive one."
- "**Gavrilova** — causal forests *inside* a DiD design: let the algorithm find heterogeneity, keep **identification from the design.** That's the pattern to copy."
- "**Chen and co-authors** — theory-guided transfer learning; structure regularizes a flexible learner, and the payoff is biggest in **small samples** — which is often our situation."

**SAY** *(the rule — say it as a rule)* — "One rule for this room, and it's non-negotiable: **no
machine-generated variable enters a regression without a human-labelled validation set.** We'll see
it later encoded as an actual check in the pipeline."

**→ transition** — "Lens A, the upside. Lens B, the discipline. Lens C zooms out to what's at stake." *(advance)*

---

### ⏱ 13:00 — "Lens C — AI as an *object* of study"

**SHOW** Acemoglu, Jones, Brynjolfsson–Korinek–Agrawal, Mullainathan.
**DO** Frame it as a debate with a stake, not a reading list. *(This is the slide to compress if you're behind — hold Acemoglu vs Jones, name the other two.)*

**SAY** —
- "**Acemoglu** gives the sober lower bound: a task-based benchmark, cumulative TFP gains **under one percentage point** over a decade. Defensible. Deflationary."
- "**Jones, 2026**, is the counterweight, and it's the more interesting argument. **Weak links** — the hardest human tasks cap your gains; a chain is as strong as its weakest link. *And yet* — automate *nearly* everything and you still get large acceleration. So the real debate isn't direction, it's **timing and bottlenecks.**"
- "**Brynjolfsson, Korinek and Agrawal** lay out the research agenda if this is transformative — and it's a menu of **wiiw-sized questions**: CESEE convergence, labour reallocation, nearshoring."

**SAY** *(the sting)* — "And **Mullainathan** closes the loop: algorithms now sit **inside** the economy
as decision-makers. Which means the profession studying them is **part of the treatment group.** We're
not neutral observers of this one."

**→ transition** — "Three lenses. Let me collapse them into the one bridge that gets us to the machinery." *(advance)*

---

### ⏱ 15:30 — "The bridge"

**SHOW** The fitted line (Lens A raises productivity) + Lens B / Lens C recap + the catch.
**DO** This is a rhetorical hinge — deliver it as three beats and a promise, then move.

**SAY** — "Put the three together. Lens A: these tools **raise** research productivity — real gains.
Lens B: they are **dangerous inputs** unless disciplined. Lens C: the stakes are **macroeconomic.**"

**SAY** *(the promise)* — "So here is the entire job of Part Two: **capture the Lens A gains while
enforcing the Lens B discipline.** Get the productivity *and* keep the numbers honest. That's what
the five components are for. Let's build them."

**→ transition** *(advance into Section 2 divider)*

---

# 2 · Anatomy of the pipeline · 17:00 – 30:00

### ⏱ 17:00 — Section divider "2 · Anatomy of an agentic pipeline"

**SHOW** Divider — *The five components — and the failure each one prevents.*

**SAY** — "Five components. I'll introduce each one **with the specific failure it prevents** — because
a safeguard you can't name the failure for is a safeguard you'll delete the first time it's inconvenient."

---

### ⏱ 17:30 — "The operating loop is the entire rhythm"

**SHOW** The loop diagram (`assets/loop-diagram.svg`).
**DO** Trace the loop with your finger or the pointer, once, in order. Land on *you* at both ends.

**SAY** — "This is the whole rhythm, and it never changes. You **describe** a task in plain English. The
agent **plans**. **You approve** — that's a gate, we'll come back to it. The agent **executes under
permissions**, then **verifies** its own work, and reports back. **You review the diff** and say
**commit.** Then the next task."

**SAY** *(the point of the picture)* — "Notice where the human is: **the two ends.** You own the
**intent** at the start and the **judgement** at the end. The agent owns the tedious middle. That
division — not full autonomy, not doing it all yourself — is the entire idea."

**→ transition** — "Five components sit on that loop. Components one and two — before the agent is allowed to touch anything." *(advance)*

---

### ⏱ 19:30 — "Context & the plan gate" (components 1–2)

**SHOW** Two columns — `CLAUDE.md` (context) · the plan gate.
**DO** If a terminal is handy, you *can* flash the real `CLAUDE.md` here for ten seconds — but the demo does this properly, so don't over-invest.

**SAY** *(component 1)* — "**Component one: context.** A file called `CLAUDE.md` — the project's
**constitution.** The agent reads it every session. It's short by design, around a hundred and twenty
lines: principles, folder layout, the key commands, the current state. And the detailed rules are
**path-scoped** — the R conventions load only when the agent touches an `.R` file; the house style
loads only with the manuscript. **The failure it prevents:** the agent forgetting your decisions and
sliding back to generic defaults."

**SAY** *(component 2)* — "**Component two: the plan gate.** For anything nontrivial, the agent plans
in **read-only mode first** — writes the plan to disk — and **waits for your approval** before editing
a single file. The plan survives even when the conversation is compacted, and it leaves an **audit
trail.** **The failure it prevents:** solving the *wrong problem*, fast — and losing the reasoning
behind the choices. The plan gate is where alignment happens **before** action, when correction is cheap."

**→ transition** — "Once you approve, the agent runs on its own. Two components make that safe." *(advance)*

---

### ⏱ 22:30 — "Permissions & verification" (components 3–4)

**SHOW** Two columns — permission-scoped execution · verification (three mechanisms).
**DO** This slide sets up the demo's two payoffs (the fence, the catch). Plant both phrases now so they pay off later.

**SAY** *(component 3)* — "**Component three: permissions.** A settings file **allowlists** exactly which
commands run without asking — `Rscript`, `quarto render`, read-only `git`. And it **denies** the rest:
destructive git, `rm -rf`, and — importantly for an institute — any read under `data/restricted/`. **The
failure it prevents:** an autonomous process with unbounded ability to touch your machine and your data.
Watch for this in the demo — I'll call it the **permission fence.**"

**SAY** *(component 4 — say "honest," it's the emotional core)* — "**Component four: verification** — the
one that matters most, so I'll name all three mechanisms. **Replication-first** — reproduce the known
numbers before you extend them. An **adversarial critic-and-fixer loop** — the agent doesn't grade its
own homework; a separate read-only critic tries to break the work. And **numeric provenance** — *every*
number quoted in the paper is anchored to the script that produced it. **The failure it prevents:**
**confident nonsense reaching the working paper.** This is the component that converts skeptics, and
in about ten minutes you'll watch it fire."

**→ transition** — "And the fifth component ties the other four into something you can trust." *(advance)*

---

### ⏱ 26:00 — "Memory & git — and how it all binds" (component 5)

**SHOW** Component 5 (memory & git) + the binding catch line.
**DO** This is the summary of the whole section. Deliver the "remove any one" line as the closer, then let it breathe before the demo.

**SAY** *(component 5)* — "**Component five: memory and git.** Corrections accumulate as tagged
one-liners — a mistake gets made **once**, then it's written down. And **git** is the safety net:
small commits, an advisory **quality score** — eighty to commit, ninety for a pull request,
ninety-five is genuinely excellent — and worktrees to sandbox risky experiments. **The failure it
prevents:** repeating mistakes, and ending up somewhere you can't get back from."

**SAY** *(the binding — this is the money line of Part Two; deliver it deliberately)* — "Here's how the
five bind. **Context** makes the agent **competent.** The **plan gate** makes it **aligned.**
**Permissions** make it **contained.** **Verification** makes it **honest.** **Git** makes it
**reversible.** Competent, aligned, contained, honest, reversible. **Remove any one — and a specific,
nameable failure walks back in.** That's why it's five and not fifty, and also why it's five and not three."

**SAY** *(pre-empt the "is that all?")* — "Skills, subagents, MCP servers — everything you've heard of —
are **refinements** of these five. Start with the constitution and two or three skills. Don't build the
cathedral first."

**→ transition** — "Enough architecture. Let me show you the whole loop fire on a real task — and catch a real mistake." *(advance to Section 3 divider)*

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

**SAY** — "The artifact is a real working-paper section: **income convergence in the CESEE EU members
since accession** — a small staggered event study around the 2004, 2007 and 2013 waves. I chose it
deliberately: the data are **public** Eurostat, the econometrics are **familiar** — Sun and Abraham,
Callaway and Sant'Anna. Which means **all your attention is free for the workflow**, not the economics."

**SAY** *(the aside — it usually gets a nod)* — "One pleasant detail: the workflow guide we deploy and
the modern DiD estimator in the `did` package **share an author.** The tooling and the econometrics
come from the same intellectual household. That's the state of this little field."

**→ transition** — "Let me switch to the terminal." *(switch to terminal)*

---

### ⏱ 31:00 — Show the constitution, then make one request

**SHOW** Terminal in the cloned repo; `CLAUDE.md` open for ~30 seconds; then the agent prompt.
**DO** Open `CLAUDE.md`, scroll once, close it. Then type (or paste) the request and let the agent enter **plan mode**.

**SAY** *(on `CLAUDE.md`)* — "This is the constitution I described — short, readable, and it's
**everything** the agent knows about this project. No hidden state."

**DO** Type the request (from the run-book):
> Extend the convergence sample through 2025, refresh Figure 2, rerun the event study, and update the results paragraph — planning first.

**SAY** — "One request. Plain English. And watch — it does **not touch a single file yet.** It's
going to plan first, because the constitution told it to."

---

### ⏱ 33:00 — Read the plan aloud, then approve

**SHOW** The agent's plan (files it will touch, scripts it will run, how it will verify).
**DO** Read two or three plan lines aloud so the audience sees the plan is legible. Then **approve.**

**SAY** — "Here's the plan. It names the files it will touch, the scripts it will run, and — this is the
part I want you to notice — **how it will verify** before it claims to be done. I can read this in ten
seconds and know whether it understood me."

**SAY** *(as you approve — name the moment)* — "I approve. **This keystroke is the moment of
delegation.** From here it runs on its own until it reports back."

---

### ⏱ 35:00 — Execution — narrate the permission fence

**SHOW** Execution: cached Eurostat pull, `targets` recompute, `.qmd` edit, render starting.
**DO** Narrate — don't watch silently. This is your two minutes to explain what's scrolling.

**SAY** — "As it runs, notice what it's **allowed** to do without asking — `Rscript`, `quarto render`,
read-only `git` — that's the **permission fence** from component three. And notice what it **can't**
touch: destructive git, and anything under `data/restricted/`. It's autonomous **inside a fence**, not
autonomous full stop. And because the sample end genuinely moves from 2023, `targets` is recomputing
**only what changed** — the event study, Figure 2, the results numbers. You're watching an incremental
rebuild, not a no-op."

---

### ⏱ 40:00 — **THE MONEY MOMENT** — verification catches the planted bug

**SHOW** The verification step failing on the provenance check; the offending literal; the fix; the clean re-render.
**DO** **Stop moving. Stop narrating over it.** Let the failure appear on screen for a beat before you speak. This is the slide the whole talk was built to reach.

**SAY** *(after the pause)* — "There. Stop. The results paragraph quotes a number — **13.8 log points** —
that **no longer matches the refreshed table.** A number that was, at some point, typed by a human hand.
The provenance check **failed the build.** The critic flagged it, a separate pass repaired it — back to
a code-backed reference — and the render now passes clean."

**SAY** *(the line to land — slow, then stop talking)* — "That is **exactly** the error a tired human on
a deadline ships. The pipeline caught it because it **checks every number against its source, every
time, and never gets tired.** *That* — is the binding constraint made mechanical. That's the whole hour
in one screen."

> **If it stalled:** cut to the recording now, and deliver the two `SAY` lines above over the video. The
> narration is what matters, not whether it's live.

---

### ⏱ 43:00 — Diff, score, commit, hold up the PDF

**SHOW** `git diff` · the advisory quality score · the commit · the compiled PDF page.
**DO** Scroll the diff briefly; commit; **physically hold up / display the compiled PDF page.** End on the artifact.

**SAY** — "And to close the loop: here's the **diff** — small and reviewable. The advisory **quality
score** clears the bar. I say **commit** — and it's a small, reversible step in git history. And here" —
*(hold up the PDF)* — "is the compiled section. **Describe, plan, approve, execute in the fence, verify,
commit.** Small, reviewable, reversible. That is the entire loop, and you just watched it run."

**DO** *(after the talk — don't forget)* `Rscript demo/reset_demo.R` to restore the clean repo before pushing or re-rehearsing.

**→ transition** — "It works. The next question any institute asks is: **what does it cost?**" *(switch back to deck, advance to Section 4)*

---

# 4 · Pricing & infrastructure · 44:00 – 51:00

### ⏱ 44:00 — Section divider + "Any laptop suffices"

**SHOW** Divider "4 · Pricing & infrastructure", then the local-requirements + pricing table slide.
**DO** Kill the fear first (no special hardware), then the numbers. **Point at the on-slide "verify at claude.com/pricing" note yourself** — it buys you credibility.

**SAY** *(hardware)* — "First, the relief: **any laptop.** A terminal, git, R, Quarto, a LaTeX
distribution, and Node to install the tool. **No GPU. No special hardware.** The model runs in the
cloud; the analysis runs on the machine in front of you. The repo ships a `setup.R` that checks all of it."

**SAY** *(pricing — and flag the caveat before they can)* — "Two ways to pay, and let me flag the
honesty note on the slide **before** you do: **verify these at claude.com/pricing** — I re-checked the
week of this talk, but they move. Per **million tokens**: the cheap tier around a dollar in, five out;
mid tier a few dollars; the high and frontier tiers more. The point isn't the exact figure — it's the
**spread**: the cheapest and the frontier model differ by roughly an **order of magnitude.** Which is a
lever, not a bill."

**SAY** *(subscriptions — one line)* — "And there's a flat-rate door: subscriptions from twenty dollars a
month. For a steady working-paper habit, that turns a variable bill into a **predictable line item.**"

**→ transition** — "Because of that ten-to-one spread, the single most useful skill is **cost engineering.**" *(advance)*

---

### ⏱ 47:00 — "Cost engineering: route models, cache context, set effort"

**SHOW** Two columns — the 70/20/10 routing pattern · caching + effort.
**DO** This is the practical-takeaway slide. Say the 70/20/10 numbers clearly; people write these down.

**SAY** *(routing)* — "Lever one: **route by task.** A rule of thumb that holds up — call it
**seventy / twenty / ten.** About **seventy percent** of the work is mechanical — formatting, first-pass
scans — send it to the **cheap** model. About **twenty percent** is review and drafting — the **mid**
tier. Only the last **ten percent** — identification, the high-judgement calls — needs the **frontier**
model. Route like that and you **halve the bill or better** versus running everything on the frontier."

**SAY** *(the other two levers, fast)* — "Lever two: **prompt caching.** Most of an agentic session is
the *same* context sent again and again; cache it and repeated context costs almost nothing. Lever
three: **effort per task** — you don't need maximum reasoning to reformat a table. Dial it."

**SAY** *(the honest number + the disclaimer — say the disclaimer out loud)* — "Honest order of magnitude:
a full iteration of the demo pipeline plausibly costs **low single-digit dollars** at mid-tier API
rates. But — and I mean this — **trust no table, including mine.** Use the built-in cost commands and
**measure your own workload.** Every claim in this talk is one you can verify; this one especially."

**→ transition** — "One more thing an institute has to get right, and it's not the money — it's the data." *(advance)*

---

### ⏱ 49:30 — "Data governance for an institute — three rules"

**SHOW** The three governance rules + the process rule.
**DO** This is the slide the compliance-minded person in the room is waiting for. Deliver it plainly and firmly — no hedging.

**SAY** —
- "**One — restricted microdata never enters a prompt.** Ever. The agent edits **code** and reads **aggregated** outputs; the raw restricted files live in a path the permissions **deny.** The model orchestrates an analysis whose sensitive inputs **it never sees.** You watched that fence in the demo."
- "**Two — for institutional work, prefer Team, Enterprise, or API access**, and **read the current commercial terms on training-data use before you onboard** — not individual consumer accounts on default settings."
- "**Three — for data-residency needs**, the same models are available through cloud providers with **EU-region endpoints.** Some setup friction; it's solvable."

**SAY** *(the process rule)* — "And one process rule that sounds boring and will save you a week:
**pin the tool version** in a shared config. So an overnight release can't **silently change behaviour**
in the middle of your project."

**→ transition** — "So it works, it's affordable, it's governable. Let me be equally clear about what you must **never** hand over." *(advance to Section 5)*

---

# 5 · Pitfalls & division of labour · 51:00 – 56:00

### ⏱ 51:00 — Section divider + "Each pitfall ties back to a paper"

**SHOW** Divider "5 · Pitfalls & the division of labour", then the five pitfalls.
**DO** Tie each pitfall to its Lens-B paper — it closes the loop with the first half and shows the literature was practical all along.

**SAY** — "Five pitfalls, and notice each one **ties back to a paper** from the first half — the
literature wasn't decoration, it was the risk register."
- "**Machine-labelled variables in a regression** without a validation subsample — that's **Ludwig, Mullainathan and Rambachan**, and in this pipeline it's a literal **check** in the data skill."
- "**Training contamination** — anything on the public internet may already sit inside the model; a historical text or price exercise needs an explicit **leakage argument.**"
- "**Fabricated citations** — so the bibliography is built **only** from fetched metadata, **never** the model's memory of the literature, and a claim-verification pass runs before submission."
- "**Verification asymmetry** — generation is cheap, checking is dear; the five components exist to **industrialize the checking.**"
- "**The forking-paths problem gets worse** — two hundred overnight specifications are a **gift** to honest robustness and a **menace** for selective reporting. Pair it with **pre-registration** or **full specification disclosure.** The tool doesn't decide which you are — you do."

**→ transition** — "Which sets up the only slide on this that really matters — what stays human." *(advance)*

---

### ⏱ 54:00 — "The division of labour"

**SHOW** Two columns — what agents excel at · what humans keep — + the Jones / Brynjolfsson catch.
**DO** Slow down. This is the reassurance the senior people in the room need, and it's **true**, so say it with conviction.

**SAY** *(the split)* — "So draw the line. **Agents are excellent** at mechanical transformation,
refactoring, formatting, first-pass literature scans, replication packaging, robustness sweeps — the
tireless middle. **Humans keep** the question, the identification argument, the interpretation, the
ethical judgement, and the **final voice** of the prose."

**SAY** *(the payoff — connect it back to Jones and to the QJE paper)* — "And here's the part that should
**reassure** the senior people in this room. Remember **Jones's weak link** — the chain is only as
strong as its weakest task. That weakest task is the researcher's **judgement.** And remember
**Brynjolfsson, Li and Raymond** — the novices gained the most capacity. Put those together and the
conclusion is the opposite of the anxious one: **senior researchers matter *more*, not less.** The
scarce input is no longer generation — it's **review.** That's your job, and the tool just made it the
most valuable thing in the building."

**→ transition** — "Let me bring it home." *(advance to Section 6)*

---

# 6 · Close · 56:00 – 59:00

### ⏱ 56:00 — "Three takeaways"

**SHOW** The three takeaways.
**DO** Call back to the three things from slide one — the talk closes the loop it opened. Count them on your fingers again.

**SAY** —
- "**One — the literature gives you three lenses.** Tool, instrument, object. Know the flagship paper for each, and the field is no longer a firehose."
- "**Two — the smallest viable pipeline has five parts.** Context, plan gate, permissions, verification, git. **Start there** — not with fifty skills you'll never audit."
- "**Three** — and if you forget the other two, keep this one: **the binding constraint is your verification, not the machine's generation.** Design for cheap checking and honest numbers, and everything else follows."

**→ transition** — "And I don't want you to leave with a feeling — I want you to leave with a repository." *(advance)*

---

### ⏱ 57:30 — The call to action + the starter prompt

**SHOW** The "clone it this afternoon" catch, then the starter-prompt slide.
**DO** Say the URL twice and make sure it's readable. **This is the single most important audience action** — the whole repo exists so they can do it.

**SAY** — "Everything you saw is at **github dot com, slash lusiki, slash AI underscore workshop
underscore wiiw.** Clone it **this afternoon.** Paste the starter prompt on the screen — it encodes the
whole plan-first, verify-everything discipline in one paragraph — fill in your project, and produce a
compiled section **on your own machine, today.** And there's a **ninety-minute hands-on clinic** within
two weeks, so you're not doing it alone."

**SAY** *(if time — otherwise skip straight to the last line)* — "The reading list on the next slide maps
**every paper back to its lens**, so your literature review has a spine before you write a word."

---

### ⏱ 58:30 — Last line + Q&A

**SHOW** Leave the takeaways or the repo slide up during Q&A (whichever you want them staring at — I'd leave the **repo URL**).
**DO** Land the final sentence, pause, *then* invite questions. Don't step on your own ending.

**SAY** *(the closer — memorize this one, don't read it)* — "The machine is a capable, tireless,
occasionally overconfident agent. Your job — the one that just became **more** valuable, not less — is
to be the principal who designed the contract well. **Generation got cheap. Judgement got scarce. Go be
scarce.** Thank you."

*(pause for applause / the beat — then:)*

**SAY** — "I'd love your questions — and I'm especially happy to get concrete about **your** data and
**your** governance constraints."

---

## Q&A — have these ready

Short, honest answers. If you don't know, say so and offer to follow up — this audience respects that.

- **"Isn't this just autocomplete with extra steps?"** — "The difference is the **loop** — plan, permission fence, verification. Autocomplete has none of those. The value isn't smarter text; it's **delegation you can audit.**"
- **"How do I know the numbers are right?"** — "You don't take the model's word — that's the point of **numeric provenance.** Every number traces to the script that made it, and the build **fails** if one doesn't. You saw it fail."
- **"What about our restricted microdata / GDPR?"** — Point back to the three governance rules: restricted paths are **read-denied**, prefer Team/Enterprise/API with reviewed terms, EU-region endpoints exist for residency. The agent **never sees** the sensitive inputs.
- **"What does it *really* cost us?"** — "Low single-digit dollars per pipeline iteration at mid-tier rates is my honest estimate — **but measure your own**, and route 70/20/10. A subscription flattens it."
- **"Will this replace junior researchers?"** — Use the Brynjolfsson/Jones close: novices gain capacity, but **judgement is the weak link and stays human.** Review becomes the scarce, senior skill.
- **"Which model should we use?"** — "Route by task, don't pick one. Cheap for mechanical, frontier for identification. The pipeline lets you swap per step."
- **"What if the tool changes next week?"** — "**Pin the version** in shared config. Upgrades become a deliberate choice, not a surprise mid-project."
- **"Can I trust it to write the prose?"** — "First draft and mechanical edits, yes. The **final voice stays yours** — that's in the division-of-labour slide, and it's a rule, not a preference."

---

## One-line cheat sheet (tape next to the demo cheat sheet)

```
OPEN 3 things → HOOK principal-agent (verification is the constraint) → LENSES tool/instrument/object
→ FIVE competent·aligned·contained·honest·reversible → DEMO plan→approve→fence→CATCH→commit→PDF
→ COST 70/20/10 + "measure your own" → GOVERNANCE restricted never in a prompt → HUMANS keep judgement
→ CLOSE generation cheap, judgement scarce — go be scarce.     stall>60s → cut to recording, keep talking
```
