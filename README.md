# wiiw_agentic_pipeline

[![publish](https://github.com/lusiki/AI_workshop_wiiw/actions/workflows/publish.yml/badge.svg)](https://github.com/lusiki/AI_workshop_wiiw/actions/workflows/publish.yml)

### 📊 The seminar presentation

<a href="https://lusiki.github.io/AI_workshop_wiiw/slides.html" title="Open the HTML slides"><img src="assets/qr-slides.png" alt="QR code linking to the HTML presentation" width="150" align="right"></a>

- **▶ [Slides — HTML presentation](https://lusiki.github.io/AI_workshop_wiiw/slides.html)** (reveal.js; arrow keys to navigate) — or scan the QR →
- **⬇ [Slides — PDF](https://lusiki.github.io/AI_workshop_wiiw/slides.pdf)** (printable fallback)
- **📄 [Working paper — HTML](https://lusiki.github.io/AI_workshop_wiiw/working_paper.html)** (rendered live from Eurostat by the pipeline)
- 📚 [Reading list — all 15 papers, with verified notes](reading/PAPERS.md)
- ▤ [One-page handout](https://lusiki.github.io/AI_workshop_wiiw/handout.html) · 🏠 [landing page](https://lusiki.github.io/AI_workshop_wiiw/)

<sub>Hosted on GitHub Pages via the `publish` workflow. The QR code points to the hosted HTML deck. Links go live after Pages is enabled (**Settings → Pages → Source: GitHub Actions**) and the first deploy succeeds.</sub>

---

A **minimal** agentic pipeline for wiiw working-paper production: the smallest
set of components that makes delegating research work to an AI coding agent
(Claude Code) both safe and productive. It ships a real, reproducible analysis —
income convergence in the eleven CESEE EU members since accession — so the
workflow, not the economics, is the point.

The five components, and the failure each one prevents:

| Component | Where | Prevents |
|-----------|-------|----------|
| **Context** | `CLAUDE.md`, `.claude/rules/` | the agent reverting to generic defaults |
| **Plan gate** | plan-first workflow (see the starter prompt) | solving the wrong problem fast |
| **Permissions** | `.claude/settings.json` | an autonomous process touching anything it likes |
| **Verification** | `.claude/rules/verification.md`, `replication_check`, `tests/` | confident nonsense reaching the paper |
| **Git** | small reviewable commits | repeated mistakes and unrecoverable states |

## Prerequisites

- **R** ≥ 4.2 and **Quarto** ≥ 1.4
- **LaTeX** only if you want PDF output (`quarto install tinytex`); the paper renders to self-contained HTML without it
- **git**
- **Node.js** ≥ 18 (only to install Claude Code)
- Claude Code: `npm install -g @anthropic-ai/claude-code` (see the official docs)

No GPU and no special hardware: the model runs in the cloud, the analysis runs
on any laptop.

## Setup in five steps

```bash
# 1. Clone
git clone <your-fork-url> wiiw_agentic_pipeline
cd wiiw_agentic_pipeline

# 2. Restore the R environment (installs pinned packages via renv)
Rscript setup.R

# 3. Build the pipeline live from Eurostat (first run pulls and caches data)
Rscript analysis/run.R

# 4. Open the rendered paper
#    -> paper/working_paper.html

# 5. Start the agent and paste the starter prompt below
claude
```

If step 3 succeeds you will see `== OK: pipeline built and manuscript verified ==`.

## The starter prompt

Paste this into Claude Code on your first session; fill the brackets.

> I am starting to work on **[PROJECT NAME]** in this repository. **[Two
> sentences on the paper, the data, and the tools — e.g. Eurostat panel data
> analysed in R with fixest and a Quarto manuscript.]** I want our collaboration
> to be structured and rigorous even when that takes longer. Please read
> `CLAUDE.md` and the configuration in `.claude/`, then propose updates that fit
> my project. Use the plan-first workflow for every nontrivial task. Once I
> approve a plan, proceed autonomously and return to me only for decisions or
> ambiguity. Verify every output by rendering or testing before reporting it
> complete. For our first sessions, check in more often so I can learn how the
> workflow behaves.

A good first request to try: *"Extend the convergence sample through 2025,
refresh Figure 2, rerun the event study, and update the results paragraph —
planning first."*

## Reproduction

One command rebuilds everything (`targets` only recomputes what changed):

```bash
Rscript analysis/run.R          # or: Rscript -e 'targets::tar_make()'
Rscript analysis/run.R --refresh  # force a fresh Eurostat pull first
```

## Layout (AEA data-editor style)

```
CLAUDE.md              project constitution the agent reads each session
.claude/               agent configuration
  settings.json        permission allowlist (Rscript, quarto, read-only git)
  rules/               path-scoped rules (load when you touch matching files)
  skills/              data_pull, analysis, draft_section, referee, replication_check
  agents/              econometrics-reviewer, prose-reviewer, verifier
R/                     functions; all constants in R/config.R
_targets.R             the pipeline
analysis/run.R         one-command entry point + verification gate
paper/                 working_paper.qmd, references.bib
results/               estimates.json, figures/  (generated)
data/raw/              source extracts (reproducible pulls)
data/derived/          reproducible from raw
data/restricted/       read-denied; restricted microdata never enters a prompt
tests/testthat/        schema, tolerance, and numeric-provenance checks
demo/                  planted-bug scripts + the minute-by-minute RUNBOOK.md
slides/                reveal.js deck (slides.qmd) + theme + SCRIPT.md delivery script
handout/               one-page print-ready handout (handout.html)
reading/               PAPERS.md — verified notes on the 15 reading-list papers
assets/                shared design assets (loop-diagram.svg)
setup.R  renv.lock     pinned R environment
```

## Seminar materials

The repo doubles as the seminar's presentation kit — same wiiw visual system
(blue `#00437b`, amber accents) across the slides, the handout, and the paper's
figures.

| Material | File | Render / view |
|----------|------|---------------|
| Slides (~20, reveal.js) | [slides/slides.qmd](slides/slides.qmd) | `quarto render slides/slides.qmd` → self-contained `slides.html` |
| Working paper | [paper/working_paper.qmd](paper/working_paper.qmd) | `Rscript analysis/run.R` → self-contained `working_paper.html` · [hosted](https://lusiki.github.io/AI_workshop_wiiw/working_paper.html) |
| Full-hour delivery script | [slides/SCRIPT.md](slides/SCRIPT.md) | what to do, show and say, slide by slide — timing spine, transitions, Q&A prep |
| One-page handout | [handout/handout.html](handout/handout.html) | open in a browser; print to PDF (landscape A4, one page) |
| Demo run-book | [demo/RUNBOOK.md](demo/RUNBOOK.md) | minute-by-minute script, planted-bug rehearsal, 60-second fallback |
| Reading notes | [reading/PAPERS.md](reading/PAPERS.md) | the 15 reading-list papers, each summarized as if read — verified against sources |
| Loop diagram | [assets/loop-diagram.svg](assets/loop-diagram.svg) | shared by the slides and the handout |

Pricing figures in the slides and handout were checked against current Claude
pricing; **re-verify at claude.com/pricing the week of the talk** (the deck and
handout both carry that reminder).

### Hosted site (GitHub Pages)

[.github/workflows/publish.yml](.github/workflows/publish.yml) renders the slides
(and, best-effort, the working paper) and publishes them on every push to `main`.
The `slides` job is Quarto-only and fast; the `paper` job runs the full R pipeline
against live Eurostat data and is `continue-on-error`, so it never blocks the
slides + handout from going out. A [decktape](https://github.com/astefanutti/decktape)
step also exports the deck to `slides.pdf` as a printable fallback.

**One-time setup:** in the repo, **Settings → Pages → Source → "GitHub Actions"**.
After that the site is served at **https://lusiki.github.io/AI_workshop_wiiw/**
(landing page → slides, handout, slide PDF, working paper). Until Pages is enabled
the deploy step fails while the slides/paper still build as artifacts.

## Data availability

All data are **public**. Real GDP per capita (chain-linked volumes,
`CLV10_EUR_HAB`; item `B1GQ`) come from Eurostat table **`nama_10_pc`**, pulled
live via the `eurostat` R package and cached under `data/raw/`. No restricted or
confidential microdata are used. The manifest written at
`data/raw/gdp_pc_raw.manifest.txt` records exactly what was pulled.

## Software, seeds, and provenance

- Package versions are pinned in `renv.lock`; `setup.R` restores them.
- The only random seed is `SEED` in `R/config.R`.
- **Every exhibit maps to the code that generates it:**

  | Exhibit | Function | Target |
  |---------|----------|--------|
  | Figure 1 (convergence) | `R/figures.R::fig_convergence` | `fig1_file` |
  | Figure 2 (event study) | `R/figures.R::fig_event_study` | `fig2_file` |
  | Table 1 | `R/tables.R::tab_main` | built in the `.qmd` from `conv_fit`, `es_fit` |
  | Numbers in the text | `R/provenance.R::collect_estimates` | `results/estimates.json` |

Because every number in the Results section is an inline reference to
`estimates.json`, the text can never silently drift from the tables — the rule
`replication_check` and `tests/testthat/test-provenance.R` enforce.

## Data governance

Restricted inputs never enter a prompt: they live under `data/restricted/`,
which `.claude/settings.json` denies the agent from reading. The agent
orchestrates an analysis whose sensitive inputs it never sees. For institutional
work prefer Team / Enterprise / API access and review current commercial terms
on training-data use before onboarding; pin the tool version in shared config so
a release cannot silently change behaviour mid-project.

## The seminar demo

The repo ships clean (a cold clone builds and tests pass). `demo/plant_bug.R`
injects a hand-typed number that the verification loop then catches; see
[demo/PLANTED_BUG.md](demo/PLANTED_BUG.md). `demo/reset_demo.R` restores it.

## License

Code MIT; prose CC-BY-4.0 (template placeholder — set your institute's policy).
