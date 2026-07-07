# Demo run-book (minutes 30–44)

The demo is the **protected block**. If earlier sections run long, cut slides from
Lens C — never the demo. This is the script, the safety net, and the rehearsal.

---

## Before the talk (the day before, and again 30 min before)

- [ ] `Rscript setup.R` on the demo machine — R, Quarto, LaTeX, packages all present.
- [ ] **Warm the data**: `Rscript analysis/run.R --refresh` once, so `data/raw/` holds a cached Eurostat extract. The demo then runs with **no dependence on the venue network**.
- [ ] **Warm `renv`** and open one agent session so the first response in the demo is fast.
- [ ] **Record a full clean run** end to end (screen capture) and keep the video **one keystroke away**.
- [ ] Rehearse the planted-bug catch at least once (below) so the timing is reliable.
- [ ] Terminal font at presentation size; dark-on-light theme; hide notifications.
- [ ] Confirm the active Pro/Max account and that `git` identity is set.

**Plant the bug right before you start** (leave the repo clean until then):

```bash
Rscript demo/plant_bug.R          # injects a hand-typed "13.8 log points" into Results
```

See [PLANTED_BUG.md](PLANTED_BUG.md) for exactly what it changes and the
current-vs-constant-prices alternative.

---

## The scripted beats

| Time | On screen | What you say / do |
|---|---|---|
| **30–31** | Terminal in the cloned repo; agent started; `CLAUDE.md` open ~30s | "The constitution is short and readable — this is everything the agent knows about the project." |
| **31–33** | Type one plain-language request (below); agent enters **plan mode** | "One request, in English. Notice it does not touch a single file yet." |
| **33–35** | Read the plan aloud — files it will touch, scripts it will run, how it will verify. **Approve.** | "This approval is the moment of delegation. From here the agent runs on its own until it reports back." |
| **35–40** | Execution: pulls cached Eurostat data, runs the pipeline, edits the `.qmd`, renders the PDF | Narrate the **permission fence** — what it is allowed (`Rscript`, `quarto render`, read-only git) and what is blocked (destructive git, `data/restricted/`). |
| **40–43** | **The money moment** — verification catches the planted bug | "The results paragraph quotes a number that no longer matches the table. The critic flags it, the fixer repairs it, the render passes. This is what a tired human on a deadline misses." |
| **43–44** | `git diff` · quality score · **commit** · hold up the compiled PDF page | "Small, reviewable, reversible. That is the whole loop." |

**The request to type** (or paste):

> Extend the convergence sample through 2025, refresh Figure 2, rerun the event
> study, and update the results paragraph — planning first.

Because the repo ships with `SAMPLE_END = 2023`, this genuinely moves the endpoint:
`targets` recomputes the event study, Figure 2, and the results numbers — you see
"only what changed" rebuild, not a no-op.

---

## What the audience should take from each beat

- **Plan mode** → the plan gate (component 2). Alignment before action.
- **The permission fence** → permissions (component 3). Containment.
- **The catch** → verification (component 4). Honesty. *This is where skeptics convert.*
- **`git diff` → commit** → git (component 5). Reversibility.

---

## If it stalls — the 60-second rule

If anything stalls for **more than ~60 seconds** — a slow model turn, a network
hiccup, an unexpected error — **switch to the recording without apology and keep
narrating.** Do not debug live. The recording shows the same beats; your narration
is what matters.

Have ready, in order of preference:

1. The pre-recorded clean run (one keystroke away).
2. A screenshot of the caught bug (the "money moment" slide) and the final PDF.

---

## After the demo — reset

```bash
Rscript demo/reset_demo.R         # restore the inline reference; repo clean again
```

Do this before pushing or before the next rehearsal, so the repository people clone
is in its clean, all-tests-pass state.

---

## One-line cheat sheet (tape to the laptop)

```
plant_bug → open CLAUDE.md → type request (plan first) → approve → narrate fence
→ CATCH → git diff → commit → hold up PDF     |  stall >60s → cut to recording
```
