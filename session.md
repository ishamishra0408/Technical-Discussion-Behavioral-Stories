<!-- File Purpose: Pure persistent state — progress, tangents, current, next. NEVER pasted into voice (that's voice-session.md). Updated only by the gate at Flow step 5. Git = history. -->
# session.md — persistent state

**Last session goal:** Fix Primavera answer.md's structure gaps (impact opener, explicit stakes, two failure beats) and re-run qc-eval (tradeoff-system-design).
**Date:** 2026-07-08 · **Since last:** Reworked all 7 Primavera trade-off signals to be eng-doc-grounded (dropped the unsupported "more iterations" lever and the runtime axis) — Isha approved the revision after a side-by-side review, logged in `decision-log.md`. Rebuilt `answer.md` as v2 (problem-first opener, explicit stakes, two narrated failure beats). Direct-scored v2 against the revised rubric: 7/7 signals PASS, but only 6/10 tasks PASS — 4 production-hardening tasks present in v1 (checkpointing, logging/observability, config/parameterization, observability-under-load) got dropped when the narrative refocused on fidelity-vs-reproducibility.

## Progress
| # | Task | Status |
|---|---|---|
| 1 | Primavera: close the 4-task gap in answer.md v2 (checkpointing, logging/observability, config/parameterization, observability-under-load) — fold back in or formally rescope the task checklist, then re-run qc-eval | PENDING ← current |
| 2 | LetsTransport: draft answer → eval → test → follow-ups | PENDING |
| 3 | Quotr: draft answer → eval → test → follow-ups | PENDING |
| 4 | Per question: brainstorm angles across stories → pick strongest angle → craft answer | PENDING |

Tangents:
- E2E flow test run 1 still in progress — results in `ops/e2e-tests.md` (carried forward, unchanged).
- LiDAR "blend" story (modern ML/infra reframe) drafted mid-session by voice, then parked at Isha's direction to refocus on Primavera — unfiled, heavy inference, not logged anywhere else yet.
- Canonical-home question unresolved: should Primavera's rich narrative content (Divanch, P80, CRUD-API framing) live inline in `answer.md` as now, or partially link to `personal-context/stories/primavera.md`? Needs a decision-log entry next session.

Failures (logged from the voice session, per contract):
- Voice repeatedly mis-tracked whether the Primavera eng doc was in its thread context, requiring multiple corrections from Isha — watch for paste-persistence issues in future voice sessions.
- Voice blended sources without attribution early on (glossed "statistical realism" as "statistical fidelity"); corrected — per-claim provenance tagging is now standard practice for this question.
- `syllabus/ml-swe-collab.md` (named in the briefing as the rubric's source of truth) was reportedly never in voice's context this session, despite being included in the compiled `voice-session.md` — worth confirming that section actually carries through the paste cleanly next time.

## Current state
- **Active question:** "Describe a technical trade-off you made" → qna/tradeoff-system-design/. Story: Primavera. Buckets: Reliable + Reusable.
- `qc-eval.md` rubric revised 2026-07-08 (signals 1, 3, 4, 5 reworded to be eng-doc-grounded; signals 2, 6, 7 and the 10-task checklist unchanged) — Isha-approved, logged in `decision-log.md`.
- `answer.md` replaced with v2 (determinism-only, problem-first opener). Direct-scored against the revised rubric: **7/7 signals PASS, 6/10 tasks PASS** — below the pass threshold. Structure signals (5–7) and the core trade-off signals (1, 3, 4, 6) all land; the 4-task gap (checkpointing, logging/observability, config/parameterization, observability-under-load) is open.

## Next
Decide how to close the 4-task gap in `answer.md` v2 — either write the missing production-hardening details back in (as additional beats) or formally rescope `qc-eval.md`'s task checklist to match the narrower determinism-only frame. Then re-run qc-eval once more to confirm a full pass.
