---
paths:
  - "**/*.R"
  - "**/*.r"
  - "**/*.qmd"
---

# R coding conventions

These load whenever you touch R code or a Quarto document. Follow them.

## Structure
- Functions live in `R/`; the pipeline lives in `_targets.R`; entry point is
  `analysis/run.R`. Do not put analysis logic in the manuscript — the `.qmd`
  only *reads* results via `targets::tar_read()`.
- Every constant that is used more than once lives in `R/config.R`. Never
  hard-code a country list, year, dataset code, or path elsewhere.
- Sourcing an `R/` file must have **no side effects** — define functions only,
  run nothing at source time.

## Style
- Namespace external calls explicitly (`dplyr::filter`, `fixest::feols`). The
  only packages you may attach are those declared in `_targets.R`.
- snake_case for objects and functions; the base pipe `|>`; 2-space indent.
- Set seeds from `SEED` in `R/config.R`; never call `set.seed()` with a literal.

## Data
- The price basis is `GDP_UNIT` (chain-linked volumes). Do **not** switch to
  current prices — it confounds real convergence with inflation. `test-config.R`
  guards this.
- Restricted or confidential microdata never enter a prompt or a chunk output.
  Such files live under `data/restricted/` (read-denied in `settings.json`); the
  agent orchestrates analysis whose sensitive inputs it never sees.
- `data/derived/` must be fully reproducible from `data/raw/`. Never edit
  derived data by hand.

## Estimation
- Prefer `fixest`. For staggered designs use `sunab()`; the Callaway &
  Sant'Anna alternative is `fit_event_study_did()`.
- No machine-generated or model-labelled variable enters a regression without a
  human-labelled validation subsample. There is none in this template; if you
  add one, add the validation set too.
