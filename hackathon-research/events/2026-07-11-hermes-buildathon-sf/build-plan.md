<!-- File Purpose: Build plan + tonight's queue — Hermes Buildathon SF. External research, not Isha's facts. -->
# Build Plan — 2h slice of the 8h event

## TONIGHT'S QUEUE (ordered; **~150 min total** — audit v2 corrected the "~90" label; if evening overruns: #6 cuts to 5 pairs, #6/#7 run parallel with Devin)

| # | Task | Time | Pass/fail |
|---|------|------|-----------|
| 0a | **Text Devansh FIRST** (audit v2: the whole 2h split branches on his answer): "Touched Convex/TypeScript? You own golden-set store + live dashboard tomorrow — yes/no" | 5 min | RAT A6 → decision #7 |
| 0b | Check Luma emails: you + Devansh both "approved/going" (not waitlist); screenshot QR | 2 min | RAT A10 |
| 1 | **Devin AI deep-dive on kotaemon** — paste the brief below into Devin (your credentials); runs while you do #2–6 | 5 min to launch | Output = repo teardown for tomorrow's tech discussions |
| 2 | Fork kotaemon; `docker compose up` the `main-lite` image; time-to-first-answer | 30 min | >20 min → **fire fallback: get-convex/rag tonight** (RAT A2) |
| 3 | Spike: call the QA pipeline from Python REPL outside Gradio; print retrieved chunks + answer | 20 min | Fails in 30 min → fallback repo (RAT A2) |
| 4 | Cloudflare AI Gateway up; base-URL swap; same request 2× → confirm cache-HIT + identical bytes; then 5 seeded direct calls → diff drift | 20 min | **THE riskiest assumption (A1).** Fail = better story: run-hash/record-replay becomes the thesis ("I don't trust the model to be deterministic — I make the RUN the unit of reproducibility") |
| 5 | Pre-create + fund: OpenAI key, Convex project, Cloudflare account; pre-ingest ~10 docs | 15 min | RAT A7 |
| 6 | Draft 8 golden Q/A pairs incl. grey cases (BM25-wins query; fluent-but-ungrounded) — as DRAFT so experts amend tomorrow (seam preserved). CUTTABLE to 5 pairs; parallel with Devin | 30 min | RAT A11 |
| 7 | Pin ragas version; run one metric 2× with `RunConfig(seed=42)`; save the diff → the open-problem exhibit becomes a reproducible artifact (frame: "even the standard library punts on this — mine detects and bounds it"). Parallel with Devin | 15 min | RAT A9 |
| 8 | Post (recommended, not optional — audit v2 raised A8: a GrowthX room may hold few ML engineers; this pre-recruits them): "Bringing a deterministic eval harness to #HermesBuildathon — who's working on agent reliability?" | 5 min | Ledger P2 / RAT A8 |
| 9 | Check Ishita's X/LinkedIn for a "mentoring tomorrow" post; **read Luma event RULES (does a fork+harness count as "a build"? → if murky, lead with the upstream-PR framing) + judging format (assigned tables? → if yes, Tosh may never see the demo — bring results to him directly)** | 8 min | RAT A3, A4, A15, A16 |
| 10 | **Failure rehearsal — trigger tomorrow's pain on purpose, sit with it:** (1) eval with cache OFF → watch scores wobble → speak the reframe out loud ("I make the run the unit of reproducibility"); (2) malformed golden row → watch the validation boundary fail loudly; (3) kill ingestion mid-run → recover calmly | 30 min | Craft: rehearsed pain = calm at the venue; unrehearsed reframes don't fire under pressure |

## DEVIN BRIEF (paste as-is)

> Research the repo github.com/Cinnamon/kotaemon deeply. I'm adding a deterministic, seeded, versioned eval harness around its RAG pipeline tomorrow in a 2-hour hackathon window, and I need to discuss its internals fluently with senior engineers. Produce:
> 1. Architecture map: how a query flows end-to-end — Gradio UI → `ktem.reasoning.simple.FullQAPipeline` → retrievers (hybrid full-text + vector, rerank) → LLM; name the actual classes/files at each hop.
> 2. The programmatic (non-UI) invocation path: minimal Python to run ingestion + one QA call headlessly; where retrieved chunk IDs and scores are accessible.
> 3. Configuration surfaces: everything in `flowsettings.py` that controls retrieval (hybrid weights, rerank on/off, top-k, chunking params); how to swap the OpenAI base URL to a proxy/gateway for ALL LLM + embedding + rerank calls (env var vs code).
> 4. Determinism audit: every source of nondeterminism in a QA run (LLM sampling, embedding calls, retriever tie-breaking, async ordering, timestamps in prompts) — file/line specific.
> 5. Extension seams: cleanest place to wrap the pipeline with a seeded golden-set runner without forking core logic; where ReAct/ReWOO reasoning pipelines live and what per-step (trajectory) data they expose.
> 6. Gotchas: known issues with the `main-lite` Docker image, ingestion speed on ~10 PDFs, RAM footprint, anything that breaks on macOS.
> Output as a briefing doc I can read in 20 minutes.

## 2H BUILD (tomorrow, clock starts after kickoff)

| Time | Isha (eval spine) | Devansh (proposed — pending #8 tonight) |
|------|-------------------|------------------------------------------|
| 0:00–0:15 | Bring up pre-pulled kotaemon; verify Gateway routing | Convex project live; golden-set table schema |
| 0:15–0:45 | Seeded runner wrapping FullQAPipeline; run-hash (inputs+seed+model+chunk-IDs+prompt-version) | Load golden set; wire results → Convex |
| 0:45–1:30 | RAGAS metrics, judge temp=0; judge-variance gate; golden-row validation (loud errors) | Reactive dashboard: runs, hashes, pass/fail |
| 1:30–1:50 | Failure buckets (retrieval/chunking/generation); re-run demo + hash match | Cloudflare log view; cache-hit badge |
| **1:50–2:00** | **REHEARSE the 90-sec demo (audit v2: unrehearsed reframes don't fire under pressure)** | Film a take (recap-post asset) |

## 90-SECOND DEMO BEAT SHEET (audit v2 F4 — a full eval run takes minutes; never run it live)

1. **Pre-run table on screen** (already executed): 20 golden cases, pass/fail, run-hash. ~15s.
2. **ONE live re-run** (cache hit = instant): hash matches, byte-identical. "Same inputs, same answer — provably." ~25s.
3. **The drift beat:** "Without the cache, here's the measured drift across 5 seeded calls — the API only promises best-effort. That's the point: I don't trust the model to be deterministic, I make the *run* the unit of reproducibility." ~30s.
4. **Revenue sentence** (PM judges): "Silent AI failures cost you customers and refunds — this catches them before they ship." ~10s.
5. **Close:** "And it's going back upstream as a PR to the 25.5k★ repo." ~10s.
| Bonus | hermes-agent memory-vs-memoryless (Ishita hook) — only if spine green | CI gate via promptfoo-action (ledger W1) |

## BUILD-DAY ACCEPTANCE TESTS (incl. grey cases)

| # | Test | Expect |
|---|------|--------|
| 1 | BM25-wins query (exact code/part-number term) | Hybrid beats pure-vector on hit@k |
| 2 | Rerank toggle flips an answer | Metric table shows the flip; both runs reproducible |
| 3 | Fluent-but-ungrounded answer ("wrong number in a right one's costume") | Judge FAILS it; hard-negative from an ML engineer's amendment |
| 4 | GREY: golden row cites chunk-ID absent from corpus | Harness errors loudly, never silently passes |
| 5 | GREY: same query, cache off vs on | Hash equal with cache; drift flagged (not hidden) without |
| 6 | GREY: judge at temp 0.7 | Variance gate trips → eval marked non-reproducible |

## PLAIN-ENGLISH VERSION (no jargon)

**The project:** kotaemon = a librarian that answers questions about your PDFs. Two flaws: same question twice can give different answers, and wrong answers still LOOK right. You build the **report card machine**: 20 questions with known answers + known pages → machine grades the librarian, labels WHY each failure failed, stamps every run with a **receipt number** so anyone can re-run and get identical grades.

**IN:** PDFs · 20 known-answer questions · settings dials. **OUT:** report card (✅/❌, score, why-it-failed label: wrong page / chopped page / made-it-up) + receipt number.

## WHAT'S ON SCREEN WHEN (demo readiness per build step)

| Clock | Screen shows | Demo? | Feedback an expert gives on THIS screen |
|---|---|---|---|
| Tonight | Terminal: same question 2× → same answer, same receipt | Devansh only | — |
| 0:15 | kotaemon chat answering a PDF question | Barely | "Your questions are too easy — add this breaking type" |
| **0:45** | **Plain table: 20 Q, ✅/❌, score, receipt** | **YES — iterations start here** | "Q7 shouldn't pass" · "add a trick question that sounds right but isn't in any doc" → re-run → it catches it |
| 1:30 | + why-failed labels + grader-consistency warning | Richer | "I'd call #12 slicing, not search" · Ishita: "does it repeat a mistake it made an hour ago?" |
| 2:00 | Live page: all runs, receipts, before→after arrows | Full | Suggest one dial → ~3-min re-run → arrow moves with their name on it |

Notes: full re-run ≈ 2–4 min of AI calls — chat while it runs; that's the 3–5 min iteration rhythm. Ishita's pointed question: "how would you check a caught mistake never comes back?"

## FEEDBACK-LOOP I/O SPEC (what the app consumes/produces per iteration step)

Invariant: **networking log = experiment log.** Suggestion → config delta → new run-hash → attributable to a person. Convex run history doubles as the conversation record.

| Step | App INPUT | App OUTPUT |
|---|---|---|
| 0 Baseline | Golden set (20 Q + gold chunk-IDs) · corpus · config snapshot (chunking, RRF k, rerank, top-k, judge prompt, seed, temp=0, pinned model) | Run record: run-hash · per-case retrieved-IDs/scores, answer, judge verdicts, bucket · aggregates (hit@k, MRR, faithfulness, judge variance) → Convex + Gateway logs |
| 1 Seam question | — (read-only) | Current metric + config value under discussion |
| 2 Apply suggestion | ONE versioned config delta (k, overlap, hard-negative, judge prompt) | New run record, new run-hash (same seed = fair comparison) |
| 3 Before/after | Two run-hashes | Delta view: metric X→Y, flipped cases, bucket shifts |
| 4 Close/capture | Person + seam + hash-pair | Named delta screenshot → /evidence/ (= the T+1 DM artifact) |

Demo lines this buys: "fair comparison is enforced, not promised" (one knob, same seed) · "every conversation today is a reproducible experiment — pick any hash, re-run it."

## ITERATION DEFINITION (RAT A8)

One iteration = ask a seam question → apply → show before/after (3–5 min). **Floor: 8–10 logged; 20 = stretch.** Log each: who, seam, suggestion, metric delta.
