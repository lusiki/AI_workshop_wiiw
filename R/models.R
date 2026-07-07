# models.R --------------------------------------------------------------------
# Two estimates: (1) cross-sectional beta-convergence, (2) a staggered event
# study of EU accession on the convergence gap, using Sun & Abraham (2021) via
# fixest::sunab. The did package (Callaway & Sant'Anna 2021) is an available
# alternative; see fit_event_study_did() below.

#' Cross-sectional beta-convergence regression.
#'
#' Average annual growth of real GDP p.c. between CONV_BASE and SAMPLE_END,
#' regressed on the initial log level. A negative slope is beta-convergence.
fit_convergence <- function(panel) {
  cross <- panel |>
    dplyr::filter(year %in% c(CONV_BASE, SAMPLE_END),
                  geo %in% c(CESEE, CONTROL_EU)) |>
    dplyr::select(geo, year, log_gdp, cesee) |>
    tidyr::pivot_wider(names_from = year, values_from = log_gdp,
                       names_prefix = "y") |>
    dplyr::rename(y0 = paste0("y", CONV_BASE), y1 = paste0("y", SAMPLE_END)) |>
    dplyr::filter(!is.na(y0), !is.na(y1)) |>
    dplyr::mutate(growth = (y1 - y0) / (SAMPLE_END - CONV_BASE))

  fixest::feols(growth ~ y0, data = cross, vcov = "hetero")
}

#' Staggered event study of EU accession on the convergence gap.
#'
#' Sun & Abraham interaction-weighted estimator. Never-treated EU controls
#' (cohort = NEVER_TREATED_COHORT) are the clean comparison group.
fit_event_study <- function(panel) {
  es <- panel |>
    dplyr::filter(year >= SAMPLE_START, year <= SAMPLE_END)

  fixest::feols(
    rel_gap ~ sunab(cohort, year) | geo + year,
    data = es, cluster = ~geo
  )
}

#' Extract Sun & Abraham event-time (dynamic) effects as a tidy tibble.
#'
#' aggregate() dispatches to aggregate.fixest, which re-weights the cohort x
#' period interactions into average effects by event time (years since accession).
tidy_event_study <- function(res_sa) {
  # NB: aggregate.fixest is an S3 method for the stats generic; call it via
  # dispatch (fixest is attached at build time), not fixest::aggregate (not exported).
  agg <- aggregate(res_sa, "year::(-?[[:digit:]]+)")
  tibble::tibble(
    event_time = as.integer(rownames(agg)),
    estimate   = agg[, "Estimate"],
    std_error  = agg[, "Std. Error"]
  ) |>
    dplyr::arrange(event_time)
}

#' Overall post-accession ATT on the convergence gap (single number).
event_study_att <- function(res_sa) {
  att <- aggregate(res_sa, "att")
  unname(att[1, "Estimate"])
}

#' Alternative estimator: Callaway & Sant'Anna (2021) via the did package.
#'
#' Not part of the default pipeline; kept so the econometrics reviewer and
#' curious attendees can cross-check the fixest result against a second method.
fit_event_study_did <- function(panel) {
  d <- panel |>
    dplyr::mutate(
      id = as.integer(factor(geo)),
      first_treat = ifelse(cohort == NEVER_TREATED_COHORT, 0L, cohort)
    )
  did::att_gt(
    yname = "rel_gap", tname = "year", idname = "id",
    gname = "first_treat", data = as.data.frame(d),
    control_group = "notyettreated", allow_unbalanced_panel = TRUE
  )
}
