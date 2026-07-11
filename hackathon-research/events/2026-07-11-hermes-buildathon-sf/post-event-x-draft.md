<!-- File Purpose: Post-event X recap draft (PRFAQ-style, <200 words) — fill [brackets] after the event. External planning, not Isha's facts. -->
# Post-Event X Draft — fill blanks, then post threaded on the pre-event post

**Attach (pick 2):** RAGAS seed-diff screenshot · demo clip · flow/control-tower screenshot from the artifact.

---

**Shipped at #HermesBuildathon: a deterministic eval harness for kotaemon (25.5k★)**

**Problem:** RAG evals that change every run aren't evals. RAGAS's `RunConfig(seed=42)` seeds numpy — the seed never reaches the judge LLM. Your scores drift and nothing tells you. [diff attached]

**What shipped in 8h:**
- Seeded runner + run-hash receipts — any run replays byte-identical
- Judge-variance gate — the eval fails *itself* when the grader wobbles
- Failure buckets — wrong page / chopped page / made-it-up
- Live dashboard — every expert suggestion became an attributed before/after, same seed

**Numbers:**
- [N] expert iterations live at the venue
- [Name]'s [suggestion] moved [metric] [X→Y]
- [pass rate] on a [20]-case golden set, reproducible by hash

**FAQ — "LLMs aren't deterministic, isn't this fake?"** Correct: the API is best-effort. So the *run* is my unit of reproducibility, not the model.

Filing the RAGAS gap upstream. Repo: [link]

Huge thanks to @[Ishita] for mentoring all day, judges @[Tosh] @[Kishan] @[Wayne], @Growthx_club, and Devansh on the dashboard.

Open question: where does determinism start costing sensitivity?

---

*Word count ≈ 185. Rules: tag only people genuinely referenced (isha-tasks: earned tags only) · post AFTER all T+1 DMs are sent · thread onto the pre-event post for the before/after timestamp.*

## Why this is the best inbound-generating post Isha can put out

- **It targets the buyer's pain, not the builder's pride.** Bay Area AI teams' 2026 blocker is reliability in production, not model quality — the post opens with a failure their own eval stack has ("your scores drift and nothing tells you"), so a hiring EM reads it as "she's already solving my problem."
- **It's a googleable credential, not a claim.** A reproducible diff against RAGAS (~15k★) + an upstream filing means anyone who searches her name finds public, verifiable work on a library their team likely already uses — the exact class of company she wants inbound from.
- **Named credits make other people distribute it.** Ishita, Kishan, Wayne, and peers reshare posts they're credited in; their followers ARE Bay Area AI hiring circles. Every reshare is a warm-intro surface she didn't have to ask for.
- **The FAQ line pre-answers the objection every senior engineer will raise** ("LLMs aren't deterministic") — surviving the reply-guys is what makes a technical post credible enough to forward internally.
- **PRFAQ shape signals operating maturity:** problem → shipped → numbers → open question reads like an engineer who ships and measures, in under 200 words — the format itself is a work sample.
- **The open question converts readers into conversations** — replies are the top of her referral ladder (engage → call → ask), and each reply is inbound she can route to the W1–2 call step.
