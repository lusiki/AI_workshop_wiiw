---
name: data_pull
description: Refresh the live Eurostat GDP-per-capita extract that feeds the pipeline. Use when asked to update, refresh, or re-pull the data, or to extend the sample to a new end year.
allowed-tools: Bash(Rscript *), Read, Edit
---

# data_pull

Refresh the data behind the analysis. Plan first, then:

1. **If extending the sample**, edit only `SAMPLE_END` (and, if needed,
   `SAMPLE_START`) in `R/config.R`. Change nothing else there.
2. Re-pull and rebuild the data target:
   ```bash
   Rscript analysis/run.R --refresh
   ```
   This deletes the cached extract, pulls `nama_10_pc` live from Eurostat, and
   re-runs everything downstream.
3. **Verify the pull**: read `data/raw/gdp_pc_raw.manifest.txt` and confirm the
   `unit` is a chain-linked-volume code (`CLV...`) and the year range covers the
   new `SAMPLE_END`. A `CP_...` unit is the current-prices bug — stop and fix
   `GDP_UNIT`.

Never touch files under `data/restricted/` and never print restricted data.
Do not edit manuscript prose here — that is `draft_section`.
