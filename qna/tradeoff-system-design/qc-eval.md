<!-- File Purpose: Scores the ANSWER in answer.md against one syllabus dimension (ML-SWE collaboration + production readiness). Pass/fail, no partial credit. -->
# qc-eval.md — Answer QC · "a technical trade-off" (Primavera)

**Scores:** `answer.md` — the behavioral answer. NOT the story's factual truth, recency, or metrics.
**Dimension:** `syllabus/ml-swe-collab.md` (skills table) → **Reliable + Reusable** buckets.
**Method:** pass/fail per line, no partial credit.
**Status:** APPROVED / locked. Change the rubric only with a new approval; log the change in `decision-log.md`.

## Purpose
Test whether the answer shows you understand the ML-SWE collaboration seam, the genuine trade-off between the ML owner's goals and yours, and how you made the system production-ready.

## Signals — narrative clarity (all 4 must pass)
1. Names the ML owner **and** their constraint — statistical fidelity via more Monte Carlo iterations.
2. Names your SWE bucket **and** constraint — Reliable + Reusable: overnight completion, reproducibility across clients, graceful failure.
3. States the real trade-off — fidelity vs. runtime and determinism.
4. Explains how you resolved it — seeded RNG, configurable iterations, a validation boundary, or your actual approach.

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
All 4 signals pass **AND** all 10 tasks pass → answer is strong, ready for follow-up iteration.

## Run log
| Date | Answer version | Signals | Tasks | Result | Note |
|------|----------------|---------|-------|--------|------|
| prior | synthetic architect draft | 4/4 | 10/10 | PASS | ⚠️ Pass is on SYNTHETIC content — validates the rubric, not a real answer. |
| — | real account | — | — | PENDING | Task 1: capture the real story, then re-run. |