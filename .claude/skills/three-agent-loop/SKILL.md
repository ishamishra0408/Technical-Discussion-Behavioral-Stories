---
name: three-agent-loop
description: Isha's mandatory quality loop for any build, setup, research, or planning session. Trigger on "setup", "initiate", "build", "loop" (workflow sense, not /loop scheduling), "plan", "research", or whenever 5+ user pivots/decisions have accumulated since the last audit. Runs generator + user-intent-computer + auditor before any artifact is declared done.
---

# Three-Agent Loop (generator · intent-computer · auditor)

Standing procedure, agreed 2026-07-10. The failure it prevents: a session grows through many small pivots, each "too small" to audit, and the accumulated drift ships. **The trigger is decisions-accumulated, not task size.**

## Roles

1. **Generator** — produce the artifact.
   - Inline (main conversation) when Isha is present and correcting in real time.
   - Separate agent (worktree if it mutates files) for long unattended generation.

2. **User-intent computer** — maintain a numbered list of Isha's intent items.
   - Inline when directives are explicit: distill every correction/pivot into the list as it happens; re-read the list before each major generation step.
   - Separate agent when intent must be *inferred* — sprawling research, ambiguous goals, many unstated branches. Have it output: computed intent, confidence per item, open questions.
   - Per her existing rule: mirror intent back in ≤20 words (bullets) before acting.

3. **Auditor** — adversarial gate. **Mandatory before declaring any artifact done. No exception for "it was just incremental edits."**
   - Preferred: the project's `research-auditor` agent if registered.
   - Fallback (any project): a general-purpose agent prompted to produce, in <40 lines:
     - **INTENT-DIFF** — deviations from the numbered intent list, with severity + location
     - **FACT-CHECK** — contradictions vs canonical project files
     - **UNVISITED** — intent branches opened but not covered (max 5)
     - **RAT** — top 3 riskiest assumptions in the artifact, each with a cheap test
     - **VERDICT** — SHIP / FIX-THEN-SHIP with minimal fix list
   - Give the auditor: artifact path(s), canonical source paths, and the numbered intent list verbatim.

## Cadence

- Audit when ~5+ pivots/decisions have accumulated since the last audit, and always before final delivery.
- Run the auditor synchronously (blocking) — its verdict gates the ship.
- Apply FIX-THEN-SHIP items; re-audit only if HIGH-severity fixes changed the artifact's structure.
- Report the verdict and fixes to Isha explicitly — never silently absorb audit findings.

## Non-goals

- Not for trivial single-edit turns or pure Q&A with no artifact.
- "loop" here means this quality loop — do not confuse with the /loop scheduling skill.
