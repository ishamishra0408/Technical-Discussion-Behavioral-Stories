<!-- File Purpose: Ingest gate: checks the handoff is complete + reliable before a session starts. TODO -->
# handoff-eval.md — Ingest Gate

Run in Claude Code at session start, before any chat. Verifies `session.md` is complete enough to continue seamlessly.

**Scope:** handoff COMPLETENESS + continuity only. NOT story accuracy, recency, metrics, or factual truth — those are explicitly out of scope. This gate never asks "is the story true," only "can the next session continue without re-explaining."

**Method:** pass/fail per check. Any FAIL → stop, report the gap, do not start the session.

## Checks
1. **Rules header** — operating-rules block present at top of `session.md`.
2. **Intent + roles** — stated once, clearly.
3. **Progress table** — present; statuses unambiguous; exactly one clear current/next task.
4. **Concrete next action** — a doable first move ("tell the real Primavera story"), not "continue working."
5. **Active rubric inline** — the eval for the current task is written in `session.md` (voice can't read the repo).
6. **Synthetic flagged** — every invented/unverified item is labeled as such. No invented fact presented as real. (This is a labeling check, not a truth check.)
7. **Stories are pointers** — story facts reference `personal-context/`, not restated as new claims.
8. **Tangent log** — present (empty is fine).
9. **Critical path clean** — no placeholder TODO blocking the current task; its inputs are all present.

## Output
- All pass → `HANDOFF OK` + 3-line recap + paste-ready block for voice.
- Any fail → `HANDOFF INCOMPLETE` + numbered gaps + the single fix that would make it pass.