# wiiw agentic pipeline — project constitution

You are collaborating on a wiiw working-paper section on income convergence in
the CESEE EU members. Read this file every session. Keep it short; the detailed
rules load on demand.

## Operating principles (the five components)
1. **Context** — this file plus `.claude/rules/` are the ground truth. Prefer
   them over generic defaults.
2. **Plan first** — for any nontrivial task, plan in read-only mode, save the
   plan, and wait for my approval before editing. Solve the right problem.
3. **Permissions** — you run under the allowlist in `.claude/settings.json`.
   Read-only git, `Rscript`, and `quarto render` run freely; `git add/commit`
   ask; destructive git, `rm -rf`, and reads under `data/restricted/` are denied.
4. **Verify** — never report done without building or testing. See
   `.claude/rules/verification.md` (always loaded).
5. **Git** — small, reviewable commits. I review the diff and say when to commit.

## The loop
describe → plan → **I approve** → execute under permissions → verify → **I commit** → next

## Layout
- `R/` — functions (config, data, models, figures, tables, provenance). No
  side effects at source time. All constants live in `R/config.R`.
- `_targets.R` — the pipeline. `analysis/run.R` — one-command entry + verify.
- `paper/working_paper.qmd` — manuscript; it only *reads* results via
  `targets::tar_read()`. `paper/references.bib` — the only citation source.
- `results/` — `estimates.json` and `figures/` (generated; do not hand-edit).
- `data/raw/` — source extracts (reproducible pulls). `data/derived/` —
  reproducible from raw. `data/restricted/` — never read, never printed.
- `tests/testthat/` — schema, tolerance and provenance checks.
- `demo/` — the planted-bug scripts for the seminar (see `demo/PLANTED_BUG.md`).

## Key commands
```bash
Rscript analysis/run.R                         # build pipeline + provenance gate
Rscript analysis/run.R --refresh               # force a fresh Eurostat pull
Rscript -e 'targets::tar_make()'               # build only
Rscript -e 'testthat::test_dir("tests/testthat")'   # tests
quarto render paper/working_paper.qmd          # render the manuscript
```

## Skills and agents
- Skills: `data_pull`, `analysis`, `draft_section`, `referee`,
  `replication_check`. Use `replication_check` as the gate before "done".
- Subagents: `econometrics-reviewer`, `prose-reviewer`, `verifier` (read-only
  critic). Hand nontrivial work to `verifier` before reporting complete.

## Hard rules
- **Numbers**: every figure in the manuscript's Results section is an inline
  `` `r ...` `` reference to `results/estimates.json`. Never type a result by
  hand — `check_numeric_provenance()` fails the build on a stray literal.
- **Price basis**: `GDP_UNIT` is chain-linked volumes (`CLV...`). Never switch
  to current prices.
- **Validation**: no machine-labelled variable enters a regression without a
  human-labelled validation subsample.
- **Citations**: only from `references.bib`; never invent one.

## Current state
Template stage. The pipeline builds Figures 1–2, Table 1, and a short draft with
the results paragraph fully code-backed. The seminar demo extends `SAMPLE_END`,
refreshes Figure 2 and the results paragraph, and lets the verification loop
catch a planted number that no longer matches the table.
