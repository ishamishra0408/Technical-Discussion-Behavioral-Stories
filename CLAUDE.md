<!-- File Purpose: Router + guardrails. handoff-eval.md runs on the session.md pasted BACK from voice, before commit — never on fetch. -->
# CLAUDE.md — Router & Rules (read first)

Canonical source of how sessions run. `session.md`'s header is compiled from here — edit rules here only.

## Flow (the loop — do not change without explicit instruction)
1. **Fetch:** user asks Claude Code for the current `session.md`. Check its ≤80-line budget (evict per the rules in its header comment), then hand it over as a paste-ready block. **No eval at this step.**
2. **Voice:** user pastes it into Claude voice chat, converses; voice generates a NEW `session.md` as its conclusion. Voice enriches (talk + search, no repo access).
3. **Return:** user pastes the new `session.md` back into Claude Code.
4. **Gate:** run `handoff-eval.md` on the pasted version — verdict and output format live in `handoff-eval.md §Output`, not here. On pass only: re-stamp SESSION PERSISTENT from this file (`→voice` lines), fold voice's SESSION HANDOFF into `session.md`, commit; the commit is the session diff.

Voice outputs only the SESSION HANDOFF half — it never rewrites Persistent (Contract, Rules, Stories, Skills table); Claude Code recompiles those from canon at every commit.

## File Map (name → purpose)
- `CLAUDE.md` — this file. Router + canonical rules; read by Claude Code only.
- `session.md` — single live handoff, pasted into voice; the repo-blind agent's entire context. ≤80-line budget. Git = history.
- `handoff-eval.md` — commit gate; pass/fail completeness checks on voice's returned handoff before commit.
- `syllabus/` — grading dimensions. `ml-swe-collab.md` — compact DS-vs-SWE rubric (5 buckets / 14 tasks); mirrors the read-only Google Doc. (Future dimensions, e.g. observability, get added here when a task needs them.)
- `personal-context/` — true facts only, synthetic-free: `resume.md` · `stories/` (`primavera.md`, `letstransport.md`, `quotr.md` — single source of truth for stories; currently empty stubs pending Tasks 1/3/4).
- `reference/` — ⚠️ external/unverified research, never facts about Isha: `primavera-weather-teardown.md` (LLM-generated snapshot) · `lidar-examples.md` (rubric examples from a different project).
- `qna/_template/` — skeletons (`answer.md` 6-part template · `qc-eval.md` · `decision-log.md` · `sources.md`). A question activates by copying `_template/` to `qna/<slug>/`.
- `qna/<slug>/` — one folder per ACTIVE behavioral question (now: `tradeoff-system-design/`): `answer.md` (Git = versions) · `qc-eval.md` (scores the ANSWER vs a dimension) · `decision-log.md` (story-fit scorecard + decisions) · `sources.md` (references + regenerate recipes).
- `ops/` — system maintenance: `quality-reports/` (dated audits) · `refactor-log.md` (structural change history).

## Rules
<!-- `→voice` = this line compiles into session.md's ⚓ Operating Contract at Persistent re-stamp. Untagged = repo-side only. -->
- →voice Persona: Senior Principal Engineer — brilliant at brainstorming the latest engineering/software concepts, highly opinionated, a sparring partner upskilling Isha to sound like a top-1% San Francisco engineer.
- →voice End of session: output a new SESSION HANDOFF block only (date, progress, tangents, current state + active rubric, next action); never rewrite Persistent; never self-run handoff-eval.
- →voice Split multi-intent speech into separate items; drop none.
- →voice One loop per item; update the progress table after each.
- →voice Capture → Fulfill → Refocus → Persist: answer tangents, log them, return to the top task.
- →voice Confirm before repo writes or decision-locks (commit, approve, delete). Else just go.

## Guardrails (hard)
- →voice Real vs synthetic: flag anything invented; never sell it as Isha's account. `personal-context/` is synthetic-free.
- →voice One source of truth: stories live once in `personal-context/stories/`; elsewhere link, never restate.
- →voice Skills-table Google Doc is read-only; `syllabus/ml-swe-collab.md` mirrors it.
- →voice No speculative drafts: one clarifying question, then small confirmed steps.
- Scope each qna's eval to what that question actually tests.

## Two evals, different objects
- `handoff-eval.md` — commit gate: is the handoff pasted back from voice complete enough for the next session to continue? Runs at Flow step 4 only. (completeness/continuity, NOT accuracy)
- `qna/*/qc-eval.md` — is the ANSWER good vs a syllabus dimension? (per question)