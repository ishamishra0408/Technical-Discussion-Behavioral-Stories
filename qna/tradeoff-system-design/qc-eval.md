<!-- File Purpose: Scores the ANSWER in answer.md against one syllabus dimension (ML-SWE collaboration + production readiness). Pass/fail, no partial credit. -->
# qc-eval.md — Answer QC · "a technical trade-off" (Primavera)

**Scores:** `answer.md` — the behavioral answer. NOT the story's factual truth, recency, or metrics.
**Dimension:** `syllabus/ml-swe-collab.md` (skills table) → **Reliable + Reusable** buckets.
**Method:** pass/fail per line, no partial credit.
**Status:** APPROVED / locked. Change the rubric only with a new approval; log the change in `decision-log.md`.

## Purpose
Test whether the answer shows you understand the ML-SWE collaboration seam, the genuine trade-off between the ML owner's goals and yours, and how you made the system production-ready.

## Signals — narrative clarity (all 7 must pass)
1. Names the ML owner **and** their constraint — statistical fidelity via more Monte Carlo iterations.
2. Names your SWE bucket **and** constraint — Reliable + Reusable: overnight completion, reproducibility across clients, graceful failure.
3. States the real trade-off — fidelity vs. runtime and determinism.
4. Explains how you resolved it — seeded RNG, configurable iterations, a validation boundary, or your actual approach.

Structure — from `qna/_template/answer.md` (added 2026-07-06; the content signals above are blind to narrative shape):
5. **Opens with the resume bullet / business impact** — the one-liner outcome before any mechanics.
6. **Stakes & people named explicitly** — what breaks and who's affected if this fails, not implied.
7. **Two concrete failure beats** — two narrated "here's how it would have failed" moments, not a list of mitigations.

## Task checklist — scoped to Primavera (all 10 must pass)
Reliable
- [ ] Checkpointing / fault tolerance
- [ ] Error handling / graceful failure
- [ ] Logging / monitoring / observability
- [ ] Reproducibility / containerization

Reusable
- [ ] Configuration / parameterization
- [ ] API / service endpoint
- [ ] Refactoring / modularization

Primavera-specific
- [ ] Graceful degradation on bad inputs
- [ ] Data validation
- [ ] Observability under load

## Pass threshold
All 7 signals pass **AND** all 10 tasks pass → answer is strong, ready for follow-up iteration.

## Run log
| Date | Answer version | Signals | Tasks | Result | Note |
|------|----------------|---------|-------|--------|------|
| prior | synthetic architect draft | 4/4 | 10/10 | PASS | ⚠️ Pass is on SYNTHETIC content — validates the rubric, not a real answer. Scored under the old 4-signal rubric. |
| 2026-07-06 | voice paraphrase of synthetic draft | 4/7 | 10/10 | FAIL | Fails structure signals 5–7: no impact opener, stakes implied only, zero failure beats. Also ⚠️ SYNTHETIC recycled — not the real account. |
| — | real account | — | — | PENDING | Task 1: capture the real story, then re-run. |