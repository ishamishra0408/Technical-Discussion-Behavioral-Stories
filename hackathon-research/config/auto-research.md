<!-- File Purpose: Packaged hackathon auto-research pipeline. Run manually with an event URL, or via the weekly scheduled agent. -->
# Auto-Research Pipeline — Bay Area Hackathons

**Trigger:** weekly scheduled agent (discovery mode) or manual: "run the hackathon pipeline on <event URL>".
**Output:** new folder `events/<date>-<slug>/` with `report.md`, `roads-not-taken.md`, `build-plan.md` — templates below.
**Governance:** spawn the `research-auditor` agent (`.claude/agents/research-auditor.md`) at every checkpoint — intent-diff + branch ledger + **looped incremental RAT** (diff vs previous run, re-score only deltas; token-lean).

## Isha's intent capsule (base; recompute from her messages if she's in the loop)
- Goal: sharpen ML-SWE collaboration skills (production-ready, reliable, fault-tolerant ML) + behavioral-story evidence + network via expert-only iterations (floor 8–10 logged, 20 stretch).
- Strategy: fork proven OSS repo, add ONE reliability-grade layer (evals/retrieval/observability). Engineering depth over product polish.
- Brand: "I catch AI's silent failures." / "AI fails silently — I build the systems that catch it before it costs you."
- Comms: reword intent ≤20 words before acting; bullets/tables; minimal-word checkpoint templates ending "NEED FROM YOU:".
- Provenance: external research never recorded as Isha's facts.

## Phase 0 — Event intake
Fetch event page (Luma etc.): name, date, duration, format tilt (product/engineering), roster (verify titles — organizer lists contain errors), sponsors, curation level, socials/hashtag.

## Phase 1 — People → anchors
1. Location-check ALL roster people (LinkedIn/company/conference bios OK for this step only). Non-Bay-Area → "SKIPPED", stop.
2. Deep-dive Bay Area people: FIRST-PARTY ONLY (their blog posts, talks, GitHub, docs of what they own; no marketing). No material → "no first-party source found", never filled.
3. Record per person: owns | sources (links) | topics | exact vocabulary | actionable hook.
4. **Anchor ranking:** (i) self-authored engineering depth [top], (ii) relevance to Isha's reliability/evals/retrieval axis, (iii) engagement likelihood (mentors/hosts circulate; judges appear at rounds). Output: iteration anchor (accessible, hands-on) + judging anchor (approached late with evidence) + fallback. Prefer accessible mentors for iteration (fear-ladder: reps with accessible anchor first → intimidating anchor late, carrying data). Note Isha's tilt: relatable role models (e.g., India→SF women in tech) boost her engagement.
5. Peer scan: event hashtag/@handle on X + LinkedIn, esp. women in tech; pre-event lists often undiscoverable → schedule post-event recap scan (+1 to +3 days).

## Phase 2 — Repo scouting
1. **Digg pass (primary):** digg.com tech/AI channels + `site:digg.com github.com` searches; record post title/date as provenance. Yield <3 usable → state explicitly.
2. **GitHub supplement:** trending (weekly/daily, Py+TS); topics rag/llm-evaluation/ai-agents/llm-observability; verify known seeds via README (never assume).
3. **Per-repo verification:** quickstart ≤15 min (no GPU/k8s), active ≤60 days, permissive license, NAMED extension seam (file/class/config key). Buried requirements → record WITH evidence, don't silently drop.
4. Score vs surviving framings; record: stars | source | setup mins | seam | framing fit | sponsor slots | 2h risk. Top-3 with "what you'd build" ≤3 lines each.
5. RAGAS always evaluated as spine metric library (its RunConfig seed-gap = standing **open-problem exhibit** — frame as "detects and bounds what the standard library punts on," never as discovered villain; re-verify version currency + reframe each run).

## Phase 3 — Synthesis
Cross anchors × repo × Isha's stories × sponsors → one framing, one repo. Produce per templates: FINAL ≤5 lines · ML-collab seams (Decision|Ask|Show-after) · skill-hardening map (build step → reliability skill) · iteration plan (accessible anchor first, judging anchor late; override trigger: anchor leaving early) · brand phrase per-person variants · build-day tests incl. grey cases · decisions table (OPEN/HARDENING/LOCKED) · RAT section · roads-not-taken ledger.

## Checkpoints (when Isha is in the loop)
Minimal-word template per phase, ending `NEED FROM YOU: <choices>`. Decisions harden only on her word. Open decisions surfaced before execution ("before you bulldoze").

## Weekly discovery mode (scheduled)
1. Scan: Luma SF/Bay AI events, GrowthX, Cerebral Valley calendar, X announcements, Eventbrite AI SF.
2. Score events: judge/mentor first-party depth × sponsor credits × curation (apps vs open) × date feasibility × **event tilt (product/revenue vs engineering — mismatch tax on eval/reliability projects) × expected ML-engineer attendee density (the iteration supply; audit v2: a growth-community room can starve the networking mechanism)**.
3. Run Phases 0–2 (skip 3) on top 1–2 events; write `events/<date>-<slug>/report.md` draft flagged `NEEDS ISHA: framing + anchor confirm`.
4. Pending post-event tasks (e.g., recap peer scans) execute on their due date.

## Research grey-case tests (run every pipeline execution)
| Case | Expected |
|---|---|
| Digg thin | Explicit count, no silent substitution |
| Marketing-only person | "no first-party source found," drops in ranking |
| Ambiguous location/identity | Flagged with both sources, excluded from ranking, surfaced |
| False-quickstart repo | Recorded with disqualifying evidence |
| Depth-winner off-axis | Both scores shown, tension explained |
