# figures.R -------------------------------------------------------------------
# Figures for the working paper. Each function returns a ggplot object; the
# targets pipeline saves them to results/figures. Keep styling in one theme so
# every exhibit matches the wiiw house look.

theme_wiiw <- function(base_size = 11) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      panel.grid.minor = ggplot2::element_blank(),
      plot.title    = ggplot2::element_text(face = "bold"),
      plot.subtitle = ggplot2::element_text(colour = "grey30"),
      plot.caption  = ggplot2::element_text(colour = "grey40", hjust = 0),
      legend.position = "bottom"
    )
}

WIIW_BLUE <- "#00437b"
WIIW_GREY <- "#8c8c8c"

#' Figure 1. Beta-convergence scatter (initial level vs subsequent growth).
fig_convergence <- function(panel, conv_fit) {
  cross <- panel |>
    dplyr::filter(year %in% c(CONV_BASE, SAMPLE_END),
                  geo %in% c(CESEE, CONTROL_EU)) |>
    dplyr::select(geo, year, log_gdp, cesee) |>
    tidyr::pivot_wider(names_from = year, values_from = log_gdp,
                       names_prefix = "y") |>
    dplyr::rename(y0 = paste0("y", CONV_BASE), y1 = paste0("y", SAMPLE_END)) |>
    dplyr::filter(!is.na(y0), !is.na(y1)) |>
    dplyr::mutate(growth = (y1 - y0) / (SAMPLE_END - CONV_BASE))

  ggplot2::ggplot(cross, ggplot2::aes(y0, growth)) +
    ggplot2::geom_smooth(method = "lm", se = TRUE, colour = WIIW_BLUE,
                         fill = "grey85", linewidth = 0.6) +
    ggplot2::geom_point(ggplot2::aes(colour = cesee), size = 2.4) +
    ggplot2::geom_text(ggplot2::aes(label = geo), vjust = -0.9, size = 3,
                       colour = "grey25") +
    ggplot2::scale_colour_manual(
      values = c(`TRUE` = WIIW_BLUE, `FALSE` = WIIW_GREY),
      labels = c(`TRUE` = "CESEE (treated)", `FALSE` = "EU control"),
      name = NULL
    ) +
    ggplot2::labs(
      # Figure number/title is owned by the Quarto fig-cap, not baked into the PNG.
      subtitle = paste0("Real GDP per capita, ", CONV_BASE, "–", SAMPLE_END),
      x = paste0("Log real GDP per capita in ", CONV_BASE),
      y = "Average annual growth",
      caption = "Source: Eurostat nama_10_pc (chain-linked volumes). Author's calculations."
    ) +
    theme_wiiw()
}

#' Figure 2. Event study of EU accession on the convergence gap.
#' This is the figure the live demo refreshes.
fig_event_study <- function(es_dynamic) {
  ggplot2::ggplot(es_dynamic, ggplot2::aes(event_time, estimate)) +
    ggplot2::geom_hline(yintercept = 0, colour = "grey60", linewidth = 0.4) +
    ggplot2::geom_vline(xintercept = -0.5, linetype = "dashed",
                        colour = "grey60", linewidth = 0.4) +
    ggplot2::geom_ribbon(
      ggplot2::aes(ymin = estimate - 1.96 * std_error,
                   ymax = estimate + 1.96 * std_error),
      fill = WIIW_BLUE, alpha = 0.15
    ) +
    ggplot2::geom_line(colour = WIIW_BLUE, linewidth = 0.7) +
    ggplot2::geom_point(colour = WIIW_BLUE, size = 1.8) +
    ggplot2::labs(
      # Figure number/title is owned by the Quarto fig-cap, not baked into the PNG.
      subtitle = "Sun & Abraham (2021) event study; 95% confidence band",
      x = "Years since EU accession",
      y = "Log gap to EU average (relative to year before accession)",
      caption = "Source: Eurostat nama_10_pc. Never-treated EU members as controls."
    ) +
    theme_wiiw()
}

#' Save a ggplot to results/figures as both PDF (print) and PNG (embedding).
#' Returns the PNG path so a targets file-target tracks it and the manuscript
#' embeds it in any output format.
save_figure <- function(plot, name, width = 6.5, height = 4.2) {
  dir.create(PATH_FIGURES, showWarnings = FALSE, recursive = TRUE)
  pdf_path <- file.path(PATH_FIGURES, paste0(name, ".pdf"))
  png_path <- file.path(PATH_FIGURES, paste0(name, ".png"))
  ggplot2::ggsave(pdf_path, plot, width = width, height = height)
  ggplot2::ggsave(png_path, plot, width = width, height = height, dpi = 200)
  png_path
}
