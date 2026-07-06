<!-- File Purpose: Scores the ANSWER in answer.md against one syllabus dimension. Pass/fail, no partial credit. Copied from qna/_template/ at question activation. -->
# qc-eval.md — Answer QC · "Tell me about a situation that required you to dig deep to get to the root cause" (Quotr — RAG grounding-accuracy investigation)

**Scores:** `answer.md` — the behavioral answer. NOT the story's factual truth, recency, or metrics.
**Dimension:** `syllabus/ml-swe-collab.md` → Reliable (Error handling/graceful failure · Logging/monitoring/observability).
**Method:** pass/fail per line, no partial credit.
**Status:** DRAFT — lock only with approval; log rubric changes in `decision-log.md`.

## Signals — narrative clarity (all must pass)
1–4. Names the initial (wrong or incomplete) hypothesis; shows at least one dead end pursued before the real cause; states the actual root cause; states the fix/resolution and its measurable outcome.
5. Opens with the resume bullet / business impact.
6. Stakes & people named explicitly.
7. Two concrete narrated failure beats — moments the wrong hypothesis would have shipped a non-fix — not a mitigation list.

## Task checklist — scoped to this question (all must pass)
- [ ] Task 2 — Error handling / graceful failure: the investigation isolates a bad-input or edge case without the whole pipeline failing opaquely.
- [ ] Task 3 — Logging / monitoring / observability: the actual root cause was found via a trail (logs, traces, metrics) rather than guesswork.

## Pass threshold
All signals AND all tasks pass.

## Run log
| Date | Answer version | Signals | Tasks | Result | Note |
|------|----------------|---------|-------|--------|------|
