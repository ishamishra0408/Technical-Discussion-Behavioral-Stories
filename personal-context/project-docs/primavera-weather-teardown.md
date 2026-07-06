<!-- File Purpose: Engineering doc / product teardown: Primavera weather module. TODO -->
**Perplexity Prompt:** Give me the snapshot of product and engineering requirements of **feature question** so that I can have rich technical discussion for product tear down

---

# Oracle Primavera Cloud — Weather Risk Module (Product & Engineering Snapshot)

Below is a product-and-engineering **snapshot** you can use to drive a teardown discussion of Oracle Primavera Cloud's weather risk module. The core idea is that the module models weather-driven non-working time, attaches it to activities, and feeds that into quantitative risk analysis for schedule and cost impact. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)

## Product requirements

- The module must let users create weather risks for specific weather events, such as high winds, flooding, excessive wave height, or frozen bodies of water. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- It must support multiple weather periods per risk so the same risk can vary over the project timeline. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- It must allow users to enter non-working estimates as either a distributed range of days or a percentage of non-work days. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- It should support persistence, meaning the chance that a non-work day is followed by another non-work day. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- It should guide users to base estimates on historical weather data, location, and season, which implies the product is expected to support informed planning rather than ad hoc guesses. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- It must assign weather risks to activities, because unassigned weather risks are excluded from analysis. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- It should expose a probabilistic weather calendar so users can visually validate the modeled weather pattern before analysis. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- It should surface results in the risk analysis charts and planning views, since weather risk contributes to project schedule and cost decisions. [primavera.oraclecloud](https://primavera.oraclecloud.com/help/en/user/142216.htm)

## Engineering requirements

- The data model needs entities for weather risk, weather period, non-working estimate, persistence, activity assignment, and risk-analysis outputs. [docs.oracle](https://docs.oracle.com/en/industries/construction-engineering/primavera-cloud/rest-api/api-project-risk.html)
- The calculation engine needs to transform period-level weather assumptions into day-level non-working probabilities and then propagate that into activity duration and date impact. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- The system needs a simulation step, because Oracle states the probabilistic weather calendar runs 100 iterations to produce daily non-working probabilities. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- The analysis pipeline must integrate weather risk into quantitative risk analysis, not qualitative analysis, because weather estimates are incompatible with the standard probability-impact matrix. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- The engine should reuse the same weather data for both pre-response and post-response quantitative calculations, since Oracle says separate values are not generated for weather risks. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- The implementation should support API-level access to project risk weather periods, which indicates weather periods are first-class backend objects. [docs.oracle](https://docs.oracle.com/en/industries/construction-engineering/primavera-cloud/rest-api/api-project-risk.html)
- The UI/UX should make it easy to review, revise, and rerun estimates, since the weather calendar is intended as a confirmation tool rather than a one-time output. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)

## Architecture signals

- Weather modeling is embedded inside the broader risk-management flow, not a standalone planner feature. [primavera.oraclecloud](https://primavera.oraclecloud.com/help/en/user/142216.htm)
- The module behaves like a probabilistic layer on top of schedule activities, so the likely internal architecture is: risk definitions → weather periods → simulation/calculation → schedule/cost propagation. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)
- The presence of weather period APIs suggests the backend is designed for CRUD operations on weather periods separately from risk analysis execution. [docs.oracle](https://docs.oracle.com/en/industries/construction-engineering/primavera-cloud/rest-api/api-project-risk.html)
- Because the analysis is quantitative, the system likely needs deterministic reproducibility controls, auditability, and versioned assumptions for risk review discussions, even though those are not explicitly stated in the docs. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)

## Discussion angles

- **Product scope:** Is this a planning aid, a forecasting engine, or a risk-governance tool?
- **Modeling choice:** Why use distributed ranges and persistence instead of a simpler calendar-based weather delay model?
- **Explainability:** How does the probabilistic calendar help users trust the assumptions?
- **Integration:** Should weather risk stay separate from generic risk factors, or be unified under one uncertainty framework?
- **Execution:** How are weather periods validated, stored, and recalculated when activity dates shift?
- **Analytics:** What is the relationship between weather-risk outputs and the main risk charts, P80 dates, and schedule confidence metrics?

## Teardown framing

A strong teardown question is whether Oracle optimized for **ease of use** or for **statistical realism**. The UI looks geared toward approachable setup, while the engine clearly makes stronger probabilistic assumptions than a simple rain-delay calendar. [docs.oracle](https://docs.oracle.com/cd/E80480_01/help/en/user/233486.htm)

*Can be turned into a one-page PRD, an engineering design review template, or a competitor teardown matrix next.*