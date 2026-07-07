# tables.R --------------------------------------------------------------------
# Regression tables via modelsummary. tab_main() is called from inside the
# Quarto chunk so modelsummary renders to whatever format the document targets
# (PDF or HTML); output = "default" lets it detect the knitr context.

#' Main results table: convergence slope + overall accession ATT.
#'
#' The Sun & Abraham fit has only event-time interaction coefficients, so the
#' aggregated post-accession ATT is added as an explicit row -- otherwise the
#' event-study column would show no estimate and the manuscript's "(Table 1)"
#' pointer to the accession effect would be unsupported.
tab_main <- function(conv_fit, es_fit, output = "default") {
  models <- list(
    "Beta-convergence"            = conv_fit,
    "Accession event study (SA)"  = es_fit
  )

  att <- event_study_att(es_fit)
  att_row <- data.frame(
    term                         = "Post-accession ATT (log points)",
    "Beta-convergence"           = "",
    # Reported in log points (100 x the log effect) to match the figure quoted
    # in the text, so the manuscript's "(Table 1)" pointer resolves exactly.
    "Accession event study (SA)" = formatC(100 * att, format = "f", digits = 1),
    check.names = FALSE
  )
  attr(att_row, "position") <- 3

  modelsummary::modelsummary(
    models,
    output   = output,
    stars    = c(`*` = .1, `**` = .05, `***` = .01),
    coef_map = c("y0" = "Initial log GDP p.c. (beta)"),
    gof_omit = "AIC|BIC|Log.Lik|RMSE|Std.Errors|R2 Within|R2 Pseudo",
    add_rows = att_row,
    title    = "Convergence and the accession effect",
    notes    = paste(
      "The event-study column reports the Sun & Abraham (2021)",
      "interaction-weighted specification with country and year fixed effects;",
      "standard errors clustered by country. Post-accession ATT is the",
      "interaction-weighted average effect on the convergence gap, in log points."
    )
  )
}
