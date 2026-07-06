<!-- File Purpose: One line per structural change to the system itself (files/zones/flow), with basis. Content changes stay in qna/*/decision-log.md. -->
# refactor-log.md — system change history

| # | Date | Change | Basis |
|---|------|--------|-------|
| 1 | 2026-07-06 | Restructure: created `reference/` (unverified research zone) + `ops/` (maintenance zone); teardown moved out of personal-context/ and pruned 50→16 lines; syllabus compacted to a 14-row rubric with LiDAR examples split to reference/; deleted aspirational "ML-adjacent work" table, `qna/hardest-technical-problem/` stubs, `syllabus/observability.md` stub; `qna/_template/` replaces `answerTemplate.md` (instantiate-on-activation); session.md got a ≤80-line budget + eviction rules; regenerate-recipe moved to qna sources. | ops/quality-reports/2026-07-06-audit.md |
| 2 | 2026-07-06 | Flow v2: "initiate" wizard (≤3 clarifying questions) compiles a goal-scoped `voice-session.md` briefing (committed each initiate); `session.md` reduced to pure persistent state, never pasted into voice; handoff-eval split into Compile checklist (pre-handover) + Gate checks (pre-merge); story summaries seeded into `personal-context/stories/*.md`; eviction/re-stamp mechanics retired. | Isha's phone walkthrough exposed the state/payload conflation; her design, approved plan. |
