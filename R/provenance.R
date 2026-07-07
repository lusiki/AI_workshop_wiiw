# provenance.R ----------------------------------------------------------------
# Numeric provenance: every number quoted in the manuscript is derived here and
# written to results/estimates.json. The Quarto document reads that file and
# inlines the numbers, so a figure in the text can never silently drift from the
# estimate that produced it. replication_check enforces this.

#' Assemble the named estimates that the manuscript is allowed to cite.
collect_estimates <- function(panel, conv_fit, es_fit, es_dynamic) {
  five_yr <- es_dynamic |> dplyr::filter(event_time == 5L)
  ten_yr  <- es_dynamic |> dplyr::filter(event_time == 10L)

  list(
    sample_start        = SAMPLE_START,
    sample_end          = SAMPLE_END,
    n_cesee             = length(CESEE),
    n_control           = length(CONTROL_EU),
    gdp_unit            = GDP_UNIT,
    beta_coef           = unname(stats::coef(conv_fit)[["y0"]]),
    beta_se             = unname(sqrt(diag(stats::vcov(conv_fit)))[["y0"]]),
    accession_att       = event_study_att(es_fit),
    accession_effect_5y = if (nrow(five_yr)) five_yr$estimate[[1]] else NA_real_,
    accession_effect_10y = if (nrow(ten_yr)) ten_yr$estimate[[1]] else NA_real_,
    generated_from      = "targets pipeline (analysis/run.R)"
  )
}

#' Write estimates to results/estimates.json.
write_estimates <- function(estimates) {
  dir.create(PATH_RESULTS, showWarnings = FALSE, recursive = TRUE)
  jsonlite::write_json(estimates, ESTIMATES_JSON, auto_unbox = TRUE,
                       pretty = TRUE, digits = 6)
  ESTIMATES_JSON
}

#' Read estimates back (used by the manuscript and by replication_check).
read_estimates <- function(path = ESTIMATES_JSON) {
  jsonlite::read_json(path, simplifyVector = TRUE)
}

# Formatting helpers used inline in the manuscript -----------------------------

#' Format a log-point effect as a signed percentage-ish string, e.g. "+11.3".
fmt_lp <- function(x, digits = 1) {
  sprintf("%+.*f", digits, 100 * x)
}

#' Format a plain coefficient.
fmt_num <- function(x, digits = 3) {
  formatC(x, format = "f", digits = digits)
}
