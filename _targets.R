# _targets.R ------------------------------------------------------------------
# The reproducible pipeline. One command runs everything:
#
#     targets::tar_make()
#
# targets tracks dependencies, so re-running only rebuilds what changed. This is
# what makes the agentic demo safe: when the agent extends the sample it can run
# tar_make() and targets recomputes exactly the downstream targets that depend
# on the change, then re-renders the manuscript -- nothing more, nothing less.

library(targets)
library(tarchetypes)

tar_option_set(
  packages = c(
    "dplyr", "tidyr", "tibble", "eurostat", "fixest",
    "modelsummary", "gt", "ggplot2", "jsonlite"
  ),
  format = "rds"
)

# Load all project functions and constants.
invisible(lapply(list.files("R", pattern = "[.][Rr]$", full.names = TRUE), source))

list(
  # --- data --------------------------------------------------------------
  tar_target(raw,   pull_gdp_raw(refresh = FALSE)),
  tar_target(panel, build_panel(raw)),

  # --- estimation --------------------------------------------------------
  tar_target(conv_fit,   fit_convergence(panel)),
  tar_target(es_fit,     fit_event_study(panel)),
  tar_target(es_dynamic, tidy_event_study(es_fit)),

  # --- numeric provenance ------------------------------------------------
  tar_target(estimates,      collect_estimates(panel, conv_fit, es_fit, es_dynamic)),
  tar_target(estimates_file, write_estimates(estimates), format = "file"),

  # --- exhibits ----------------------------------------------------------
  tar_target(fig1,      fig_convergence(panel, conv_fit)),
  tar_target(fig1_file, save_figure(fig1, "fig1_convergence"), format = "file"),
  tar_target(fig2,      fig_event_study(es_dynamic)),
  tar_target(fig2_file, save_figure(fig2, "fig2_event_study"), format = "file"),

  # --- manuscript --------------------------------------------------------
  # Table 1 is built inside the .qmd from conv_fit/es_fit so modelsummary
  # renders to the document's own output format.
  # tar_quarto scans the .qmd for tar_read()/tar_load() and wires the
  # dependencies automatically, so the paper re-renders when estimates or
  # figures change.
  tar_quarto(paper, path = "paper/working_paper.qmd")
)
