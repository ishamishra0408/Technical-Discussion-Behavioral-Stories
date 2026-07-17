# Hackathon Prep Research Plan (Research Only)

## Governance: two-agent loop + computed intent

- **Standing rule (msg 26): before doing anything, reword Isha's intent and repeat it back to her.** Persist to memory post-approval.
- **Standing rule (msg 27): intent restatements ≤20 words, bullets/tables, no paragraphs.**
- **RAT (msg 25):** auditor runs a Riskiest Assumption Test over the locked plan (9 seeded assumptions incl. OpenAI API best-effort determinism, kotaemon 2h instrumentability, Ishita accessibility, engineering-demo-at-revenue-event); ranked impact × uncertainty; lands as "RAT" section in final report and may reshape tonight's prep.
- **Execution check-ins (msg 25 "checking in where it matters"):** RAT results → report draft before any commit → schedule before activation. Everything else proceeds without asking.

- **Ideator (Opus)** — generates candidates: project concepts, repos, ML-collab seams, wildcards. Never decides.
- **Auditor (Fable)** — audits plan + ideator output against the **computed intent statement**, flags drift/gaps/premature locks, prescribes minimum-diff corrections.
- **Intent statement** — compiled from Isha's messages; **recomputed every 5 of her messages** (v1 = messages 1–8; v2 = messages 1–13, below; v3 due at message 18). The auditor re-runs against each new version.
- **Intent v3 (messages 1–19) deltas:** anchors LOCKED with fear-ladder sequencing (Ishita iterate-first — accessibility matters to her, Tosh approached late with evidence, Wayne fallback); phrase LOCKED (a)+(c); framing LOCKED (F4 on kotaemon); sponsor tools LOCKED (OpenAI+Convex+Cloudflare, Linkup dropped); **communication preference: answer her last message directly FIRST, then artifacts — she flagged "you are brainstorming" when a direct answer was owed**; event verified 2026-07-11 (tomorrow) → post-event peer scan July 12–14.
- **Intent v2.1 delta (message 14): explicit goal added — harden her ML-SWE collaboration skills: making ML models production-ready, reliable, fault-tolerant.** The build must exercise these skills, not just showcase them: fault tolerance, error handling, checkpointing, validation boundaries, logging/observability around an ML component (= her syllabus "Reliable" bucket, and the 4 production-hardening tasks dropped from her Primavera v2 answer — the hackathon is a live rep to earn them back).
- **Intent v2 deltas (messages 9–13):** Chunk 2 searches must be exactly specified (done); RAGAS is a first-class source/component — high adoption at her target companies; auditor findings get applied as plan fixes ("Ok fix plan"); before execution she reviews a **minimal-word output template per research chunk** so she can give directions quickly; open decisions surfaced before todo execution starts.
- Both agents' outputs land at chunk checkpoints alongside the open-decisions table; the auditor's verdict gates what gets marked HARDENING → LOCKED.
- **Unvisited-branch ledger (added msg 20):** the auditor also tracks every decision branch Isha did NOT take — format: Branch | Buried insight | Revisit trigger — surfaced at checkpoints + final report ("Roads not taken" section), retroactively backfilled over all ~8 session decision points (framings, anchors, repos, sponsors, phrases, unseen wildcards, process). Rationale: she proceeds on naive reads; skipped branches hold rich insights and pre-computed fallbacks (e.g., "kotaemon setup fails by 9:30am → get-convex/rag").

## Workflow: research chunks × living open-decisions table

Research runs in **3 chunks**. After each chunk, the open-decisions table below is re-issued with updated status (OPEN → HARDENING → LOCKED) and framing candidates re-scored against the new evidence. Isha reviews the table at each checkpoint before the next chunk runs. Nothing is final until it's marked LOCKED.

### Project-framing candidates (OPEN — evaluated after every chunk)

Scoring adds a 5th criterion (message 14): **skill-hardening value** — how many production-reliability skills (fault tolerance, error handling, checkpointing, validation boundaries, observability around an ML component) the build makes her actually exercise.

| Candidate | One-liner | Story anchor | Scored on |
|-----------|-----------|--------------|-----------|
| F1: Reliability-seam evals | Add a deterministic, seeded, versioned eval harness to an OSS RAG/agent repo; fidelity decisions sourced from ML engineers in the room | Primavera (fidelity vs. reproducibility) + undrafted root-cause story | Anchor-mentor fit · ML-collab surface · 2h feasibility · story payoff |
| F2: Hybrid retrieval upgrade | Add BM25 + dense fusion + reranking to an OSS RAG repo, with before/after hit-rate on a golden set | Quotr (shipped hybrid retrieval) | same |
| F3: Observability layer | Add tracing/cost/latency/failure-taxonomy instrumentation to an OSS agent repo (Cloudflare AI Gateway angle) | LetsTransport sync story + syllabus "Reliable" bucket | same |
| F4: Combination (F1 core + thin slice of F2 or F3) | Eval harness as the spine; retrieval or observability as the measured variable | Primavera + Quotr | same |

### Open decisions (re-issued at Chunk 1 checkpoint, 2026-07-10)

| # | Decision | Status | Current leader | Hardens after |
|---|----------|--------|----------------|---------------|
| 1 | Project framing | **LOCKED (msg 19)** | **Fork Cinnamon/kotaemon (25.5k★): hybrid BM25+vector+rerank ships enabled — Isha's 2h goes entirely into the deterministic/seeded eval spine.** RAGAS as metric library inside the spine; its RunConfig seed-gap (seed only inits numpy, never reaches judge LLM calls) is the demo villain. Trajectory metrics in Tosh's vocabulary over kotaemon's ReAct/ReWOO pipelines. Bonus if time: hermes-agent (Digg-sourced) memory-vs-memoryless comparison = Ishita hook made runnable. | — |
| 2 | Repo source | LOCKED | Digg first, GitHub trending supplement (executed; Digg yield: 3 usable, flagged not silently substituted) | — |
| 3 | Sponsor tools | **LOCKED: 3 natural fits** | OpenAI (LLM/embeddings/judge) + Convex (golden set + eval-run store + reactive dashboard) + Cloudflare AI Gateway (base-URL swap: logging + deterministic cache = the "re-run" proof). Linkup dropped — no natural slot in kotaemon (document RAG, not web search); forcing it violates minimum diff. | — |
| 4 | Anchor person | **LOCKED (msg 17) with sequencing** | **Ishita Jindal = iteration anchor** (mentor = present all 8h; week-old YC founder seeking thesis validation; shared India→SF path — most accessible person on roster). **Tosh = judging anchor, approached LATE with evidence** ("here's what the harness measured across N iterations") — data does the talking, not cold small talk; Isha's intimidation acknowledged, ladder: Ishita reps first → Tosh with artifacts. Wayne fallback. | — |
| 5 | Report location | LOCKED | Standalone scratchpad file, not TechDiscussion repo | — |
| 6 | Judge sources | LOCKED | First-party only; gaps marked, never filled | — |
| 7 | Isha/Devansh split | OPEN | Isha = reliability/eval track, Devansh = pipeline/integration | Chunk 3 |
| 8 | Handshake brand phrase | **LOCKED (msg 17): (a)+(c) combo** | Handshake: **"I catch AI's silent failures."** When they ask: **"AI fails silently — I build the systems that catch it before it costs you."** Per-person tuning: Tosh → "deterministic assumption" variant; Ishita → "agents repeating the same mistakes" variant. | — |

### Chunk 1 findings digest (full report in agent output; flows into final report)
- Anchor: **Tosh Rayadhurgam** — talks: "Agents as Search Engineers" (MLOps, 11/2025: BM25→vector→agentic, trajectory evals) + OpenXData (non-determinism as THE production problem). Vocabulary: "non-deterministic agents," "the deterministic assumption," "trajectory," "convergence rate," "information gain per iteration," "hybrid relevance."
- Opening question for Tosh (drafted, in report): does convergence-rate-under-fixed-seed keep its signal, or does clamping non-determinism destroy what he wants measured?
- Fallback: **Wayne Sutton** — build eval-run store on Convex using his own `convexskills` patterns and cite it to him.
- Dark horse: **Kishan Rao (Okta host)** — Rootly AI Labs fellow, `SRE-skills-bench` (LLM reliability benchmarking) — second conversation target, not anchor.
- No first-party engineering material: Aritra B., Sarang Bhutada, Gautam Bagal, Nehal Agrawal, Saloni Aggarwal (role unverified), Akshay Potnis (design-axis only).
- Roster corrections verified; Ishita Jindal (5th mentor) + peer social scan running (Chunk 1b).
- Event tilt caveat: 8-hour "build, launch, revenue" event — her engineering-first demo must still land with product judges; Tosh being a judge mitigates.
- **Event is 2026-07-11 (tomorrow)** — research completes today; post-event peer scan July 12–14 ("Hermes Buildathon SF" + won/built/shipped) since pre-event attendee list is not discoverable (verified: Luma hides guests, X search login-walled, ~8 query patterns tried).
- **Chunk 1b digest:** Ishita Jindal VERIFIED (SF, Memory Store = shared memory layer for agents via MCP, "Briefs" living docs; vocabulary: "company brain," "provenance," "materialized insights," "agents making the same mistakes"; no first-party evals material — don't claim she works on evals). Her opener (drafted in report): seeded deterministic replays could measure exactly how much a memory layer changes an agent's trajectory — memory-backed vs memoryless baseline, provenance for every divergence; ask how she'd eval whether a "Brief" updated correctly (open problem for her product). F1 framing confirmed by Isha = F4 (msg 16).

## Context

Isha is attending a ~2-hour Bay Area hackathon (sponsors: OpenAI, Convex, Wispr Flow, ElevenLabs, Cloudflare, Linkup, Dodo Payments). Goal is NOT a zero-to-one demo — it's to fork a strong open-source repo and add one serious AI-engineering layer, producing (a) sharper behavioral-tech-discussion material for her job search and (b) memorable interactions with the right judges/mentors via ~20 fast feedback iterations.

Exploration of her TechDiscussion repo established her highest-leverage anchors:

1. **Hybrid retrieval** — Quotr: metadata chunking, FAISS + BM25 hybrid, ">90% grounding accuracy, sub-2s latency" (`personal-context/resume.md:19`). Direct shipped experience.
2. **RAG eval / root-cause triage** — her chosen-but-undrafted story is literally "is it retrieval, chunking, or generation?" (`qna/root-cause-debugging/decision-log.md:12`). A hackathon eval harness would let her *live* this story.
3. **Determinism as correctness** — Primavera seeded-RNG story ("a wrong number wearing a right one's costume"). Translates to reproducible, versioned eval runs — a senior differentiator.
4. **Observability / ML-SWE seam** — syllabus "Reliable" bucket + LetsTransport Mongo↔ES sync story.

**Read firsthand from her v2 Primavera answer (`qna/tradeoff-system-design/answer.md`):** the story's architecture is a two-owner seam — the ML engineer owned statistical fidelity, she owned making it deterministic, auditable, production-grade (seeded RNG + versioned assumptions + validation boundary; the silent-failure beat "a wrong number wearing a right one's costume"). **The hackathon project must recreate this seam live:** she builds the reliability/eval side of an OSS RAG/agent repo, and the fidelity-side decisions (chunking strategy, reranker choice, LLM-judge prompt validity, metric design) are explicitly delegated to ML engineers she consults at the event. Heavy ML-collab is a design requirement, not a nice-to-have — it is her networking mechanism.

**Layer choice (hybrid retrieval vs. evals vs. observability) stays open** until judge research identifies the anchor person; the winner is whichever layer maximizes collaboration surface with that person while staying narratable through her Primavera/Quotr stories.

Constraints: 2-hour build window; use 3–4 sponsor tools that fit naturally (likely OpenAI + Convex + Cloudflare + Linkup); repo must be clonable and runnable in minutes, not tens of minutes.

## Deliverable location + end-of-session packaging (msgs 20–24, supersedes decision #5's scratchpad)

**Folder repo: `TechDiscussion/Technical-Discussion-Behavioral-Stories/hackathon-research/`** (Isha chose inside TechDiscussion; carve-out: like `reference/`, this folder is ⚠️ external research, never facts about Isha — add that note to its README so the repo's provenance rules stay intact).

```
hackathon-research/
├── README.md                        # purpose + provenance carve-out + how to re-run pipeline
├── config/
│   └── auto-research.md             # packaged pipeline: sources, Bay Area filter, anchor-ranking
│                                    # criteria, repo-scoring spec, output templates, intent capsule
├── events/
│   └── 2026-07-11-hermes-buildathon-sf/
│       ├── report.md                # final Chunk 3 report (per template)
│       ├── roads-not-taken.md       # auditor's branch ledger
│       └── build-plan.md            # 2h build plan + tests + Isha/Devansh split
└── (future events land as new folders via scheduled runs)
```

**Weekly scheduled agent** (after config exists): scans Luma/GrowthX/eventbrite-type sources for important Bay Area AI hackathons, scores them (judge quality by self-authored material, sponsor credits, curation level), runs the packaged pipeline on top matches, writes results into `events/`. Also handles the July 12–14 post-event peer recap scan for Hermes.

**Parallel execution once approved:** Lane A (folder scaffold → report + ledger writes) ∥ Lane B (config packaging); schedule setup after B; Devansh-split confirm is Isha's own action item (ledger: his skills were assumed, never verified — ask him in the first 10 minutes tomorrow).

## Deliverable

One research report — a standalone file in the session scratchpad, **outside the TechDiscussion repo** (matches decision #5) — with three tables:

1. **GitHub repo candidates** (from Digg + supplements) — scored for this use case
2. **Judge/mentor actionable analysis** (Bay Area only) — what each cares about, sourced from their own engineering writing/docs
3. **Focus-area recommendation** — which layer (hybrid retrieval / evals / observability) best intersects her stories × judge interests × sponsor tools

## Output templates (review these; each chunk's output follows its template exactly)

### Chunk 1 → you
```
LOCATION CHECK (all 11)
Name | Verified role | Bay Area? | Researched/Skipped

PER PERSON (researched only)
Name | Owns | First-party sources (links) | Topics they light up on | Their vocabulary | Hook for you

ANCHOR: <name> — 3-line logic
FALLBACK: <name> — 1-line (veto option)

FRAMING RE-SCORE: F1–F4 | anchor-fit | new status

DECISIONS TABLE re-issued (#1 #4 #8 moved)
NEED FROM YOU: anchor ok? | framing direction | phrase wording
```

### Chunk 2 → you
```
CANDIDATES
Repo | ★ | Digg/GH source | Setup mins | Extension seam (named) | Framing fit | Sponsors | 2h risk

TOP 3: each ≤3 lines "what you'd build on it" + ML-collab seams

DECISIONS TABLE re-issued (#1 #3 moved)
NEED FROM YOU: pick/veto repo | scope adjust
```

### Chunk 3 → you (final report)
```
FINAL: framing + repo + anchor (≤5 lines)
ML-COLLAB SEAMS: Decision | Ask-an-ML-engineer | Show-after (4–6 rows)
SKILL-HARDENING MAP: build step | reliability skill exercised (fault tolerance, error handling, checkpointing, validation, observability)
ITERATION PLAN: who → order → opening question
ISHA/DEVANSH SPLIT (confirm)
BRAND PHRASE final + 15-sec script
BUILD-DAY TESTS incl. grey cases
DECISIONS: all LOCKED
```

## Execution: research chunks

Order note: **Chunk 1 (judges) runs before Chunk 2 (repos)** — the anchor person is the strongest signal for hardening the framing, and repo scoring needs the framing leaders. Each chunk ends by re-issuing the open-decisions table to Isha as a checkpoint.

### Event facts (verified from Luma, 2026-07-10 — supersedes roster-from-message where they conflict)
- **World's Largest Hermes Buildathon | SF** — https://luma.com/hermesbuildathonSF · GrowthX · sold out, 1,247 registrations / 50 spots · socials: @Growthx_club (X), @growthx.club (IG)
- **8-hour event** ("build, launch, get users, chase revenue in 8 hours") — Isha's 2-hour build budget is a deliberate slice: ~2h build + ~6h expert iterations/networking. NOTE: event framing is product/revenue-tilted; her engineering-first positioning is a differentiator, and the demo must still land with product-minded judges (Intuit/Gusto PMs).
- Roster corrections: Abhishek Kankani = **Head of Emerging Technology**, Cloudflare (not Head of Engineering); Nehal **Agrawal**; **+ 5th mentor missing from Isha's list: Ishita Jindal, Co-Founder, Memory Store — add to research set (also relevant to Chunk 1b: woman in tech, memory/AI-infra startup)**.

### Chunk 1b — Peer-attendee social scan (added, message 15; unblocked by Luma link)
Search socials (X/Twitter, LinkedIn public posts, Luma page) for people posting about attending **Hermes Buildathon SF** — **especially notable women in tech**. Queries: "Hermes Buildathon" on X/LinkedIn; @Growthx_club mentions/replies; luma.com/hermesbuildathonSF shares. Sources: public posts only; no marketing accounts; each person cited to their own post.
Output added to Chunk 1 template:
```
PEER ATTENDEES (esp. women in tech)
Name | Role/company | Their post (link) | Why worth meeting | Opening hook
```

### Chunk 1 — Judge/mentor research → anchor person (details in Step 2 below)
Output: Bay Area–filtered analysis table + ranked anchor candidates + ONE anchor + fallback. Then: re-score F1–F4 against the anchor's interests; update decisions #1, #4, #8. **Checkpoint with Isha.**

### Chunk 2 — Digg + GitHub repo scouting (details in Step 1 below)
Repos scored against the surviving framing candidates (not just one). Output: candidates table + top-3 shortlist, each annotated with which framing it serves best and its ML-collab seams. Then: update decisions #1, #3. **Checkpoint with Isha.**

### Chunk 3 — Synthesis (details in Step 3 below)
Cross anchor × repo × stories × sponsor tools → final recommendation, LOCK remaining decisions, produce the full report (iteration plan, collab seams, Isha/Devansh split, brand phrase final wording, build-day test cases). **Final review with Isha.**

---

### Step 1 — Digg scrape for repo candidates (WebFetch/WebSearch, no browser automation)

**Exact search specification (Chunk 2):**

*Digg pass (primary):*
1. `WebFetch digg.com` — verify current site structure (relaunched 2025), identify the technology / programming / AI channel URLs.
2. Fetch each identified channel page + its top/recent feeds; harvest every `github.com/<org>/<repo>` link and every post whose title names an OSS project (~last 90 days).
3. `WebSearch: site:digg.com github.com` and `site:digg.com github (RAG OR retrieval OR agents OR evals OR LLM)` — catch posts the channel pages don't surface.
4. For each harvested repo: record the Digg post title/date (this is the "Digg-sourced" provenance column).

*GitHub supplement (secondary, clearly labeled non-Digg):*
5. `WebFetch github.com/trending?since=weekly` (and `?since=daily`), languages Python + TypeScript — keep AI/RAG/agent/eval repos only.
6. GitHub topic searches: `topic:rag stars:>3000 pushed after ~2026-04`, `topic:llm-evaluation stars:>500`, `topic:ai-agents stars:>3000`, `topic:llm-observability`.
7. Seed list of known strong OSS RAG/agent apps verified (not assumed) via README fetch — e.g., open-webui, onyx (fka danswer), anything-llm, ragflow, verba, letta — kept only if they pass the filter below.
7b. **RAGAS (Isha-flagged, 2026-07-10): treat as a first-class source and likely eval-harness component** — she validates high adoption at her target companies, so its metrics vocabulary (faithfulness, context precision/recall, answer relevancy) is language judges/interviewers already speak. Evaluate it two ways: (i) as the scoring engine inside F1/F4 (her layer = the deterministic, seeded, versioned harness AROUND ragas — reproducibility is her differentiator, not the metrics themselves); (ii) its docs/repo as a source for golden-set and metric-design patterns. Verify current repo state, quickstart, and determinism/seeding behavior of its LLM-judge calls (a known reproducibility gap she can point at — strong demo beat).

*Per-repo verification (every candidate, no exceptions):*
8. Fetch the repo README → confirm: quickstart ≤ ~15 min (`pip install`/`npm i`/`docker compose up`, no GPU, no k8s), active (commit within ~60 days), permissive license, and a visible extension seam (pluggable retriever interface / middleware / hooks / eval config — name the actual file or interface if findable).

*Data recorded per candidate:* stars · last commit · language · install path · extension seam (named) · which framing F1–F4 it serves · sponsor-tool slots · Digg or supplement provenance · one-line 2-hour-risk.
- Candidate filter criteria (each repo scored in the table):
  - Clones + runs locally in <15 min (clear quickstart, no GPU/k8s requirement)
  - Has a clean retrieval or agent-loop seam to extend (pluggable retriever / middleware / hooks)
  - Room to add exactly one of: hybrid retrieval (BM25+vector+rerank), eval harness (golden set + LLM-judge + regression gate), or tracing/observability
  - Sponsor-tool fit: can OpenAI/Convex/Cloudflare/Linkup slot in without contortion
  - Demo-able before/after metric in 2 hours (e.g., retrieval hit-rate on a small golden set)
- Output: table of ~6–10 candidates → shortlist top 3 with a one-paragraph "what you'd build on it" each.

### Step 2 — Judge/mentor research (Bay Area only, reputable sources)

People to verify location for, then deep-research only those Bay Area-based (roster as provided by Isha from the event listing, 2026-07-10 — titles unverified until Step A):

- **Judges:** Abhishek Kankani (Head of Engineering, Cloudflare), Aritra B (Principal PM, Intuit), Tosh Rayadhurgam (Head of Advanced AI, Stripe), Wayne Sutton (Head of Community & Startup Program, Convex)
- **Mentors:** Akshay Potnis (Dir. Product Design, Adobe), Sarang Bhutada (Product Lead, Gusto), Nehal Agarwal (GTM Engineer, Invigilo AI), Gautam Bagal (Product Lead, Stanley Black & Decker)
- **Hosts:** Udayan (GrowthX), Saloni Aggarwal (TandemAI), Kishan Rao (Okta)

Method per person: LinkedIn/company pages only to confirm role + Bay Area location (hard filter — India-based marked "skipped"); then **exclude marketing content** and hunt for first-party technical material — engineering blog posts they authored (e.g., Cloudflare blog, Stripe engineering/docs), conference talks, open product documentation for the thing they own (e.g., Cloudflare Workers AI / AI Gateway docs, Stripe agent-payments docs, Convex docs), GitHub profiles, patents/papers.

Output table columns: Name | Role | Bay Area? (skip if no) | What they own | First-party sources found (links) | AI-engineering topics they'd light up on | **Actionable hook for Isha** (concrete: "use Cloudflare AI Gateway for the observability layer and ask him about X", "frame eval determinism in Stripe-reliability terms", etc.)

**Anchor-person selection (the key output):** rank the Bay Area people by (1) depth/quality of self-authored engineering material, (2) relevance to the ML-SWE reliability seam, (3) likelihood of hands-on engagement (judges who mentor vs. drop in). Name **ONE ideal mentor** the whole project is designed to impress, plus one fallback. The recommended layer and repo are then chosen to maximize collaboration surface with that person.

### Step 3 — Synthesis & recommendation

- Cross the three inputs: her story anchors (above) × the anchor person's interests × sponsor tools.
- Recommend ONE focus layer and ONE repo, chosen to maximize collaboration surface with the anchor mentor, with the feedback-iteration plan (who to approach, in what order, with what question — her "20 iterations with the right experts" networking plan; **expert-only feedback, no random-attendee input**).
- Recommendation criterion throughout: **engineering depth over product polish** — the build showcases her engineering skills, not product-building.
- **Skill-hardening map:** for the recommended build, list which production-reliability skills each build step exercises (fault tolerance, error handling, checkpointing, validation boundary, observability) — so post-hackathon she can fold the earned tasks back into her Primavera answer's 4 open gaps.
- Enumerate the **ML-collab seams**: 4–6 concrete decisions in the build that she should NOT make alone but take to ML engineers in the room (e.g., chunk-size/overlap policy, dense-vs-sparse fusion weighting, reranker choice, LLM-judge prompt validity, golden-set composition). Each seam = a networking conversation with a built-in reason to follow up ("here's the before/after from your suggestion").
- Proposed (decision #7, confirm at Chunk 3 checkpoint): two-person split — Isha owns the reliability/eval-harness track (her story), Devansh owns the pipeline/sponsor-integration track — ~4 person-hours total.
- Explicitly note the behavioral-story payoff: which existing story each build choice strengthens (e.g., the build becomes live evidence for the `root-cause-debugging` answer she hasn't drafted yet, and a modern retelling of the Primavera seam).
- **Brand-phrase finalization:** confirm the handshake phrase (decision #8) against the anchor mentor's own vocabulary from their first-party writing, and ensure the demo visibly embodies it (every eval run seeded, versioned, re-executable on demand — so "re-run it in front of you" is literally a button she can press mid-conversation). Include the tuned final wording + a 15-second elaboration script in the report.
- Include 3–5 test cases for the eventual hackathon build (per her standing rule that plans include tests with hard grey cases) — e.g., a query where BM25 wins and vectors lose, a query where reranking flips the answer, an eval case where the answer is fluent but ungrounded ("wrong number in a right one's costume" case). These go in the report as build-day acceptance checks, not run now.

## Orchestration

- Parallelize sub-agents *within* Chunk 1 (split the people list if needed); **Chunk 2 launches only after the Chunk 1 checkpoint with Isha** — repo scoring depends on the surviving framing candidates. Synthesis in the main loop.
- No writes to her TechDiscussion repo — output goes to a standalone report file she can review (per the repo's strict provenance rules, nothing gets recorded as her account).

## Verification

- Every judge claim must cite a first-party or engineering-grade source (their own posts/docs/talks); marketing pages get discarded.
- Repo candidates verified by fetching each repo's README quickstart — a candidate stays on the shortlist only if the setup path is confirmed short (no GPU, no k8s, plain `pip install`/`npm i` + API key).
- India-based people explicitly marked "skipped — not Bay Area" so coverage is auditable.

### Research-process test cases (incl. hard grey cases)

| # | Test case | Expected behavior |
|---|-----------|-------------------|
| T1 | Digg yields <3 usable repos | Fall back to GitHub supplement, but report states Digg count explicitly — no silent substitution; provenance column distinguishes sources. |
| T2 | Judge has only marketing/press footprint, zero first-party material | Row records "no first-party source found"; person drops in anchor ranking; gap never filled with speculation. |
| T3 | GREY: person's location ambiguous (e.g., LinkedIn says Bay Area, company page says Bangalore, or relocation mid-2026) | Marked "location unverified" with both sources cited; excluded from anchor ranking but kept in table; flagged to Isha at checkpoint rather than silently included/excluded. |
| T4 | GREY: repo README claims 5-min quickstart but actually requires GPU/k8s/paid service buried in docs | Fails per-repo verification step 8; recorded with the disqualifying evidence, not just dropped — so the shortlist is auditable. |
| T5 | GREY: two people share the judge's name and both plausibly fit (e.g., multiple Abhishek Kankanis) | Identity marked ambiguous with candidate profiles listed; no deep-dive until resolved; surfaced at checkpoint. |
| T6 | Anchor ranking: top person by material depth is NOT relevant to reliability/evals/retrieval (e.g., pure design leader) | Ranking shows both scores separately; recommendation explains the tension instead of silently reweighting. |
