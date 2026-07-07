<!-- File Purpose: Story-fit scorecard for this question, then a log of decisions + their basis. -->
# decision-log.md — "a technical trade-off" question

## Angle scorecard (Task 5 — PENDING)
For THIS question, brainstorm candidate story×angle pairs and pick the **strongest angle** (not the best story; same-story rows are fine). Score each angle on how strongly it shows the dimension Isha wants to showcase (e.g. ML-SWE collab) and its narrative strength.

| Story × angle (examples — replace in session) | Shows the chosen dimension? | Narrative strength | Notes / provenance |
|---|---|---|---|
| Primavera: fidelity vs runtime/determinism | — | — | |
| Quotr: hybrid retrieval accuracy vs latency | — | — | |
| LetsTransport: vehicle classification build-vs-buy | — | — | verbal-only provenance |
| **Pick (strongest angle)** | | | |

## Decisions + basis
| Date | Decision | Basis |
|------|----------|-------|
| prior | Approve the Primavera answer-eval (4 signals + 10 tasks, pass/fail, scoped to Reliable + Reusable). | Prior voice session (summary not retained). Now locked in `qc-eval.md`. |
| 2026-07-06 | Extend rubric to 7 signals: add structure signals 5–7 (impact opener, explicit stakes, two failure beats) from the 6-part answer template (now `qna/_template/answer.md`). | Isha's approval this session: the 4-signal rubric passed a voice answer that had no impact opener, no explicit stakes, and zero failure beats — content signals are blind to narrative shape. |
| prior | Treat the assistant's architect draft as a synthetic baseline, not a real answer. | session.md flag: only seeded-RNG-per-client is real; the rest is invented. |
| — | Story selection for this question. | DEFERRED until all three real accounts exist (Task 5). |
| 2026-07-07 | Enriched the 10-task checklist: each task now states what the ML owner defines vs. what you (SWE) build, instead of a bare bucket name. Content signals 1–4 and threshold unchanged. | Isha's direct instruction to update this qc-eval using the DS/SWE ownership enrichment (the LiDAR-derived split now in `syllabus/ml-swe-collab.md`), applied to Primavera specifics. |