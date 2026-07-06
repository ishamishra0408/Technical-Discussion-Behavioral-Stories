<!-- File Purpose: ⚠️ UNVERIFIED external research (Perplexity/LLM-generated). Context for discussion only — never a factual claim about Isha's work. Moved from personal-context/ (facts-only zone). -->
# Oracle Primavera Cloud — Weather Risk Module (research snapshot)

Source: Perplexity synthesis of Oracle docs — [docs.oracle.com/cd/E80480_01/help/en/user/233486.htm](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm) · [risk REST API](https://docs.oracle.com/en/industries/construction-engineering/primavera-cloud/rest-api/api-project-risk.html)

**What the module does:** models weather-driven non-working time (high winds, flooding, frozen water), attaches it to schedule activities, and feeds quantitative risk analysis for schedule/cost impact. Probabilistic simulation, NOT a trained ML model.

**Key facts:**
- Weather risks have multiple periods over the project timeline; estimates entered as distributed day ranges or % non-work days.
- Supports **persistence** — the chance a non-work day is followed by another.
- Probabilistic weather calendar runs **~100 Monte Carlo iterations** → daily non-working probabilities → activity duration/date impact.
- Quantitative analysis only (incompatible with the qualitative probability-impact matrix); same weather data reused pre- and post-response.
- Weather periods are first-class backend objects with CRUD REST APIs, separate from analysis execution.
- Likely architecture: risk definitions → weather periods → simulation → schedule/cost propagation; implies reproducibility controls and versioned assumptions.

**Teardown question:** did Oracle optimize for ease of use or statistical realism? UI is approachable; the engine makes stronger probabilistic assumptions than a simple rain-delay calendar.
