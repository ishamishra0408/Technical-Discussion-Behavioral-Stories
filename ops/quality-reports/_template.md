<!-- File Purpose: Methodology for repo quality reports. New reports copy this structure into ops/quality-reports/<date>-<slug>.md. Quality = how optimally the file structure serves each JTBD, not abstract hygiene. -->
# Quality report methodology (v2 — JTBD fitness)

## Spine: JTBD structural fitness
One row per job in `ops/jtbd-map.md`. Score each on 4 factors:
1. **Sources** — is every input the job needs canonical and unique (one home, no divergent copies)?
2. **Extraction** — is the compile rule written and deterministic, or a judgment call?
3. **Drift guard** — does a compile check (C) or gate check (G) protect every copy the job depends on?
4. **Read cost** — how many files does the job touch compile-side?

Verdict per job: **OPTIMAL** (all four green) / **ADEQUATE** (works; one factor soft) / **WEAK** (a factor can silently fail) + the single structural fix if not optimal.

## Kept cross-cutting checks
- **Consistency sweep** — grep for stale references and retired concepts outside ops/ history.
- **Validation status** — for each guardrail: fixture-tested, live-tested, or untested. Rehearsal ≠ production.

## Excluded (do not re-add without a reason)
- Line-count bloat metrics — the ≤80 budget is enforced by construction at compile (check C8); counting repo lines measures nothing a job feels.
- Duplication census — copies are managed by design (canon → generated briefing); the consistency sweep catches drift, a census just re-lists architecture.
- Process-health narration — `ops/refactor-log.md` owns change history.

## Roll-up
Overall grade = **worst-of** the frequent-or-fragile JTBDs, not an average. One broken daily job outweighs five polished rare ones. Name the grade-setting job explicitly.
