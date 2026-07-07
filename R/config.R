# config.R --------------------------------------------------------------------
# Single source of truth for the analysis: samples, codes, paths, seed.
# Keep this file small. If a constant is used in more than one script, it lives
# here so the agent and the human read the same definitions.

# Reproducibility -------------------------------------------------------------
SEED <- 20240501L

# Eurostat source -------------------------------------------------------------
# nama_10_pc = GDP and main components per capita.
# na_item B1GQ = Gross domestic product at market prices.
# GDP_UNIT selects the price basis. This MUST be a constant-price / volume
# measure. Current prices (CP_EUR_HAB) confound real convergence with inflation
# and exchange-rate movements -- see demo/PLANTED_BUG.md for the current-prices
# variant of the planted bug.
EUROSTAT_DATASET <- "nama_10_pc"
GDP_NA_ITEM      <- "B1GQ"
GDP_UNIT         <- "CLV10_EUR_HAB"  # Chain-linked volumes (2010), EUR per capita
EU_AGGREGATE     <- "EU27_2020"      # reference aggregate for the convergence gap

# Analysis window -------------------------------------------------------------
# SAMPLE_END is the parameter the demo moves: it ships at 2023 and the live demo
# extends it toward 2025, forcing a genuine recompute of the event study, Figure
# 2, and the results paragraph.
SAMPLE_START <- 1995L
SAMPLE_END   <- 2023L
# Base year for the cross-sectional beta-convergence regression (EU-accession
# baseline). All sample countries have data from this year.
CONV_BASE    <- 2004L

# Country groups (Eurostat 2-letter geo codes) --------------------------------
# CESEE EU members, grouped by EU accession wave -- the staggered treatment.
ACCESSION_2004 <- c("CZ", "EE", "HU", "LV", "LT", "PL", "SK", "SI")
ACCESSION_2007 <- c("BG", "RO")
ACCESSION_2013 <- c("HR")
CESEE <- c(ACCESSION_2004, ACCESSION_2007, ACCESSION_2013)

# Never-treated controls: long-standing members, always in the EU across the
# window, so they trace the common European trajectory. UK excluded (left 2020).
CONTROL_EU <- c("AT", "BE", "DE", "DK", "ES", "FI",
                "FR", "IE", "IT", "LU", "NL", "PT", "SE", "EL")

# sunab() reference cohort for never-treated units. Any value outside the
# observed years works; fixest treats it as "never treated".
NEVER_TREATED_COHORT <- 10000L

# Map every country to its accession cohort (NEVER_TREATED_COHORT for controls).
accession_year <- function(geo) {
  dplyr::case_when(
    geo %in% ACCESSION_2004 ~ 2004L,
    geo %in% ACCESSION_2007 ~ 2007L,
    geo %in% ACCESSION_2013 ~ 2013L,
    geo %in% CONTROL_EU     ~ NEVER_TREATED_COHORT,
    TRUE                    ~ NA_integer_
  )
}

# Paths -----------------------------------------------------------------------
PATH_RAW       <- "data/raw"
PATH_DERIVED   <- "data/derived"
PATH_RESULTS   <- "results"
PATH_FIGURES   <- file.path(PATH_RESULTS, "figures")
ESTIMATES_JSON <- file.path(PATH_RESULTS, "estimates.json")

# Provenance tolerance: numbers in the manuscript must match estimates.json to
# this absolute tolerance (see replication_check).
PROVENANCE_TOL <- 0.05
