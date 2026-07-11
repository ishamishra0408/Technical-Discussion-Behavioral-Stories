<!-- File Purpose: Final research report — Hermes Buildathon SF, 2026-07-11. External research, not Isha's facts. -->
# Hermes Buildathon SF — Research Report (compiled 2026-07-10)

**Event:** World's Largest Hermes Buildathon | SF · https://luma.com/hermesbuildathonSF · GrowthX · 8 hours, "build, launch, get users, chase revenue" · sold out: 1,247 registrations / 50 spots · socials @Growthx_club (X), @growthx.club (IG)

## FINAL

- Fork **Cinnamon/kotaemon** (25.5k★, hybrid BM25+vector+rerank pre-built) — build ONLY the deterministic, seeded, versioned eval spine.
- Metrics: RAGAS (faithfulness, context precision/recall) + trajectory metrics in Tosh's vocabulary (convergence rate, info-gain/iteration).
- Anchors: **Ishita Jindal** (iterate-first, all day) → **Tosh Rayadhurgam** (late, with evidence). Wayne Sutton fallback.
- Sponsors: OpenAI + Convex (eval-run store, reactive dashboard) + Cloudflare AI Gateway (logging + deterministic cache = the re-run proof).
- Demo exhibit: RAGAS `RunConfig(seed=42)` only seeds numpy — never reaches judge LLM calls (a *documented* open problem). Her harness **detects and bounds what even the standard library punts on** — frame as gap-detector, never gap-discoverer (audit v2: "villain" framing reads junior in front of Tosh).
- Prepared answer to "what's new here? you added tests": **"I'm contributing the harness back upstream to a 25.5k★ project"** — the PR is the launch story a revenue room understands.

## PEOPLE (researched; first-party sources only)

| Name | Role | Owns / material | Hook for Isha |
|---|---|---|---|
| **Ishita Jindal** ⭐ iteration anchor | Mentor · Co-Founder Memory Store (YC S26, SF) · ex-Julep (~7K★) | Memory layer for agents via MCP; "Briefs" living docs. Essay: memory = "relationships between facts, not retrieval"; vocabulary: provenance, materialized insights, "agents making the same mistakes" | "Your founding pain — agents repeating mistakes — my harness measures it: seeded replays, memory-backed vs memoryless, provenance per divergence. How would you eval whether a Brief updated correctly?" |
| **Tosh Rayadhurgam** ⭐ judging anchor | Judge · Head of Advanced AI, Stripe · ex-Meta search/retrieval | Talks: "Agents as Search Engineers" (MLOps 11/2025), OpenXData non-determinism talk. Vocabulary: "the deterministic assumption," "trajectory," "convergence rate," "information gain per iteration" | Late-day, with results — claim ONLY what exists (audit v2): "I built deterministic replays with variance-bounded judging on kotaemon. Trajectory metrics are the extension I want your take on: does convergence-rate-under-fixed-seed keep its signal, or does clamping non-determinism destroy what you'd want to measure?" ONE talk reference max (two reads creepy). If bonus trajectory metric shipped (see build-plan), show it. |
| **Wayne Sutton** (fallback) | Judge · Convex community/startups | Ships code: `convexskills` (~400★), `opensync`; writes what-wins-hackathons posts | "I used your convexskills patterns for the eval-run store — every seeded run is a Convex document, leaderboard updates reactively. Which patterns do hackathon teams misuse most?" |
| **Kishan Rao** (2nd iteration anchor) | Host · EM Okta · Rootly AI Labs fellow | `SRE-skills-bench` — benchmarking LLMs on SRE tasks | Closest professional overlap on roster; hosts circulate all 8h. "Your SRE-skills-bench benchmarks LLM reliability — I'm gating RAG evals on judge-variance the same way." |
| Abhishek Kankani | Judge · Head of Emerging Tech, Cloudflare (Bengaluru-based, ex-Dyte CEO) | Cloudflare blog author | Not anchor, but: "Your AI Gateway's deterministic cache is my reproducibility proof — cache hit = verified re-run at cost zero." |
| Aritra B (Intuit), Sarang Bhutada (Gusto, Sr PM), Gautam Bagal (SBD), Nehal Agrawal (Invigilo), Akshay Potnis (Adobe, design), Saloni Aggarwal (role unverified) | Judges/mentors/host | No first-party engineering material found (gap recorded, not filled) | Product-wrapper line for PM judges: "Silent AI failures cost you customers and refunds — this catches them before they ship." |

Peer attendees: not discoverable pre-event (Luma hides guests; verified via ~8 query patterns). **Post-event scan July 12–14:** "Hermes Buildathon SF" + won/built/shipped.

## ML-COLLAB SEAMS (decisions deliberately left for ML engineers in the room)

| Decision | Ask an ML engineer | Show after |
|---|---|---|
| RRF fusion k-value | "RRF k=60 default — for construction-PDF-style corpora, raise k or normalize scores instead of ranks?" | before/after hit@k at their k |
| Chunk overlap policy | "Gold answers split across chunk boundaries — bigger overlap, semantic chunking, or parent-child retriever?" | failure-bucket counts shifting |
| Judge-prompt validity | "Is my grounding rubric rewarding fluent-but-unsupported answers? Help me build a hard-negative that should fail." | judge failing their hard-negative |
| Golden-set stratification | "How do I stratify 20 queries so easy cases don't game the metric?" | metric split by stratum |
| Embedding-nondeterminism ε | "text-embedding-3-small drifts at float level — what cosine delta counts as 'same' for my determinism gate?" | stable run-hash across N runs |
| Judge temp vs sensitivity | "Temp=0 is deterministic but rigid — where's the pass threshold so determinism doesn't cost sensitivity?" | variance report at their threshold |

## SKILL-HARDENING MAP (goal: ML-SWE collab skills — production-ready, reliable, fault-tolerant)

| Build step | Reliability skill exercised |
|---|---|
| Seeded runner + run-hash (inputs+seed+model+chunk-IDs+prompt-version) | Reproducibility / determinism |
| Golden-row validation (gold chunk-ID must exist in corpus → loud error) | Validation boundary (the "1.3 persistence" lesson) |
| Judge-variance gate (fail eval when variance > threshold) | Error handling + silent-failure detection |
| Convex eval-run store (every run durable, queryable) | Checkpointing / audit trail |
| Cloudflare AI Gateway routing (tokens, cost, latency, cache per call) | Logging / observability |
| Partial-failure handling (one golden case errors → run continues, reports) | Fault tolerance |

Post-event: fold these into the 4 open gaps in the Primavera answer (checkpointing, logging/observability, config, observability-under-load).

## ITERATION PLAN (~20 expert loops; expert-only, no random-attendee feedback)

| Order | Who | What |
|---|---|---|
| 1–3 | Ishita Jindal | Golden-set design, memory-vs-memoryless framing, Brief-eval question |
| 4–6 | Kishan Rao | Judge-variance gate, SRE-style reliability framing |
| 7–10 | ML engineers among 50 attendees | The 6 seams above — one seam per conversation, show before/after |
| 11–12 | Wayne Sutton | Convex store patterns (cite convexskills) |
| 13+ | Ishita round 2 | Results so far; her suggested iteration |
| LATE | **Tosh** | Results table + trajectory metrics. **Trigger override: any signal he's leaving early → jump the ladder immediately with whatever exists.** |
| Any | PM judges (Aritra/Sarang) | Product wrapper: "silent failures cost customers/refunds" |

## BRAND PHRASE

- Handshake: **"I catch AI's silent failures."**
- When asked: **"AI fails silently — I build the systems that catch it before it costs you."**
- 15-sec script: "Fluent RAG answers that aren't grounded. Eval scores that change every run. I forked kotaemon and built a seeded, versioned eval harness around it — same inputs, same answer, provably. Here — re-run it right now and watch the hash match."
- Per-person: Tosh → "Agents break the deterministic assumption — I bound it and make every run replayable." (audit v2: "I put it back" overclaims — cache+seed is replay, not restored determinism) · Ishita → "Agents repeat the same mistakes — I measure exactly when and why." · Submission form one-liner: the Tosh variant.

## RAT — Riskiest Assumption Test (auditor, 2026-07-10)

**THE riskiest (A1, 5×4):** "Same inputs → same answer" is NOT an OpenAI API property (seed/temp=0 = best-effort; `system_fingerprint` drift). It's a property of her architecture — Gateway deterministic cache + byte-identical request bodies — currently unverified. Fails *silently at demo time*, attacking the handshake phrase itself, in front of the judge whose talk is about exactly this.
**Win-win reframe if tonight's test fails:** "I don't trust the model to be deterministic — I pin what I can, detect drift via fingerprint, and make the RUN the unit of reproducibility: versioned, hashed, replayable." (= Tosh's own vocabulary; run-hash receipt becomes load-bearing.)

| Rk | Assumption | I×U | Tonight-test |
|----|-----------|-----|--------------|
| 1 | A1 OpenAI determinism / Gateway cache unverified | 20 | Gateway up → same request 2× → cache-HIT + identical bytes; 5 seeded calls → diff |
| 2 | A2 kotaemon instrumentable cold in 2h | 20 | Docker + headless-QA spike; fail in 30 min → fallback get-convex/rag TONIGHT |
| 3 | A7 venue logistics free (wifi/images/accounts) | 15 | Pre-pull, pre-create, pre-ingest tonight |
| 4 | A10 spots actually confirmed (1,247→50 curation) | 15 | Check both Luma emails say "going" |
| 5 | A6 Devansh fits split (never verified) | 12 | Text him: "Convex/TypeScript? yes/no" |
| 6 | A4 Tosh present + stays late | 12 | Agenda tonight; ask host first 30 min |
| 7 | A11 golden set exists at clock-start | 12 | Draft 8 pairs tonight AS DRAFT (seam preserved) |
| 8 | A5 engineering demo at revenue event | 12 | One-line revenue wrapper; read rubric at kickoff |
| 9 | A3 Ishita attends/accessible | 9 | Check her socials; find her at check-in |
| 10 | A8 20 iterations feasible (18 min each) | 9 | Redefine: floor 8–10 logged, 20 stretch |
| 11 | A9 RAGAS villain accurate for shipped version | 8 | Pin version; run metric 2×; save the diff as artifact |
| 12 | A12 Gateway base-URL reaches ALL kotaemon calls | 6 | Folded into A1+A2 spike via Gateway logs |

Full tonight-queue with timings: `build-plan.md` (includes the Devin AI deep-dive brief, ready to paste).

## TONIGHT (from roads-not-taken ledger, top triggers)

1. **P1 — 45-min dry run:** fork kotaemon, `docker` pull the `main-lite` image, one seeded eval run, pre-create Convex + Cloudflare Gateway accounts, pre-pull images. Venue wifi is where 2h budgets die.
2. **P2 — optional pre-event post:** "Bringing a deterministic eval harness to #HermesBuildathon — who's working on agent reliability?" (doubles as pre-marketing; organizer channels were the untried discovery route).
3. Ask Devansh his skills first 10 min tomorrow → confirms the split (currently assumed).

## DECISIONS (final)

| # | Decision | State |
|---|---|---|
| 1 | F4 on kotaemon (eval spine; retrieval pre-built) | LOCKED |
| 2 | Digg-first sourcing (yield: 3 usable, flagged) | LOCKED · executed |
| 3 | OpenAI + Convex + Cloudflare (Linkup dropped as forced) | LOCKED |
| 4 | Ishita iterate-first → Tosh late-with-evidence; Wayne fallback | LOCKED |
| 5 | Research lives in hackathon-research/ (provenance carve-out) | LOCKED (superseded scratchpad) |
| 6 | First-party sources only; gaps marked | LOCKED · executed |
| 7 | Isha = eval spine · Devansh = Convex/Cloudflare/data pipeline | PROPOSED — confirm with Devansh |
| 8 | Phrase (a)+(c) + per-person variants | LOCKED |

## Behavioral-story payoff

- Build = live evidence for the undrafted `root-cause-debugging` answer ("is it retrieval, chunking, or generation?" — the failure-bucket harness answers it).
- Build = modern retelling of the Primavera seam (seeded RNG, validation boundary, "a wrong number wearing a right one's costume" as the closing line in interviews).
- Skill-hardening map feeds the 4 open Primavera-answer gaps.
