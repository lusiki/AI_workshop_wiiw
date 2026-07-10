# The reading list, actually read

Notes on the fifteen works behind the seminar *"AI in Economics Research: From Frontier Ideas
to a Working Agentic Pipeline."* Each note covers where the paper comes from, what it actually
does, what it finds, and why the seminar leans on it — enough that you can discuss the paper
credibly without having read it, and know exactly what to expect when you do.

Every note was verified against the published version or working paper (full text wherever
accessible) as of **2026-07-08** — bibliographic identities, venues, and all quoted numbers.
Where something could not be verified past a paywall, the note says so. Two entries needed
correcting relative to the shorthand on the slides: "Korinek (2025)" is NBER WP 34202 (the
September 2025 update, not the 2024 one), and "Sant'Anna (2026)" is not a paper at all — see
its note.

| # | Work | Seminar role |
|---|------|--------------|
| 1 | Chatterji et al. (2025) — How People Use ChatGPT | Hook — adoption at scale |
| 2 | Brynjolfsson, Li & Raymond (2025) — Generative AI at Work | Hook — causal microevidence; Part 5 division of labour |
| 3 | Korinek (2023) — Generative AI for Economic Research | Lens A — founding taxonomy |
| 4 | Korinek (2025) — AI Agents for Economic Research | Lens A — chatbots → agents |
| 5 | Dell (2025) — Deep Learning for Economists | Lens A — data creation |
| 6 | Bahoo et al. (2025) — AI in Economics Research | Lens A — the adoption map |
| 7 | Sant'Anna (2026) — Claude Code Academic Workflow | Lens A / Part 2 — the practitioner manual |
| 8 | Ludwig, Mullainathan & Rambachan (2025/26) — LLMs: An Applied Econometric Framework | Lens B — the discipline paper |
| 9 | Athey, Keleher & Spiess (2025) — ML Who to Nudge | Lens B — causal vs predictive targeting |
| 10 | Gavrilova, Langørgen & Zoutman (2025) — DiD Causal Forests | Lens B — forests inside a design |
| 11 | Chen, Cheng, Liu & Tang (2026) — Teaching Economics to the Machines | Lens B — theory-guided transfer learning |
| 12 | Acemoglu (2025) — The Simple Macroeconomics of AI | Lens C — the sober benchmark |
| 13 | Jones (2026) — A.I. and Our Economic Future | Lens C — weak links vs acceleration |
| 14 | Brynjolfsson, Korinek & Agrawal (2025/26) — A Research Agenda for the Economics of Transformative AI | Lens C — the agenda |
| 15 | Mullainathan (2025) — Economics in the Age of Algorithms | Bridge — the profession in the treatment group |

---

## Hook

### 1 · Chatterji et al. (2025) — "How People Use ChatGPT"

*Aaron Chatterji, Tom Cunningham, David Deming, Zoë Hitzig, Christopher Ong, Carl Yan Shan,
Kevin Wadman. NBER Working Paper 34255, September 2025. An OpenAI–Harvard collaboration
(Chatterji is OpenAI's chief economist; Deming is the academic anchor).*

**Where it comes from.** By mid-2025 roughly a tenth of the world's adult population was using
ChatGPT, yet everything known about *how* came from small surveys and self-reports. The authors
— sitting on the actual usage logs — set out to write the first population-scale description of
what people do with a frontier chatbot, framing its economic value in two parts: customized
digital output (writing, code) and *decision support*, the advice-and-judgment help that matters
most in knowledge-intensive work and home production.

**What it does.** The core data are about 1.1 million conversations sampled from consumer plans
(Free/Plus/Pro — enterprise and API traffic excluded) between May 2024 and July 2025, classified
entirely by automated LLM pipelines inside a privacy "clean room": no human reads any message.
Conversations are tagged by topic (24 categories), by a three-way intent taxonomy — **Asking**
(seeking information/advice), **Doing** (producing output), **Expressing** — by work vs
non-work, and by imputed demographics.

**What it finds.** By July 2025: ~700 million weekly active users sending over 2.5 billion
messages a day. The non-work share rose from 53% to ~73% in one year — adoption is running
fastest *outside* the office, though work use also grew in absolute terms. Asking is ~49% of
messages and growing, Doing ~40%, Expressing ~11%. Three topics — practical guidance, seeking
information, writing — cover nearly 80% of use; writing dominates work usage (~40% of work
messages), and about two-thirds of writing requests *edit user-supplied text* rather than
generate from scratch. Programming is a small slice (~4%), companionship smaller still. The
early gender gap (~80% typically-masculine first names) closed by mid-2025, and growth is
fastest in low- and middle-income countries.

**Why it's in the seminar.** This is the hook's diffusion evidence: the technology is already
inside everyday work and life at population scale, so an institute's only real choice is
*deliberate versus accidental* adoption. The "Asking beats Doing" result also foreshadows the
seminar's framing — the model's highest-rated value is advice and judgment support, which is
exactly the mode a disciplined research pipeline exploits. Caveat to keep in mind: consumer
plans only, so institutional work usage is understated by construction.

### 2 · Brynjolfsson, Li & Raymond (2025) — "Generative AI at Work"

*Erik Brynjolfsson, Danielle Li, Lindsey Raymond. Quarterly Journal of Economics 140(2),
pp. 889–942, May 2025. First circulated as NBER WP 31161, April 2023.*

**Where it comes from.** When ChatGPT landed, evidence on generative AI and productivity was
lab experiments and anecdote. The authors got something rarer: a real firm's staggered
deployment of an AI assistant to its customer-support operation — the first credible
field-setting estimate of what these tools do to actual jobs.

**What it does.** The setting is 5,172 customer-support agents at a Fortune 500 software firm,
most working from the Philippines. The tool, built on OpenAI's GPT family, watches live chats
and suggests responses and documentation links; agents may ignore or edit it. Rollout timing
was driven by training-session capacity — effectively arbitrary from the agent's perspective —
giving a staggered difference-in-differences design estimated with modern heterogeneity-robust
event-study methods (Sun–Abraham, with Callaway–Sant'Anna and others as robustness). The same
estimators, incidentally, that this repo's pipeline uses.

**What it finds.** Average productivity (issues resolved per hour) rises **15%**: shorter
handle times, more concurrent chats, a slightly higher resolution rate. The distribution is the
story: the newest, least-skilled agents gain ~30%, while the most experienced gain little speed
and even lose a bit of quality — the skill distribution *compresses from both ends*. A treated
agent with two months of tenure performs like an untreated agent with over six. The mechanism
is best-practice diffusion: the model has effectively bottled what top performers do, and — as
software-outage episodes show — treated workers keep part of the gain even when the tool is
down. They learned. Customers are also happier (sentiment up ~half a standard deviation,
escalations to managers down ~25%), and attrition falls most for new agents.

**Why it's in the seminar.** Twice load-bearing. In the hook, it is the canonical causal
microevidence that the tools raise the floor faster than the ceiling. In Part 5, its converse
carries the closing argument: if novices gain the most generative capacity, then experienced
judgment — review, verification, taste — becomes the scarce input, and senior researchers
matter *more*, not less. The authors' own caveat: one tool, one firm, one occupation, with a
stable product; in fast-moving settings the same mechanism could propagate outdated practice.

---

## Lens A — AI as a tool

### 3 · Korinek (2023) — "Generative AI for Economic Research: Use Cases and Implications for Economists"

*Anton Korinek. Journal of Economic Literature 61(4), pp. 1281–1317, December 2023. Earlier as
NBER WP 30957 (February 2023).*

**Where it comes from.** Written in the months after ChatGPT's release, when economists mostly
either dismissed the models over blatant errors or credulously over-trusted their authoritative
tone. Korinek opens with exactly that double warning — it is "easy—and dangerous—" to do either
— and grounds the piece in a frame economists own: Ricardian comparative advantage. Generative
AI increasingly has the advantage in *generating* content; humans keep it (for now) in
*evaluating* content and organizing the research.

**What it does.** A demonstration-based user's guide, not an empirical paper. After a compact
technical primer (including scaling laws and emergent capabilities that "surprise the creators"),
it walks through **six use-case areas** — ideation and feedback, writing, background research,
coding, data analysis, mathematical derivations — with 25 concrete tasks, each shown via live
chat transcripts and graded on a three-tier scale: experimental ○, useful ◐, highly useful ●.
The tiers are defined by how much human oversight the output needs — which is why the seminar
compresses the paper into one variable, *verification cost*.

**What it finds.** As of late 2023: brainstorming, editing, summarizing, translating code, and
extracting data from text were already ● ("incorporating this into your workflow will save you
time"); literature research was ○ — the models "hallucinate and generate authoritative-sounding
papers that do not actually exist" — and so were mathematical derivations. The punchline
economics: even if one brainstormed idea in twenty is useful, the exercise pays, because
generation is nearly free. The paper closes with the long-run needle: human oversight per task
will shrink until "we simply rubber-stamp the output," and eventually "our AI research
assistants may graduate and become researchers of their own. The experience will be deflating."

**Why it's in the seminar.** The founding taxonomy of Lens A, and the origin of the seminar's
organizing variable. The tier logic — usefulness rises as required oversight falls — is the
verification-cost frame stated on the second slide, and the generate-vs-evaluate comparative
advantage is the principal–agent framing in embryo. The JEL editor asked Korinek to keep the
survey current with semi-annual updates — which is precisely the thread that leads to the next
entry.

### 4 · Korinek (2025) — "AI Agents for Economic Research"

*Anton Korinek. NBER Working Paper 34202, September 2025 (the August 2025 installment of the
JEL update series; resources at genaiforecon.org). Note: the slides' shorthand "Korinek 2025"
refers to this paper, not the December 2024 update (WP 33198) on reasoning models.*

**Where it comes from.** By 2025 the update series had a new subject: "the chatbots that could
help draft emails and summarize papers have evolved into sophisticated systems that can
autonomously conduct literature reviews, write and debug complex econometric code, and
orchestrate multi-faceted research investigations." Korinek's goal is to demystify that shift
for economists and — unusually for a JEL-lineage piece — teach them to build agents themselves.

**What it does.** First it defines the object. An AI agent combines an LLM "with planning
capabilities, memory, and access to external tools to autonomously pursue complex goals through
multi-step actions" — the seminar's *model + tools + memory + iteration*. The architecture
diagram is an orchestrator around a reasoning LLM (the "brain"), tools as its "eyes and hands,"
and a memory system that persists context. It then tours the two agent families that matter for
research — Deep Research agents (which "sometimes access and evaluate more than 500 internet
sources for a single assignment" and compile rather than create) and coding agents (Claude
Code, released February 2025, and the "vibe coding" practice it named) — before hands-on
chapters where the reader builds a FRED data agent and a multi-agent deep-research system, full
code in the appendix.

**What it finds.** Beyond the taxonomy, the claims that stick: agent task-horizons are doubling
roughly every seven months (citing Kwa et al.), pointing to day-long autonomous research tasks
in the near term; costs "can quickly add up in multi-agent workflows" while open-weight
competitors keep collapsing prices; and errors *compound* through multi-step workflows —
hallucinations, prompt brittleness, and prompt-injection are structural risks, not bugs. His
prescription is the seminar's thesis in different words: treat agents "like a professor would
treat a team of research assistants: they require careful planning of what is to be done,
oversight during execution, and detailed vetting of the final results."

**Why it's in the seminar.** This is the paper that names the shift the whole second half of
the talk is about — and its warnings (compounding errors, oversight, vetting) are the failure
modes the five components exist to contain. The plan gate is "careful planning," the permission
fence is "oversight during execution," verification is "detailed vetting," made mechanical.

### 5 · Dell (2025) — "Deep Learning for Economists"

*Melissa Dell. Journal of Economic Literature 63(1), pp. 5–58, March 2025. Earlier as NBER WP
32768 / arXiv:2407.15339. Companion knowledge base: EconDL, with demo notebooks and open-source
packages.*

**Where it comes from.** Economists sit on enormous unstructured sources — historical
newspapers, firm filings, congressional records, satellite imagery — that never enter analysis
because structuring them by hand is prohibitively expensive. Dell, whose research program is
built on mass-digitizing historical text, surveys deep learning not as a forecasting rival to
econometrics but as **data creation**: methods that "impute structured information" from text
and images at a cost that "can scale affordably to problems involving millions or billions of
data points."

**What it does.** A methods survey organized around the pipeline an applied economist actually
faces: architectures (CNNs through transformers and vision models, encoder- vs decoder-style),
training data and labels, bias and uncertainty quantification, reproducibility, then the three
workhorse tasks — classification, embeddings, regression. Every method is paired with a worked
economic application: topic-classifying 2.7 million historical newswire articles (1878–1977)
with nineteen binary classifiers, OCR and layout parsing of historical scans, record linkage
across firms and locations (her group's LinkTransformer package), detecting economic activity
in satellite images.

**What it finds.** The survey's practical doctrine: for corpus-scale problems, small fine-tuned
open models beat commercial LLM APIs on cost and reproducibility — closed models "may not be
reproducible if models are deprecated," while a tuned classifier runs for pennies per million
documents on free-tier compute. Training data are the binding constraint; accuracy degrades
predictably with *domain shift* (a WWI-era page is further from the training distribution than
a Vietnam-era one); and model-predicted variables carry measurement error that downstream
inference must handle — she points to conformal and prediction-powered inference, the same
concern Lens B formalizes.

**Why it's in the seminar.** The most underrated branch of Lens A for an institute like wiiw:
historical CESEE statistics, national gazettes, and firm registries are exactly the trapped
sources this toolkit unlocks. It also seeds the bridge to Lens B — Dell states in passing what
Ludwig–Mullainathan–Rambachan turn into a framework: machine-created variables are measured
with error, and that error propagates into estimates unless explicitly modeled.

### 6 · Bahoo, Goodell, Rhattat & Shahid (2025) — "Artificial Intelligence in Economics Research: What Have We Learned? What Do We Need to Learn?"

*Salman Bahoo, John W. Goodell, Rachid Rhattat, Subhan Shahid. Journal of Economic Surveys
39(5), pp. 2194–2214, 2025. (Distinct from Bahoo et al.'s 2024 sister review of AI in finance —
different coauthors, different corpus.)*

**Where it comes from.** Three decades of AI creeping into economics produced piecemeal,
subfield-specific surveys but no map of the whole territory. The title's two questions are the
motivation: what has the discipline learned from AI so far, and what is it missing?

**What it does.** A systematic review of **2,231 articles spanning 34 years (1990 to November
2024)** — the largest-scope map of AI-in-economics to date. The corpus is classified into five
research streams: AI and economic modeling; AI and macroeconomics (eight sub-streams); AI and
equity and debt markets; AI and prediction modeling (three sub-streams); and AI and the
economics of innovation. On top of the map, the authors propose a framework for how economics
research itself changes before versus after AI adoption, and close with twenty named questions
for future research. (Honesty note: the article is paywalled; these notes are grounded in the
abstract and bibliographic record, so treat claims about the review's internal machinery as
unverified.)

**What it finds.** The stream structure is itself the finding: the literature's weight sits in
macro applications and prediction/forecasting, with modeling, financial markets, and innovation
economics as smaller clusters — adoption has been broad but very uneven across subfields. And
the corpus ends in November 2024, which makes the map a *pre-agentic* baseline: essentially
everything the seminar's Part 2 demonstrates postdates the surveyed literature.

**Why it's in the seminar.** One slide bullet — "the adoption map" — locating where the
discipline already is, so the seminar's claims land as an extension of a documented trajectory
rather than hype. The gap between the map's 2024 endpoint and the 2025–26 agentic turn is the
space the talk operates in.

### 7 · Sant'Anna (2026) — the Claude Code Academic Workflow

*Pedro H. C. Sant'Anna (Emory University). Not a paper: a public template repository and
long-form guide — github.com/pedrohcgs/claude-code-my-workflow (created February 2026, MIT
license) and the companion guide at psantanna.com. Cite pinned to a version, e.g. v2.1.0
(June 10, 2026).*

**Where it comes from.** Sant'Anna — the econometrician of Callaway–Sant'Anna (2021) and
coauthor of the `did` package — built AI-assisted infrastructure for his Emory PhD course on
causal panel data: Claude Code produced six complete lecture decks (800+ slides), interactive
Quarto versions, and full R replication packages. The workflow that made that reliable was then
extracted into a ready-to-fork template for academics, which is what circulates under
"Sant'Anna (2026)."

**What it does.** It is the maximal version of what this repo does minimally. Version 2.x ships
**18 specialized agents** (proofreader, slide auditor, domain referee, R reviewer…), **52
skills/commands** (/review-paper, /audit-reproducibility, /replication-package,
/did-event-study…), 32 rules, and 7 hooks. The doctrines will look familiar: a CLAUDE.md
constitution plus accumulated-memory files; plan-first for anything nontrivial; an adversarial
critic–fixer loop ("the critic can't fix, the fixer can't approve"); quality gates enforced by
pre-commit hooks at **80 to commit, 90 for a PR, 95 aspirational**; reproducibility audits with
numeric tolerance thresholds and per-claim provenance tracking; even simulated peer review with
an editor and two blind referees calibrated to top-5 journals.

**What it "finds."** As a living tool it has adoption rather than results: 15+ research groups
across economics and adjacent fields have forked it, with extensions credited to, among others,
Chris Blattman and Scott Cunningham. Its distinctive contribution is the verification stack —
quality gates, claim passports, reproducibility audits — i.e., industrialized checking.

**Why it's in the seminar.** Three reasons. It is the "practitioner's missing manual" the
slides promise, proof that a serious econometrician runs research this way. It is the direct
source of conventions this repo borrows — plan-first, critic/fixer, the 80/90/95 quality score.
And it is the foil for the design philosophy: when the first slide says "not 18 agents and 52
skills," it is citing *this template's literal component count* — the seminar's five-component
pipeline is the minimal distillation of it. The aside about the workflow guide and the DiD
estimator sharing an author is exact: both are Pedro Sant'Anna. One flag for the diligent: it
is a versioned web resource, not peer-reviewed literature — pin a version when citing.

---

## Lens B — AI as an instrument, with warnings

### 8 · Ludwig, Mullainathan & Rambachan (2025/26) — "Large Language Models: An Applied Econometric Framework"

*Jens Ludwig, Sendhil Mullainathan, Ashesh Rambachan. NBER Working Paper 33344 (January 2025,
revised December 2025); published in the Annual Review of Economics, Vol. 18 (2026).*

**Where it comes from.** Economists rushed to use LLMs to label sentiment, simulate survey
respondents, predict outcomes from text. The authors ask the question the rush skipped: under
what conditions is any of this *valid*? Their starting point is that LLMs resist standard
statistical treatment — proprietary, constantly retrained, trained on corpora nobody can
inspect — so validity conditions must be stated on the *outputs*, robust to whatever the
architecture becomes.

**What it does.** The framework admits exactly **two valid uses**. For **prediction** problems,
the requirement is *no training leakage*: the evaluation sample cannot overlap the model's
training corpus. For **estimation** problems — an LLM automating the measurement of some
variable — plug-in use is biased unless the model's errors are ignorable, so the requirement is
a **human-labelled gold-standard validation subsample** used to debias the downstream estimate.
Creative uses map into the same two boxes (hypothesis generation is prediction; simulating
human subjects is estimation). The empirical work then shows both requirements binding.

**What it finds.** The leakage demonstrations are brutal. GPT-4o "predicts" the passage of
congressional bills with 91–93% accuracy — because it memorized them: in completion tests it
reproduces 344 bill descriptions verbatim, and prompt instructions to ignore post-dated
information barely dent it (330). On financial headlines, date-restriction prompts made leakage
*worse*. On the estimation side, labels from five models under nine prompt variants produce
regression coefficients that vary "in magnitude, sign, and significance" — prompt choice is a
specification choice. The constructive result: a validation sample of just **125–250
human-labelled documents** restores approximate unbiasedness and correct confidence-interval
coverage, and the debiased estimator always beats using the validation data alone — imperfect
LLM outputs are "not substitutes but amplifiers of validation samples."

**Why it's in the seminar.** This is Lens B's discipline paper and the source of the seminar's
one non-negotiable rule: *no machine-generated variable enters a regression without a
human-labelled validation set* — encoded in this repo's rules and data skill. It also anchors
the pitfalls slide: training contamination is not a hypothetical, it is measured.

### 9 · Athey, Keleher & Spiess (2025) — "Machine Learning Who to Nudge"

*Susan Athey, Niall Keleher, Jann Spiess. "Machine learning who to nudge: Causal vs predictive
targeting in a field experiment on student financial aid renewal." Journal of Econometrics 249,
article 105945, May 2025. Earlier as arXiv:2310.08672.*

**Where it comes from.** Standard practice in policy and industry targets interventions by
*risk score* — treat whoever looks worst off at baseline. Causal machine learning offers the
alternative of targeting by *predicted treatment effect*, which is statistically much harder.
The paper asks, in a real experiment at scale: when does the harder thing pay?

**What it does.** The setting is a nudge campaign (ideas42, with CUNY): behaviorally informed
texts and emails pushing community-college students to renew federal financial aid (FAFSA)
before the priority deadline — 25,167 students in 2017, 40,638 in 2018. With experimental
variation in hand, they estimate heterogeneous effects with a causal forest, then compare
targeting policies out of sample: treat by predicted effect, treat the predicted-worst-off,
treat the predicted-likely-filers, or use simple parametric hybrids anchored on the baseline
prediction.

**What it finds.** Nudges work on average (+6.4pp and +12.1pp filing in the two years). The
ranking of targeting rules is the payload: treating half the students chosen by the preferred
(simple, baseline-anchored) policy captures ~75% of the full-treatment benefit, the pure causal
forest ~68% — and targeting the *worst-off* captures **less than a third**. The mechanism is
one sentence: "students who are unlikely to file for FAFSA at baseline are also unlikely to be
convinced to do so by the reminder" — a weak nudge moves people already near the margin. Who is
neediest and who is movable are different questions, and only the second is answerable by the
intervention. A subtlety worth knowing: because effect estimates are noisy, disciplined simple
policies beat the fully nonparametric causal ML here.

**Why it's in the seminar.** The cleanest demonstration that *whom to treat is a causal
question*: predicting who is worst off is not predicting who responds. In the seminar's terms —
if you let a predictive model quietly answer a causal question, you get confident, plausible,
wrong targeting; the discipline of stating which question the algorithm answers is Lens B in
one experiment.

### 10 · Gavrilova, Langørgen & Zoutman (2025) — "Difference-in-Difference Causal Forests"

*Evelina Gavrilova, Audun Langørgen, Floris T. Zoutman. "Difference-in-Difference Causal
Forests With an Application to Payroll Tax Incidence in Norway." Journal of Applied
Econometrics 40(7), pp. 727–740, November 2025. Earlier as CESifo WP 10532.*

**Where it comes from.** Causal forests discover treatment-effect heterogeneity without the
researcher pre-committing to dimensions — but they assume unconfoundedness, which panel policy
evaluations rarely have. DiD assumes parallel trends instead. Roth et al.'s DiD survey
explicitly called for the marriage; this paper answers.

**What it does.** The method (DiDCF) is three moves: difference each outcome against its
base-year value; orthogonalize outcome and treatment à la double machine learning to kill
finite-sample ML bias; and fit a separate forest per period, so pre and post observations never
share a leaf. Under conditional parallel trends, the forest then consistently estimates the
conditional average treatment effect on the treated — heterogeneity discovered by the
algorithm, identification supplied entirely by the design. Staggered adoption is handled by
stacking cohorts, mirroring the modern DiD estimators this repo uses. The application: Norway's
regionally differentiated payroll tax, where an EEA state-aid ruling forced a 2004 rate rise
(10.6% → 14.1%) in one zone against an unchanged neighbor — matched employer–employee data
linked to administrative registers.

**What it finds.** On contracted base wages, DiDCF and conventional two-way fixed effects
agree: the burden stays mostly with firms, as in the prior Norwegian literature. On *full*
wages including bonuses, they diverge — DiDCF finds the burden largely passed through to
workers, operating through bonus payments, which TWFE misses because it never compares
statistically similar firm–worker pairs. The heterogeneity is overwhelmingly a firm-level
phenomenon (82% of it): larger, bonus-paying, gender-diverse firms pass the tax on; small ones
absorb it. That pattern — rent-sharing through flexible pay — helps reconcile why the incidence
literature's estimates range from 0 to 50%.

**Why it's in the seminar.** The constructive face of Lens B: the slide's phrase
"heterogeneity from the algorithm, identification from the design" is this paper's actual
architecture. It shows ML entering a causal pipeline through the front door — flexibility where
flexibility is safe, design assumptions where credibility comes from. That's the division of
labour the whole seminar recommends, written in econometrics.

### 11 · Chen, Cheng, Liu & Tang (2026) — "Teaching Economics to the Machines"

*Hui Chen (MIT Sloan), Yuhan Cheng, Yanchu Liu, Ke Tang. NBER Working Paper 34713, January
2026. First circulated 2023 (SSRN 4642167).*

**Where it comes from.** The paper opens with George Box ("all models are wrong, but some are
useful") against the big-data provocation that theory is dead. Structural economic models are
parsimonious and interpretable but fit poorly; flexible ML fits well in-sample but falls apart
out of distribution, especially with scarce data. The question: can a *misspecified* theory
still make a machine learner better — without being imposed as truth?

**What it does.** The method is transfer learning with theory as the source domain. Pre-train a
neural network on unlimited synthetic data simulated from a structural model, so the weights
encode the theory's restrictions; then fine-tune on real data with a learning rate orders of
magnitude smaller than usual. The effect is regularization that shrinks toward *theory-implied*
values instead of toward zero — the data can pull the model away from the theory where the
theory is wrong, but only with evidence. The testbed: pricing S&P 500 put options, 27.8 million
observations over 2000–2023, with deliberately old, deliberately misspecified Black–Scholes as
the teacher, against an identical net trained from scratch and against a Heston model.

**What it finds.** The theory-taught network's pricing error is roughly a third of the pure
deep-learning benchmark's and a tenth of Heston's. The result the seminar leans on: cut the
training sample to 10% and the pure ML model degrades badly while the theory-guided one stays
stable — in simulations with small samples and high noise, *even a badly misspecified theory
helps*. The advantage is largest exactly when econometrics is hardest: small samples, high
volatility, observations far from the training data. Theory's value fades as data become
abundant, and a severely wrong theory can hurt ("negative transfer") — the framework is a
complement to theory, not a substitute for judging it.

**Why it's in the seminar.** Lens B's optimistic bookend: structure disciplines a flexible
learner, with the biggest gains in the small samples typical of, say, eleven CESEE countries ×
twenty years. Same moral as the Gavrilova paper from the opposite direction — the productive
combinations put theory and design where they bind and let the machine be flexible everywhere
else.

---

## Lens C — AI as an object of study

### 12 · Acemoglu (2025) — "The Simple Macroeconomics of AI"

*Daron Acemoglu. Economic Policy 40(121), pp. 13–58, January 2025 (online August 2024; NBER WP
32487).*

**Where it comes from.** A direct answer to the headline forecasts — Goldman Sachs' 7% boost to
global GDP, McKinsey's $17–26 trillion, talk of growth explosions. Acemoglu's move is to force
any such number through a task-based general-equilibrium discipline: if AI works by making some
tasks cheaper, aggregate TFP gains follow Hulten's theorem — the GDP share of affected tasks
times the average cost saving on them. No exposure share and cost saving you can defend, no
big number.

**What it does.** He assembles the two inputs from the best available evidence. Share: ~20% of
US labor tasks are exposed to current AI (Eloundou et al.'s GPT-4-assisted scoring), but only
~23% of those are *profitably automatable within a decade* (MIT costing evidence) → ~4.6% of
tasks impacted. Saving: ~27% average labor-cost reduction on affected tasks, the mean of the
two credible experiments then available — including Brynjolfsson–Li–Raymond's contact-center
result. Multiply through and add a standard capital response for the GDP figure. He then
degrades the estimate once more for "hard tasks": the experimental gains come from
easy-to-learn tasks with clear metrics; for context-dependent tasks without them, he assumes a
quarter of the gain.

**What it finds.** Cumulative TFP gains of **at most ~0.66% over ten years** — about 0.06% a
year — and under 0.53% with the hard-task correction; GDP roughly 0.9–1.2%, at most ~1.6% with
an investment boom. Distribution: too small for meaningful wage growth, likely to widen the
capital–labor gap. And a sting: AI that creates *bad* tasks (manipulation, deepfake-driven
advertising) can add ~2% to GDP while lowering welfare. One precision the slides gloss: the
paper states these as **upper bounds under its assumptions** — the seminar's "defensible lower
bound" describes the number's *role in the debate* (the conservative anchor everyone cites),
not Acemoglu's own wording.

**Why it's in the seminar.** Lens C's sober benchmark. The seminar needs a credible floor so
that its enthusiasm elsewhere reads as calibrated, and this is the floor everyone in the
literature — including Jones, next — positions against. Disagreeing with it means disagreeing
with an explicit exposure share or cost saving, which is exactly the discipline the seminar
wants in the room.

### 13 · Jones (2026) — "A.I. and Our Economic Future"

*Charles I. Jones. NBER Working Paper 34779, January 2026; in preparation for the Journal of
Economic Perspectives (v2.0, May 2026). The formal model lives in the companion Jones–Tonetti
manuscript "Past Automation and Future A.I.: How Weak Links Tame the Growth Explosion" (2026).*

**Where it comes from.** Two facts refuse to fit together. Frontier capability compounds
absurdly fast (agent task-horizons doubling every 5–7 months; training compute ~10× a year) —
yet US per-capita growth has held near 2% for 150 years through electricity, computers, and the
internet, and Moore's Law added 35% a year in transistor density without accelerating GDP at
all. Jones's essay is the growth theorist's reconciliation of "country of geniuses in a
datacenter" with "normal technology."

**What it does.** The workhorse is a CES production structure over tasks with elasticity of
substitution well below one — tasks are complements, so output behaves like the *harmonic* mean
of task inputs: dominated by the weakest links. The essay works the Jones–Tonetti formula for
what happens when a share of tasks is automated infinitely well, with the empirically
disciplined elasticity (~0.2), and then walks through labor-market logic and the economics of
existential risk.

**What it finds.** The numbers are the argument. Software is ~2% of GDP, so *infinitely* good
automation of all current software tasks raises GDP ~2%. Automate half the economy infinitely
well: ~19% higher output. To *double* income per person you must infinitely automate ~94% of
what humans do — but at 100%, output grows without bound. Weak links tame the explosion, they
don't cancel it: if the automated share creeps up a point a year, growth looks like
business-as-usual ~2% for five or six decades before visibly accelerating; automate nearly all
the weak links and growth of 5–10%+ a year emerges. His memorable line: "Computers can invert
matrices at lightning speed, but we humans must still decide what matrix to invert." Two
codas: complementarity means wages on remaining human tasks can *rise* even as the labor share
falls (radiologists multiplied after Hinton predicted their demise); and weak links slow the
benefits but can *speed* the risks — breaking one link is enough to wreck a chain — with a
revealed-preference calculation that society underinvests in AI safety by an order of
magnitude.

**Why it's in the seminar.** The counterweight that turns Lens C from a verdict into a debate
about *timing and bottlenecks*. And it hands the closing argument its theory: in research
production, the weak link — the complementary, hard-to-automate task that caps everything — is
the researcher's judgment. That is why Part 5 says review became the scarce input.

### 14 · Brynjolfsson, Korinek & Agrawal (2025/26) — "A Research Agenda for the Economics of Transformative AI"

*Erik Brynjolfsson, Anton Korinek, Ajay Agrawal. NBER Working Paper 34256, September 2025;
forthcoming in Communications of the ACM (2026). A companion NBER conference volume, "The
Economics of Transformative AI" (University of Chicago Press, December 2025), grew from the
same project.*

**Where it comes from.** Out of a 2024 Asilomar workshop, three economists who take
transformative AI seriously as a scenario — defined economically as AI sustaining TFP growth at
**3–5× historical averages** — argue that even a modest probability of that outcome makes it
negligent not to do the economics in advance. Forecaster timelines collapsing from 2062 to 2033
(and lab leaders saying sooner) are their exhibit for urgency; Acemoglu's skepticism and the
"normal technology" view are acknowledged as possibly right, in which case the exercise is
scenario planning.

**What it does.** A position paper that organizes the unknown into **nine grand challenges**
with 21 concrete research questions: economic growth; invention and innovation; income
distribution; concentration of decision-making and power; geoeconomics; information and
knowledge; AI safety and alignment; meaning and well-being; and transition dynamics. A
methodology section proposes the tooling: a "transformative AI dashboard" of indicators,
welfare metrics beyond GDP, task-level assessments, simulated economies populated by AI agents,
and scenario planning.

**What it finds.** Agendas don't have findings; this one's contribution is a defensible
definition (TFP-based, so measurable), a decomposition of "what happens if this is real" into
fundable questions, and a claim of comparative advantage: several challenges — power
concentration, geoeconomics, transitions — are ones economists are better placed to answer than
technologists, and they are precisely the ones least studied.

**Why it's in the seminar.** The menu slide. Several of the nine challenges are wiiw-sized
questions wearing global clothes — growth and convergence (CESEE catch-up under AI),
reallocation of labor, geoeconomics and nearshoring. The seminar's pitch is that an institute
that adopts the tools deliberately is also positioned to *study* them credibly, and this paper
is the standing research program to plug into.

### 15 · Mullainathan (2025) — "Economics in the Age of Algorithms"

*Sendhil Mullainathan. AEA Papers and Proceedings 115, pp. 1–23, May 2025. The AEA
Distinguished Lecture, delivered at ASSA in January 2025.*

**Where it comes from.** The lecture opens by steelmanning its own skeptics: the first issue of
the QJE (1886) carried no "Economics in the Age of Electricity," and rightly — economics
abstracts over production technologies. Mullainathan's claim is that algorithms are not
electricity: they change **how decisions are made**, and nearly every economic model is a model
of decisions. The right analogies are game theory, information economics, and the behavioral
and credibility revolutions — upheavals in the discipline's building blocks, not its
technology.

**What it does.** A synthesis of his research program, organized around NYC pretrial release,
where judges make a prediction (will this defendant flee or reoffend?), not a causal inference.
He builds the evaluation econometrics such comparisons need — the selective-labels problem,
omitted-payoff bias — the human-plus-machine logic (algorithms see the data; humans see
unobservables and know the objective), and the use of ML for *hypothesis generation*: an
algorithm found that facial features in mug shots ("well-groomed," "heavy-faced") predict judge
release decisions with effects larger than the charge being violent versus nonviolent — a
hypothesis no one had thought to test, novel even to public defenders.

**What it finds.** The pretrial algorithm could cut jailing ~40% with no increase in crime (or
crime ~25% at the same jail rate) — and a descendant now runs in every NYC pretrial courtroom.
Against the benchmark library of historical US policies, algorithmic interventions look
"unreasonably cost-effective": software scales at near-zero marginal cost, so all four he
studies have an infinite marginal value of public funds. The deepest claim is the necessity
one: "it is no longer possible to model judge decisions in New York City without also modeling
our algorithm." Once algorithms sit inside labor search, credit, medicine, and courts, the
behavioral parameters economists estimate are *endogenous to the algorithms* — policy design
and algorithm design become one problem.

**Why it's in the seminar.** The bridge out of Lens C: algorithms are no longer just tools or
instruments, they are decision-makers inside the economy — objects of study that also change
the studying. The seminar's line that the profession is "part of the treatment group" is a
paraphrase of this argument (the phrase itself is not in the paper): economists' own models,
methods, and daily workflow — this seminar included — are downstream of the technology they
are estimating. His closing prediction is the seminar's, too: "Is this economics?" will become
"This is economics."

---

*Compiled for the wiiw seminar; verified against sources 2026-07-08. Corrections welcome —
if a claim here disagrees with the paper in front of you, trust the paper and open an issue.*
