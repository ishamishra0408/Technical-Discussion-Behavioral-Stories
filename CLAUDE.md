<!-- File Purpose: Router + guardrails. "initiate" starts a session: clarifying questions → compile voice-session.md → voice → gate merges the returned handoff into pure-state session.md. -->
# CLAUDE.md — Router & Rules (read first)

Canonical source of how sessions run. `voice-session.md` is compiled from here + the repo — edit rules here only.

## Flow (the loop — do not change without explicit instruction)
1. **Initiate:** user says "initiate". First ask **"What will you work on today?"** → repeat her answer back → she confirms; this locks the session goal. Then read `session.md` (state) and ask the §Initiate questions — max 3, skipping any already unambiguous from the goal or state; default = continue the last goal.
2. **Manifest confirm:** before compiling, name every file that will feed `voice-session.md` — one line each on its purpose for today's goal (session.md state snapshot · syllabus rows · personal-context stories · qna/<slug>/ files · recipe source). Wait for her explicit "okay". Not okay → adjust, re-confirm. **No okay → no compile, no handoff.**
3. **Compile:** build `voice-session.md` from the §Compile recipe. Run the Compile checklist (`handoff-eval.md`). All pass → hand it over as a paste-ready block. **The returned handoff is never evaluated at this step.**
4. **Voice:** user pastes it into Claude voice chat (iOS), converses. Voice enriches (talk + search, no repo access) and ends by outputting a **SESSION HANDOFF block only**.
5. **Return:** user pastes voice's handoff block back into Claude Code.
6. **Gate & merge:** run the `handoff-eval.md` Gate checks on the pasted handoff — verdict format lives there, not here. On pass only: merge the handoff into `session.md` (state), commit `session.md` + `voice-session.md`, read the diff back. Merge rule: every progress row from the briefing's snapshot reappears or is explicitly closed.

## Initiate questions (ask ≤3; derive the rest from state)
- Q1 Which behavioral question? (list active `qna/` folders; "new" → copy `qna/_template/` to `qna/<slug>/`)
- Q2 Which story — or "brainstorm angles across all"? (Primavera / LetsTransport / Quotr / all)
- Q3 Which syllabus bucket(s) to grade against? (Reliable / Reusable / Store / Split / Cloud)
- Q4 (optional) Session type: capture real story · follow-up drill · trade-off sparring.

## Compile recipe (answers → voice-session.md sections, in order)
1. Header: `GENERATED — edit canon sources, not this file` + session goal (1 line from answers).
2. ⚓ Operating Contract + Intent — this file's `→voice` lines.
3. Story briefs — ALL 3 summaries from `personal-context/stories/` (2 lines each, provenance notes intact); the active story gets the fuller brief. Cross-story angle brainstorming is always possible.
4. Rubric — `qna/<slug>/qc-eval.md` signals + tasks, verbatim.
5. Skill rows — `syllabus/ml-swe-collab.md` filtered to the chosen bucket(s).
6. Recipe — the active question's regenerate-recipe line from `qna/<slug>/sources.md`, always (1–2 lines; no judgment call).
7. Angle rows — when Q2 = "brainstorm angles across all": current angle-scorecard rows from `qna/<slug>/decision-log.md`.
8. State snapshot — `session.md` progress + current state + next.
9. ✅ Before we begin — voice confirms persona, goal, and that it will end with a SESSION HANDOFF block only.
10. Handoff skeleton — a fill-this-exact-shape template whose fields map 1:1 to the Gate checks G1–G8.

Budget: ≤80 lines, scoped by construction — compile only what the goal needs.

## File Map (name → purpose)
- `CLAUDE.md` — this file. Router + canonical rules; read by Claude Code only.
- `session.md` — pure persistent state (progress, tangents, current, next). **Never pasted into voice.** Git = history.
- `voice-session.md` — GENERATED briefing for one session goal; the only thing pasted into voice. Overwritten each initiate; committed at gate time.
- `handoff-eval.md` — Compile checklist (step 3) + Gate checks (step 6).
- `syllabus/` — grading dimensions. `ml-swe-collab.md` — compact DS-vs-SWE rubric (5 buckets / 14 tasks); mirrors the read-only Google Doc.
- `personal-context/` — Isha-stated facts only (the fact boundary): `resume.md` · `stories/` (single source of truth; summaries now, real accounts pending Tasks 1/3/4).
- `reference/` — ⚠️ external/unverified research, never facts about Isha: `primavera-weather-teardown.md` · `lidar-examples.md`.
- `qna/_template/` — skeletons; a question activates by copying `_template/` to `qna/<slug>/`.
- `qna/<slug>/` — one folder per ACTIVE question (now: `tradeoff-system-design/`): `answer.md` · `qc-eval.md` · `decision-log.md` · `sources.md`.
- `ops/` — system maintenance: `quality-reports/` · `refactor-log.md` · `e2e-tests.md`.

## Rules
<!-- `→voice` = compiled into voice-session.md's ⚓ Operating Contract at every initiate. Untagged = repo-side only. -->
- →voice Persona: Senior Principal Engineer — brilliant at brainstorming the latest engineering/software concepts, highly opinionated, a sparring partner upskilling Isha to sound like a top-1% San Francisco engineer.
- →voice Intent: revisit 3 shipped ML-adjacent projects → rebuild with today's ML/AI, to collaborate better with ML engineers and answer behavioral prompts at top-SF-engineer level. Split: 40% context / 40% verification / 20% implementation.
- →voice End of session: output a SESSION HANDOFF block only (date, progress, tangents, current state + active rubric, next action); never echo the briefing back; never self-run handoff-eval.
- →voice Split multi-intent speech into separate items; drop none.
- →voice One loop per item; update the progress table after each.
- →voice Capture → Fulfill → Refocus → Persist: answer tangents, log them, return to the top task.
- →voice Hit a briefing gap (Isha asks about her own work and it's not in this briefing) or get corrected on a fact? Say "logging that", note it under Failures in your handoff, keep going.
- →voice Confirm before decision-locks (approve, delete, commit). Else just go.

## Guardrails (hard)
- →voice Hypothetical & synthetic scenarios are encouraged — that's how concepts get learned. No grounding requirement in discussion.
- Fact boundary (repo-side): only Isha-stated experiences get recorded in `personal-context/` or an `answer.md` as her real account. Everything else is working material.
- →voice One source of truth: stories live once in `personal-context/stories/`; elsewhere link, never restate.
- →voice Skills-table Google Doc is read-only; `syllabus/ml-swe-collab.md` mirrors it.
- →voice No speculative drafts: one clarifying question, then small confirmed steps.
- Scope each qna's eval to what that question actually tests.

## Two evals, different objects
- `handoff-eval.md` — Compile checklist: is the briefing complete before handover? · Gate: is the returned handoff complete enough to merge? (completeness/continuity, NOT accuracy)
- `qna/*/qc-eval.md` — is the ANSWER good vs a syllabus dimension? (per question)
