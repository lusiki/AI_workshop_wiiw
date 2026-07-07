# data.R ----------------------------------------------------------------------
# Live pull of Eurostat GDP-per-capita and tidying to a country-year panel.
# The pull is LIVE (eurostat API) but every extract is persisted to data/raw so
# the rest of the pipeline is reproducible and runs offline after the first pull.

#' Download the GDP-per-capita slice from Eurostat (live).
#'
#' Pulls a single unit/na_item slice for the CESEE treated countries, the
#' never-treated EU controls, and the EU aggregate. eurostat caches the raw
#' SDMX download; we additionally persist a tidy copy to data/raw.
pull_gdp_raw <- function(refresh = FALSE) {
  raw_path <- file.path(PATH_RAW, "gdp_pc_raw.rds")
  if (!refresh && file.exists(raw_path)) {
    message("Using cached extract at ", raw_path, " (set refresh = TRUE to re-pull).")
    return(readRDS(raw_path))
  }

  message("Pulling ", EUROSTAT_DATASET, " live from Eurostat ...")
  raw <- eurostat::get_eurostat(
    id = EUROSTAT_DATASET,
    filters = list(
      na_item = GDP_NA_ITEM,
      unit    = GDP_UNIT,
      geo     = c(CESEE, CONTROL_EU, EU_AGGREGATE)
    ),
    time_format = "num",
    cache = TRUE
  )

  # eurostat >= 4.0 returns TIME_PERIOD / upper-case dims; normalise defensively.
  raw <- dplyr::rename_with(raw, tolower)
  if ("time_period" %in% names(raw)) raw <- dplyr::rename(raw, time = time_period)

  raw <- dplyr::transmute(
    raw,
    geo    = as.character(geo),
    time   = as.integer(time),
    values = as.numeric(values)
  )

  dir.create(PATH_RAW, showWarnings = FALSE, recursive = TRUE)
  saveRDS(raw, raw_path)
  # Provenance stamp: what was pulled, and which unit (guards the price-basis bug).
  writeLines(
    c(
      paste0("dataset: ", EUROSTAT_DATASET),
      paste0("na_item: ", GDP_NA_ITEM),
      paste0("unit: ",    GDP_UNIT),
      paste0("n_rows: ",  nrow(raw)),
      paste0("years: ",   min(raw$time), "-", max(raw$time))
    ),
    file.path(PATH_RAW, "gdp_pc_raw.manifest.txt")
  )
  raw
}

#' Build the country-year analysis panel from the raw extract.
#'
#' Outcome of interest is the convergence gap: log real GDP p.c. of a country
#' minus log real GDP p.c. of the EU aggregate. Common EU trends are then also
#' absorbed by year fixed effects downstream, but the gap makes the object of
#' study explicit.
build_panel <- function(raw) {
  eu <- raw |>
    dplyr::filter(geo == EU_AGGREGATE) |>
    dplyr::select(time, eu_gdp = values)

  raw |>
    dplyr::filter(
      geo %in% c(CESEE, CONTROL_EU),
      time >= SAMPLE_START, time <= SAMPLE_END,
      !is.na(values), values > 0
    ) |>
    dplyr::left_join(eu, by = "time") |>
    dplyr::transmute(
      geo,
      year       = time,
      gdp_pc     = values,
      log_gdp    = log(values),
      rel_gap    = log(values) - log(eu_gdp),
      cohort     = accession_year(geo),
      treated    = accession_year(geo) != NEVER_TREATED_COHORT,
      cesee      = geo %in% CESEE,
      event_time = ifelse(geo %in% CESEE, time - accession_year(geo), NA_integer_)
    ) |>
    dplyr::arrange(geo, year)
}
