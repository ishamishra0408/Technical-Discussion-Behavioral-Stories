<!-- File Purpose: Two checklists for flow v2 — Compile (validates the generated voice-session.md before handover) and Gate (validates voice's returned handoff before merging into session.md). -->
# handoff-eval.md — Compile Checklist & Commit Gate

**Scope (both):** completeness + continuity only. NOT story accuracy, recency, metrics, or factual truth. Never "is the story true," only "can this session run / can the next session continue."
**Method (both):** pass/fail per check, no partial credit. Any FAIL → stop, report the gap + its fix.

## Compile checklist — Flow step 2, on the generated `voice-session.md`
Fails here mean a silent context gap discovered mid-drive; do not hand over until all pass.
- C1 Header: GENERATED marker + a 1-line session goal from the initiate answers.
- C2 ⚓ Contract + Intent present — all `→voice` lines from CLAUDE.md.
- C3 Story briefs present — all 3 summaries, the active story's fuller brief, provenance notes intact.
- C4 Rubric inline — the active question's qc-eval signals + tasks, verbatim.
- C5 Skill rows present, filtered to the chosen bucket(s).
- C6 State snapshot present — progress + current + next from `session.md` — plus the active question's recipe line.
- C7 ✅ Before-we-begin present (persona, goal, handoff-only pledge) AND the handoff skeleton (fields ≡ G1–G7).
- C8 ≤80 lines.

## Gate checks — Flow step 5, on the handoff pasted back from voice
**Object under test:** a SESSION HANDOFF block and nothing else. If the paste contains anything beyond a handoff block (contract text, briefing echo, rubric rewrite) → **automatic FAIL**.
- G1 Date + since-last — both present; a dateless handoff fails.
- G2 Progress table — present; statuses unambiguous; exactly one clear current task; every row from the briefing's snapshot reappears or is explicitly closed.
- G3 Tangent log AND Failures line — both present (either may be "none"). Logged failures never fail the gate; at merge they copy into `session.md` state so the next initiate sees them.
- G4 Active question + rubric echoed — the question under work and the rubric it was graded against are named (so the merged state stays self-describing).
- G5 Concrete next action — a doable first move, not "continue working."
- G6 Story facts as pointers — references `personal-context/stories/`, not restated as new claims.
- G7 Critical path clean — no placeholder blocking the current task; its inputs all present.

## Output
- Compile: all pass → hand over the paste block. Any fail → fix the compile (not the canon) and re-run.
- Gate: all pass → `HANDOFF OK` + 3-line recap → merge into `session.md`, commit `session.md` + `voice-session.md`, read the diff back. Any fail → `HANDOFF INCOMPLETE` + numbered gaps + the single fix for each. Do not write or commit.
