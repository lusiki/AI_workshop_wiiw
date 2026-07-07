---
name: draft_section
description: Update the working paper's prose so it matches the current outputs. Use when results have changed and a results paragraph, figure lead-in, or discussion needs refreshing.
allowed-tools: Read, Edit, Bash(quarto render *)
---

# draft_section

Bring the manuscript back in line with the estimates. House style is in
`.claude/rules/wiiw_style.md` (loaded automatically when you edit the `.qmd`).

1. Read `results/estimates.json` so you know the current numbers.
2. Edit `paper/working_paper.qmd`. Rules that are not optional:
   - Every number in **Results** is an inline `` `r ...` `` reference to the
     `est` object — never a hand-typed literal.
   - Every figure gets a one-sentence lead-in that states its takeaway.
   - Cite only from `paper/references.bib`; never invent a reference.
3. Verify before reporting done:
   ```bash
   quarto render paper/working_paper.qmd
   Rscript -e 'source("R/config.R"); source("R/check_provenance.R"); assert_numeric_provenance()'
   ```
   The render must be clean and the provenance check must pass.
