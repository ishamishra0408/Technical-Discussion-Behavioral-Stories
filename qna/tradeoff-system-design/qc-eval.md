<!-- File Purpose: Scores the ANSWER in answer.md against one syllabus dimension (ML-SWE collaboration + production readiness). Pass/fail, no partial credit. -->
# qc-eval.md — Answer QC · "a technical trade-off" (Primavera)

**Scores:** `answer.md` — the behavioral answer. NOT the story's factual truth, recency, or metrics.
**Dimension:** `syllabus/ml-swe-collab.md` (skills table) → **Reliable + Reusable** buckets, each row split DS/ML owns vs. SWE owns.
**Method:** pass/fail per line, no partial credit.
**Status:** APPROVED / locked. Change the rubric only with a new approval; log the change in `decision-log.md`.
**Revision (2026-07-08):** Signals 1, 3, 4, 5 reworded to be eng-doc-grounded (dropped the unsupported "more iterations" lever and the runtime axis). Isha-approved; see `decision-log.md`.

## Purpose
Test whether the answer shows you understand the ML-SWE collaboration seam, the genuine trade-off between the ML owner's goals and yours, and how you made the system production-ready.

## Signals — narrative clarity (all 7 must pass)
1. Names the ML owner **and** their constraint — statistical fidelity/trustworthiness of the output distribution (not scoped to a specific lever like iteration count).
2. Names your SWE bucket **and** constraint — Reliable + Reusable: overnight completion, reproducibility across clients, graceful failure.
3. States the real trade-off — fidelity vs. reproducibility/determinism (runtime is out of scope for this answer).
4. Explains how you resolved it — seeded RNG, versioned input assumptions, a validation boundary, or your actual approach (configurable iteration count is optional, not required).

Structure — from `qna/_template/answer.md` (added 2026-07-06; the content signals above are blind to narrative shape):
5. **Opens with the problem / business stakes** — a metric-free, problem-first opener is acceptable; resume-bullet numbers are not required and may be deliberately excluded if reintroducing one would reopen a dropped axis (e.g. runtime).
6. **Stakes & people named explicitly** — what breaks and who's affected if this fails, not implied.
7. **Two concrete failure beats** — two narrated "here's how it would have failed" moments, not a list of mitigations.

## Task checklist — scoped to Primavera (all 10 must pass)
Each row must show BOTH sides — what the ML owner defined vs. what you (SWE) built — not just a bucket name.

Reliable
- [ ] Checkpointing / fault tolerance — ML owner defines what per-client simulation state must survive a crash; you implement checkpoint-and-resume so an overnight crash doesn't lose the run.
- [ ] Error handling / graceful failure — ML owner defines invalid inputs (e.g. persistence > 1, negative duration) and what should happen to them; you enforce that validation at the service boundary so one bad client input never kills the whole batch.
- [ ] Logging / monitoring / observability — ML owner defines what a bad simulation run looks like (which outputs are suspect); you log every invocation's inputs/outputs and surface latency/failure metrics so a 3am failure leaves a trail.
- [ ] Reproducibility / containerization — ML owner defines what "same result" means across clients; you implement seeded RNG, configurable per client, so runs are reproducible.

Reusable
- [ ] Configuration / parameterization — ML owner decides which knobs matter (iteration count, seed strategy) and their safe ranges; you expose them as per-client config, not hardcoded.
- [ ] API / service endpoint — ML owner defines the probability-distribution function's input/output contract; you wrap it in a service layer other systems/clients call.
- [ ] Refactoring / modularization — ML owner keeps the probabilistic math isolated and versioned; you build the wrapper/module boundary so the math logic isn't duplicated per client.

Primavera-specific (concrete failure modes the answer must name, not just the bucket)
- [ ] Graceful degradation on bad inputs — a specific invalid weather attribute or simulation parameter, named, and what happened instead of a crash.
- [ ] Data validation — the actual rule enforced at the boundary (e.g. persistence ≤ 1), not just "we validated."
- [ ] Observability under load — a concrete signal (a latency percentile, a failure rate) that surfaced a real problem, not a generic "we had logging."

## Pass threshold
All 7 signals pass **AND** all 10 tasks pass → answer is strong, ready for follow-up iteration.

## Run log
| Date | Answer version | Signals | Tasks | Result | Note |
|------|----------------|---------|-------|--------|------|
| prior | architect draft (current answer.md) | 4/4 | 10/10 | PASS | Scored under the old 4-signal rubric. |
| 2026-07-06 | voice paraphrase of the draft | 4/7 | 10/10 | FAIL | Fails structure signals 5–7: no impact opener, stakes implied only, zero failure beats. |
| 2026-07-08 | answer.md v2 (determinism-only, eng-doc-grounded), direct | 7/7 | 6/10 | FAIL (threshold) | Signals all pass cleanly (structure signals 5–7 now land). But v2's narrower fidelity-vs-reproducibility framing dropped 4 tasks the prior draft had covered: checkpointing/fault-tolerance, logging/observability, config/parameterization (no per-client knob), observability-under-load (no latency/failure-rate signal). Task 2 (error handling), 4 (reproducibility), 6 (API/endpoint), 7 (modularization), 8 (graceful degradation), 9 (data validation) pass. |