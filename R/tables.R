# tables.R --------------------------------------------------------------------
# Regression tables via modelsummary. tab_main() is called from inside the
# Quarto chunk so modelsummary renders to whatever format the document targets
# (PDF or HTML); output = "default" lets it detect the knitr context.

#' Main results table: convergence slope + overall accession ATT.
#'
#' The Sun & Abraham fit carries only event-time interaction coefficients, so
#' its object of interest is the aggregated post-accession ATT. We present that
#' ATT (in log points, 100 x the log effect, to match the text) as the
#' event-study column's single coefficient, with its standard error. This is
#' more informative than a bare value, and it is required by newer modelsummary,
#' which refuses to render a model whose displayed coefficients are all omitted.
tab_main <- function(conv_fit, es_fit, output = "default") {
  # Aggregated post-accession ATT (estimate + SE) as a one-coefficient summary.
  # aggregate() dispatches to aggregate.fixest, so fixest must be attached.
  att <- aggregate(es_fit, "att")
  es_summary <- list(
    tidy = data.frame(
      term      = "Post-accession ATT (log points)",
      estimate  = 100 * att[1, "Estimate"],
      std.error = 100 * att[1, "Std. Error"],
      p.value   = att[1, "Pr(>|t|)"]
    ),
    glance = data.frame(nobs = es_fit$nobs)
  )
  class(es_summary) <- "modelsummary_list"

  models <- list(
    "Beta-convergence"           = conv_fit,
    "Accession event study (SA)" = es_summary
  )

  modelsummary::modelsummary(
    models,
    output   = output,
    stars    = c(`*` = .1, `**` = .05, `***` = .01),
    coef_map = c(
      "y0"                              = "Initial log GDP p.c. (beta)",
      "Post-accession ATT (log points)" = "Post-accession ATT (log points)"
    ),
    gof_omit = "AIC|BIC|Log.Lik|RMSE|Std.Errors|R2 Within|R2 Pseudo",
    title    = "Convergence and the accession effect",
    notes    = paste(
      "The event-study column reports the Sun & Abraham (2021)",
      "interaction-weighted specification with country and year fixed effects;",
      "standard errors clustered by country. Post-accession ATT is the",
      "interaction-weighted average effect on the convergence gap, in log points."
    )
  )
}
