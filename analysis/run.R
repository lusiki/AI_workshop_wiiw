#!/usr/bin/env Rscript
# analysis/run.R --------------------------------------------------------------
# One-command reproduction entry point. Equivalent to `targets::tar_make()`,
# with a final verification gate so the pipeline never reports success on a
# manuscript whose numbers were typed by hand.
#
#   Rscript analysis/run.R              # build everything, then verify
#   Rscript analysis/run.R --refresh    # force a fresh Eurostat pull first
#
# Exit code is non-zero if the build or the provenance check fails, so CI and
# the agent's verification step can rely on it.

args <- commandArgs(trailingOnly = TRUE)

if ("--refresh" %in% args) {
  # Invalidate the data target so targets re-pulls from Eurostat.
  source("R/config.R")
  raw_cache <- file.path(PATH_RAW, "gdp_pc_raw.rds")
  if (file.exists(raw_cache)) file.remove(raw_cache)
  try(targets::tar_invalidate(raw), silent = TRUE)
}

message("== Building pipeline (targets::tar_make) ==")
targets::tar_make()

message("== Verifying numeric provenance ==")
source("R/config.R")
source("R/check_provenance.R")
assert_numeric_provenance("paper/working_paper.qmd")

message("== OK: pipeline built and manuscript verified ==")
