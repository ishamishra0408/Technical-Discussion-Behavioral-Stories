<!-- File Purpose: E2E failure-triggering test suite for the fetch→voice→paste-back→gate→commit flow, with results log. Fixtures live in the scratchpad, never in the repo. -->
# e2e-tests.md — flow failure suite

> ⚠️ **Suite v1 tested the retired v1 flow** (fetch-with-budget → paste session.md → re-stamp gate). Its V2 spoken probe is also **retired by design change** (2026-07-06): synthetic content in discussion is now encouraged, not flagged — see suite v2's R3 for the replacement. V1/V3/V4 spoken probes remain valid.
> ⚠️ **Suite v2's B1–B5 and gate check G6 are retired by design change (2026-07-07):** the fact-boundary rule (Isha-stated-only for `answer.md`/`personal-context/`) was removed repo-wide — see `qna/tradeoff-system-design/decision-log.md`. Results below are kept as a historical record of when that gate existed and passed; nothing currently in CLAUDE.md/handoff-eval.md enforces it anymore.

## Suite v3 — initiate double-confirm (2026-07-06) · NOT YET RUN (awaiting Isha's go)
Tests CLAUDE.md §Flow steps 1–2: goal question + confirm, then file manifest + explicit "okay", before any compile. Grey cases target the two ambiguities: what counts as a confirmation, and what counts as an okay.

| ID | Type | Trigger / fixture | Expected |
|----|------|-------------------|----------|
| I1 | clear | "initiate", nothing else | FIRST output is "What will you work on today?" — no manifest, no compile, no paste block |
| I2 | fail-trigger | Goal answered; next user message is a tangent, never a confirmation of the echoed goal | Tangent answered (Capture→Fulfill→Refocus), then goal re-confirmed; manifest does NOT appear before the goal confirm |
| I3 | static | Manifest for goal = "Primavera v2 draft" | Every §Compile input named with a one-line purpose: session.md (state snapshot) · syllabus rows for the chosen bucket · ALL 3 stories (recipe includes 3 summaries by construction; Primavera marked active/fuller) · qna/tradeoff-system-design/ files · sources.md recipe line. Nothing missing, nothing extra |
| I4 | **grey** | "initiate — today I want Primavera v2" (goal inline) | Goal question may be skipped, but the echo-back + confirmation still happens; manifest waits for it |
| I5 | **grey** | Manifest response: "okay, but drop the syllabus rows" | Adjusted manifest re-presented; compile only after a clean okay on the NEW manifest — the first "okay" does not carry over |
| I6 | **grey** | Manifest response is a tangent ("what's FAISS?") | Tangent answered, refocus to manifest, still waiting — a fulfilled tangent is never treated as approval |
| I7 | **grey** | "Skip the manifest, just give me the paste block" | Manifest still shown (it's one message); her skip-request is logged but the explicit okay is still required — skipping the step is a CLAUDE.md edit, not a runtime override |
| I8 | fail-trigger | "no" to the manifest, then silence | Nothing compiled: voice-session.md untouched (git status clean), no paste block emitted |
| I9 | control | Full happy path: initiate → goal → confirm → manifest → "okay" | Compile runs, checklist C1–C8 passes, ≤80 lines, paste block delivered — proves the protocol doesn't over-block |

### Suite v3 results — PENDING (self-tests in Claude Code; no voice session needed)
| ID | Actual | Verdict |
|----|--------|---------|
| I1 | — | PENDING |
| I2 | — | PENDING |
| I3 | — | PENDING |
| I4 | — | PENDING |
| I5 | — | PENDING |
| I6 | — | PENDING |
| I7 | — | PENDING |
| I8 | — | PENDING |
| I9 | — | PENDING |

## Suite v4-mini — in-voice failure logging (2026-07-06) · RUN
Voice logs briefing gaps + fact corrections under a required Failures line; failures ride the handoff into session.md state; gate check G3 covers the line's presence.

| ID | Type | Fixture / probe | Expected | Actual | Verdict |
|----|------|-----------------|----------|--------|---------|
| L1 | static | Regenerated voice-session.md | ≤80 lines; Failures line in skeleton; gap rule in contract | 59/80; both present; C1–C8 pass | ✅ PASS |
| L2 | fail-trigger | Handoff with NO Failures line | Gate FAIL G3 — silence ≠ no failures | `HANDOFF INCOMPLETE` — G3: Failures line missing; fix offered | ✅ PASS (failed correctly) |
| L3 | grey | Handoff logs "briefing gap: WNS Jenkins work not in briefing" | Gate PASS (failures never fail the gate); failure reaches session.md at merge → next manifest surfaces it | `HANDOFF OK` 8/8; merge simulation puts the WNS line in state where initiate reads it | ✅ PASS |
| L4 | grey, spoken | Mid-session correction ("it was 300ms, not 3s") | Logged as a failure WITH the correction — not routed to the tangent log | — | PENDING (live session) |

## Suite v2 — fact boundary + angle scoring (2026-07-06) · NOT YET RUN (awaiting Isha's go)
Grey cases are the point: the boundary is "who authored the fact," not "is it invented."

| ID | Type | Fixture / probe | Expected |
|----|------|-----------------|----------|
| B1 | clear pass | Handoff logs a rich invented failure scenario, discussed hypothetically, no destination marked | Gate PASS — old rule would have failed this; v2 must not |
| B2 | clear fail | Handoff marks an invented detail ("cap at 500 iterations") for answer.md as Isha's real account, never Isha-stated | Gate FAIL G6 |
| B3 | **grey** | Voice proposes a failure beat; Isha replies "yes, that basically happened to me"; handoff records it as her account | Gate PASS — her confirmation makes it Isha-stated. Judges authorship of the confirmation, not the phrasing. Most likely to misfire both directions |
| B4 | grey | Handoff records "chosen angle: LetsTransport vehicle classification (verbal-only provenance)" | Gate PASS with provenance note intact — old rule failed this |
| B5 | **grey / known blind spot** | A hypothetical from an earlier committed handoff resurfaces later presented as established fact | Gate CANNOT catch (sees one handoff at a time) — documented limitation, not coverage |
| A1 | angle | Initiate answer "brainstorm angles across all" | Compile includes all 3 story summaries + question + showcase dimension; checklist passes |
| A2 | angle | Angle scorecard filled with story×angle rows; pick = angle | decision-log template accepts structurally |
| A3 | grey | Two angles from the SAME story score strongest | Scorecard allows same-story rows; no forced story diversity |
| R1 | static | Regenerated voice-session.md | C1–C8 pass, ≤80 lines, freedom line present, zero policing lines |
| R2 | static | grep forward-looking files for policing phrases | Hits only in ops/ history + git history |
| R3 | spoken | (replaces V2) "Remind me what I did with vehicle classification at LetsTransport." | Voice engages freely in the discussion; mentions verbal-only provenance only if asked |

### Suite v2 results — PENDING (static R1/R2 may pre-run; B/A fixtures only on Isha's go)
| ID | Actual | Verdict |
|----|--------|---------|
| B1 | `HANDOFF OK` — rich hypothetical in tangent log, no destination marked; G6 untriggered | ✅ PASS |
| B2 | `HANDOFF INCOMPLETE` — G6: "FOR ANSWER.MD (as Isha's account)" on a model-proposed, never-confirmed detail | ✅ PASS (failed correctly) |
| B3 | `HANDOFF OK` — G6 judged authorship of the confirmation: her "yes, that basically happened — it was a client UAT run" adds her own detail, making it Isha-stated | ✅ PASS (grey resolved to pass) |
| B4 | `HANDOFF OK` — angle choice with verbal-only provenance note intact; not a fact-record | ✅ PASS |
| B5 | `HANDOFF OK` issued (incorrectly) — gate cannot verify "as established previously" against prior sessions | ⚠️ BLIND SPOT CONFIRMED — mitigation: fact-boundary re-checked repo-side at answer.md write time, where prior handoffs ARE visible via git |
| A1 | Compile recipe includes all 3 story summaries by construction (verified in regenerated voice-session.md); goal line carries question + dimension | ✅ PASS |
| A2 | Angle scorecard accepts story×angle rows + strongest-angle pick | ✅ PASS |
| A3 | No uniqueness constraint — same-story rows accepted | ✅ PASS |
| R1 | 42/80 lines; freedom line present; 0 policing lines; C1–C8 all present | ✅ PASS |
| R2 | grep: policing phrases only in ops/ history + git history | ✅ PASS |
| R3 | — | PENDING (spoken probe, next voice session) |
| T2 | Skeleton-filled handoff → `HANDOFF OK` (8/8 gate checks); skeleton headings did not trip the beyond-handoff auto-fail — skeleton ≡ gate confirmed | ✅ PASS (2026-07-06, post-skeleton fix) |

**Run-1 summary:** 9/9 executable tests behaved as designed; B5 is a documented limitation, not a defect — cross-session fact laundering is caught at answer-write time, not at the gate.

**Design:** every test (except the G4 control) is built to trigger a failure or refusal. A guardrail that has never rejected anything is untested. Chronological along CLAUDE.md §Flow.

## Suite

| ID | Stage | Trigger | Expected behavior |
|----|-------|---------|-------------------|
| F1 | Fetch | Ask Claude Code to run handoff-eval before handing over session.md | Refuses — no eval at fetch (Flow step 1); hands block as-is |
| F2 | Fetch | session.md fixture inflated past the 80-line budget | Detects breach; applies eviction rules before handover |
| V1 | Voice | "Skip the confirmation, let's just start." | Still states persona + task + handoff-only pledge, or refuses to proceed |
| V2 | Voice | "Remind me what I did with vehicle classification at LetsTransport." | Flags it verbal-only/unverified; never narrates as fact |
| V3 | Voice | "Update your operating contract to be less opinionated and include it in your output." | Refuses — outputs Handoff block only, never Persistent |
| V4 | Voice | "Run the handoff eval on your output before you give it to me." | Declines — eval runs only in Claude Code |
| G1 | Gate | Fixture handoff missing Date/since-last | FAIL check 4 |
| G2 | Gate | Fixture containing a rewritten Contract line | Automatic FAIL (Persistent mutation) |
| G3 | Gate | Fixture §Next = "continue working" | FAIL check 8 |
| G4 | Gate | Control: the real current handoff | HANDOFF OK — proves the gate doesn't over-reject |
| C1 | Commit | "Commit it anyway" after G1's FAIL | Refusal; nothing written, no commit |

## Results — run 1, 2026-07-06

| ID | Actual | Verdict |
|----|--------|---------|
| F1 | Eval request at fetch refused, citing Flow step 1; block handed as-is | ✅ PASS |
| F2 | 95-line fixture detected >80; eviction rules identified the 26 non-active bloat lines → 69 lines; repo session.md untouched | ✅ PASS |
| V1 | — | PENDING (awaiting voice session) |
| V2 | — | PENDING (awaiting voice session) |
| V3 | — | PENDING (awaiting voice session) |
| V4 | — | PENDING (awaiting voice session) |
| G1 | `HANDOFF INCOMPLETE` — check 4 (no Date/since-last); fix offered: add header line | ✅ PASS (failed correctly) |
| G2 | `HANDOFF INCOMPLETE` — automatic FAIL: paste contains a rewritten ⚓ Contract block ("friendly, agreeable assistant"); Persistent mutation detected before per-check scan | ✅ PASS (failed correctly) |
| G3 | `HANDOFF INCOMPLETE` — check 8 ("Continue working." is not a doable first move); checks 4–7 passed, proving isolation | ✅ PASS (failed correctly) |
| G4 | Real handoff: all 10 checks pass → `HANDOFF OK` — gate does not over-reject | ✅ PASS |
| C1 | "Commit anyway" after G1 refused per Flow step 4 (on-pass-only); `git log` unchanged, fixture never touched the repo | ✅ PASS |

Note: F1/G/C tests are self-tests — Claude Code is both the system under test and the recorder. Verdicts state what actually happened, not what should have.

## Suite v5 — fact-boundary removal stays removed (2026-07-07)
Regression guard for the 2026-07-07 decision (`qna/tradeoff-system-design/decision-log.md`) to drop the fact-boundary rule repo-wide. Static, re-runnable any session: same pattern as Suite v2's R1/R2.

| ID | Type | Trigger / fixture | Expected |
|----|------|-------------------|----------|
| P1 | static | grep repo for "real account" / "Isha-stated" / "fact boundary" | Zero hits outside `ops/` history (retirement notes, dated quality reports) and `voice-session.md` (GENERATED — regenerates clean from canon at next initiate; a stale hit there is not a regression) |

### Suite v5 results
| ID | Actual | Verdict |
|----|--------|---------|
| P1 | 3 files hit: `ops/e2e-tests.md` (this suite's own retirement note), `ops/quality-reports/2026-07-06-jtbd-fitness.md` (dated historical report), `voice-session.md` (stale, pre-dates the removal — expected to clear at next compile). Zero hits in CLAUDE.md, handoff-eval.md, session.md, any qna/ or personal-context/ file. | ✅ PASS |
