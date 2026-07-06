<!-- File Purpose: Router + guardrails. On session start, run handoff-eval.md BEFORE chat. TODO -->
# CLAUDE.md — Router & Rules (read first)

Canonical source of how sessions run. `session.md`'s header is compiled from here — edit rules here only.

## Start (Claude Code, before chat)
1. Run `handoff-eval.md` on `session.md`. INCOMPLETE → list gaps, stop.
2. OK → recap `session.md` (3 lines), output a paste-ready block for voice.

## Routing
- `session.md` — single live handoff; read at start, committed at end. Git = history.
- `handoff-eval.md` — ingest gate; checks handoff completeness. Claude Code only, never voice.
- `syllabus/` — grading dimensions. `ml-swe-collab.md` = DS-vs-SWE skills table (17 tasks).
- `personal-context/` — true facts only: `resume.md`, `stories/` (real accounts), `project-docs/` (teardowns).
- `qna/<slug>/` — per question: `answer.md` (Git = versions) · `qc-eval.md` (scores the ANSWER vs a dimension) · `decision-log.md` (story-fit scorecard, then decisions + basis) · `sources.md`.

## Rules
- Split multi-intent speech into separate items; drop none.
- One loop per item; update the progress table after each.
- Capture → Fulfill → Refocus → Persist: answer tangents, log them, return to the top task.
- Confirm before repo writes or decision-locks (commit, approve, delete). Else just go.

## Guardrails (hard)
- Real vs synthetic: flag anything invented; never sell it as Isha's account. `personal-context/` is synthetic-free.
- One source of truth: stories live once in `personal-context/stories/`; elsewhere link, never restate.
- Skills-table Google Doc is read-only; `syllabus/ml-swe-collab.md` mirrors it.
- No speculative drafts: one clarifying question, then small confirmed steps.
- Scope each qna's eval to what that question actually tests.

## Two evals, different objects
- `handoff-eval.md` — is the HANDOFF complete enough to continue? (completeness/continuity, NOT accuracy)
- `qna/*/qc-eval.md` — is the ANSWER good vs a syllabus dimension? (per question)

## Loop
Voice enriches (talk + search, no repo access). Claude Code saves (read/write/commit). One paste bridges them; each end-commit is the session diff.

## End
Fold voice's handoff block into `session.md` (progress, tangents, changed context; regenerate header), commit, read the diff back.