---
name: replication_check
description: The verification gate. Reproduce gold-standard numbers within tolerance and confirm numeric provenance before any analysis or manuscript task is reported complete. This is the check that catches the seminar's planted bug.
allowed-tools: Bash(Rscript *), Read
---

# replication_check

The last gate before "done". Run it and report the result honestly.

1. **Numeric provenance** — no hand-typed numbers in the manuscript:
   ```bash
   Rscript -e 'source("R/config.R"); source("R/check_provenance.R"); print(check_numeric_provenance())'
   ```
   `ok = TRUE` passes. Any `offenders` are literals that must become inline
   `` `r ...` `` references to `results/estimates.json`.
2. **Full gate** — build and verify in one shot:
   ```bash
   Rscript analysis/run.R
   ```
   Non-zero exit means the build or provenance check failed; do not report done.
3. **Replication-first** — if gold-standard numbers are recorded (e.g. from a
   prior version), confirm the rebuilt `results/estimates.json` matches them
   within `PROVENANCE_TOL` before accepting any extension.

Report exactly what passed and what failed. If a check fails, hand back to
`draft_section` (for a prose/provenance issue) or `analysis` (for a numbers
issue), fix, and re-run this skill — loop until it is clean.
