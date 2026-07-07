<!-- File Purpose: Story-fit scorecard for this question, then a log of decisions + their basis. -->
# decision-log.md — "a technical trade-off" question

## Angle scorecard (2026-07-07)
For THIS question, brainstorm candidate story×angle pairs and pick the **strongest angle** (not the best story; same-story rows are fine). Score each angle on how strongly it shows the dimension Isha wants to showcase (e.g. ML-SWE collab) and its narrative strength.

| Story × angle | Shows the chosen dimension? | Narrative strength | Notes / provenance |
|---|---|---|---|
| Primavera: fidelity vs runtime/determinism | Strong — maps to 4/4 Reliable rows + 3/3 Reusable rows | Solid, resume-anchored (~40% perf); clean ML/SWE split | Already has an approved 7-signal/10-task rubric built for it |
| Quotr: hybrid retrieval accuracy vs latency | Strong but narrower — fits Reusable well, weaker on checkpointing/reproducibility | Crispest, most quantified (>90% grounding vs <2s latency); most current topic | Real account pending (Task 4); rubric would need building from scratch |
| LetsTransport: vehicle classification build-vs-buy | Weak — build-vs-buy doesn't map cleanly to Reliable/Reusable rows | Weakest — verbal-only provenance, not in resume | |
| **Pick (strongest angle)** | **Primavera** — reuses approved rubric, continues Task 1 already queued in `session.md` | | |

## Decisions + basis
| Date | Decision | Basis |
|------|----------|-------|
| prior | Approve the Primavera answer-eval (4 signals + 10 tasks, pass/fail, scoped to Reliable + Reusable). | Prior voice session (summary not retained). Now locked in `qc-eval.md`. |
| 2026-07-06 | Extend rubric to 7 signals: add structure signals 5–7 (impact opener, explicit stakes, two failure beats) from the 6-part answer template (now `qna/_template/answer.md`). | Isha's approval this session: the 4-signal rubric passed a voice answer that had no impact opener, no explicit stakes, and zero failure beats — content signals are blind to narrative shape. |
| 2026-07-07 | Story selection for this question: **Primavera**, angle = fidelity vs. runtime/determinism. | Isha's choice from the 2026-07-07 angle scorecard (above) — reuses the approved rubric and continues the work already queued in `session.md`, over Quotr's stronger-but-unbuilt angle and LetsTransport's weak fit. |
| 2026-07-07 | Removed the repo's fact-boundary rule (real-vs-synthetic account gate). `answer.md`'s current draft is now treated as final content, not a placeholder pending a "real" rewrite — only the structure-signal gaps (impact opener, stakes, failure beats) remain open. | Isha's direct instruction: the resume bullet + product teardown already give enough grounding; the distinction was adding a queued task without changing what the answer needs to say. Pruned repo-wide — see CLAUDE.md, handoff-eval.md (dropped Gate check G6), session.md, and the other qna/personal-context files. |
| 2026-07-07 | Enriched the 10-task checklist: each task now states what the ML owner defines vs. what you (SWE) build, instead of a bare bucket name. Content signals 1–4 and threshold unchanged. | Isha's direct instruction to update this qc-eval using the DS/SWE ownership enrichment (the LiDAR-derived split now in `syllabus/ml-swe-collab.md`), applied to Primavera specifics. |