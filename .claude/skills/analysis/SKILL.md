---
name: analysis
description: Rebuild estimates, figures and tables by running the targets pipeline. Use after any data or code change to recompute results before touching the manuscript.
allowed-tools: Bash(Rscript *), Read
---

# analysis

Recompute results reproducibly. targets only rebuilds what changed.

1. Run the pipeline:
   ```bash
   Rscript -e 'targets::tar_make()'
   ```
   (or `Rscript analysis/run.R`, which also runs the provenance gate).
2. Inspect the outputs, do not eyeball-guess them:
   - `results/estimates.json` — the numbers the manuscript is allowed to cite.
   - `results/figures/fig1_convergence.png`, `results/figures/fig2_event_study.png`.
3. Sanity-check against `tests/testthat` expectations (schema, tolerances,
   sign of the convergence gap):
   ```bash
   Rscript -e 'testthat::test_dir("tests/testthat")'
   ```

Estimation conventions live in `.claude/rules/r_conventions.md`. Do not edit
prose here — hand refreshed numbers to `draft_section`.
