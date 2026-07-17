<!-- File Purpose: Session handoff — entire hackathon-research project. External research/planning, never Isha's facts. -->
# HANDOFF — hackathon-research (updated 2026-07-14)

## AT A GLANCE

| | |
|---|---|
| **What this is** | Reusable Bay Area hackathon research system + its first package: Hermes Buildathon SF |
| **Event status** | Happened **2026-07-11**. **Outcome unknown — first action of any new session: ask Isha for the debrief.** |
| **Overdue** | Post-event peer scan (window was Jul 12–14) · Isha's weekend tasks (DMs <24h, README, recap) — status unknown |
| **Awaiting her word** | commit of `HANDOFF.md` only (rest already committed: fe726ed) · weekly auto-research schedule activation |
| **Owner intent (1 line)** | Convert the event into referrals + interviews + hardened behavioral stories; harden ML-SWE production-reliability skills |

## RESUME CHECKLIST (fresh session, in order)

1. Read this file. 2. **Ask Isha: event debrief** — build state? capture rows logged? Ishita/Kishan/Tosh conversations? Tosh's "send it to me"? Devansh split? **Record her answers per her CURRENT provenance rule (see fact-boundary open loop below) — confirm the rule before writing her facts anywhere.** 3. Branch: good outcome → `isha-tasks.md` sections "T+1 → T+3 DAYS" and "WEEK 1–4" (each row has Depends-on); bad outcome → its "FAILURE BRANCHES" table (salvage paths pre-computed). 4. Run overdue peer scan: "Hermes Buildathon SF" + won/built/shipped on X/LinkedIn. 5. Offer: commit HANDOFF.md, schedule activation (mechanics: `/schedule` skill or CronCreate — config/auto-research.md is the runbook it executes), root-cause answer "initiate", Primavera fold-back. Note: isha-tasks.html checkbox state is device-local (localStorage) — never trust it as task truth; ask her.

## LOCKED DECISIONS (full logic in `events/.../report.md`)

| Decision | Locked choice | One-line why |
|---|---|---|
| Repo | **Cinnamon/kotaemon** (25.5k★) | Hybrid retrieval pre-built → plan put her 2h entirely into the eval spine. Fallback: get-convex/rag |
| Build | Deterministic, seeded eval harness ("report card machine") | Her Primavera story recreated live; RAGAS metrics inside; trajectory metrics = the Tosh question |
| Anchors (planned ladder) | **Ishita Jindal** (mentor, iterate-first, all 8h) → **Tosh Rayadhurgam** (Stripe judge, late-with-evidence) → Wayne Sutton fallback; Kishan Rao = 2nd iteration anchor | Fear-ladder: accessible reps first, intimidating anchor approached carrying data. Her call: Indian woman in tech as target mentor |
| Brand | "I catch AI's silent failures." / long: "AI fails silently — I build the systems that catch it before it costs you." | Her direction (silent failure + costly mistakes + systems thinker); per-person variants in report.md |
| Sponsors | OpenAI + Convex + Cloudflare AI Gateway (Linkup dropped as forced) | Natural fits only — minimum diff |
| Networking | Expert-only iterations, floor 8–10 logged (20 stretch); closing line: "Where do I send your before/after — LinkedIn?" | Networking log = experiment log (every suggestion → config delta → new run-hash, attributable) |

## PEOPLE DIGEST (first-party sourced; links + vocabulary in `events/.../report.md`)

- **Ishita Jindal** — Memory Store (YC S26, SF), ex-Julep 7K★. Hook: her "agents repeat mistakes" thesis = what the harness measures. Referral ceiling: direct hire / YC-batch intros W2–3.
- **Tosh Rayadhurgam** — Stripe Head of Advanced AI. Talks: trajectory evals, "agents break the deterministic assumption." Rule: intro-not-referral; never job-talk first.
- **Kishan Rao** — Okta EM, Rootly AI Labs (SRE-skills-bench). **Most realistic referral: Okta, W3–4.**
- **Wayne Sutton** — Convex; ships code (convexskills ~400★). Convex-intro path.
- No first-party material: Aritra B (Intuit), Sarang Bhutada (Gusto), Gautam Bagal, Nehal Agrawal, Akshay Potnis (design-axis), Saloni Aggarwal (role unverified). Kankani: Bengaluru-based (per report.md).

## THE BUILD, PLAIN ENGLISH — **(as planned; actuals unknown until debrief)**

kotaemon = a librarian answering questions about PDFs. Flaws: same question twice → different answers; wrong answers look right. Her harness = report card machine: 20 known-answer questions → grades the librarian, labels WHY failures failed (wrong page / chopped page / made-it-up), stamps runs with a receipt number (run-hash) so re-runs are provably identical. Plan: demo-ready at minute 45 (plain 20-row table), not minute 120. Full I/O spec + screen-by-screen demo readiness: `events/.../build-plan.md`.

Key technical facts (verified pre-event, independent of outcome): OpenAI seed/temp=0 is best-effort only — the determinism *design* rested on Cloudflare AI Gateway cache + run-hash architecture ("I make the RUN the unit of reproducibility"); whether the Gateway test passed was RAT #1, unverified at last contact. RAGAS `RunConfig(seed=42)` seeds numpy only, never judge LLM calls — frame as open-problem exhibit ("detects and bounds what the standard library punts on"), NEVER as discovered villain. Upstream-PR framing answers "you just added tests."

## GOVERNANCE SYSTEM (portable to any project)

- **Three-agent loop** (mandatory, skill: `three-agent-loop`): generator + intent-computer + auditor before any artifact ships; trigger = ~5+ accumulated pivots.
- **`research-auditor` agent** (`.claude/agents/research-auditor.md`): intent-diff + unvisited-branch ledger + looped incremental RAT + adversarial pass + output-readability check (3 facts in 5 sec; her motivators, not gamification; terse cells).
- **Intent versioning**: recompute every 5 of her messages; v1→v3 + deltas recorded in the plan file (`~/.claude/plans/user-intent-build-a-prancy-river.md`).
- **Her standing rules** (memory): reword intent ≤20 words before acting · open with the task queue (nothing dropped) · encapsulate mechanics, surface insights · machine-verify checkable claims before docs reach her · tests with grey cases in every plan · provenance boundary.

## OPEN LOOPS (as of 2026-07-14)

| Loop | State | Next action |
|---|---|---|
| Event debrief | **Unknown** | Ask Isha (see resume checklist #2) |
| Peer recap scan | **Overdue** (Jul 12–14 window) | Run now; comment window still warm |
| Weekend tasks (DMs, README, CI red-X, recap post) | Unknown — were Isha's own | Check against isha-tasks Weekend section |
| W1–4 ladder (calls → referral asks) | W1 now | Per-person rungs in isha-tasks; ≥2 calls by W2 target |
| Root-cause answer | Undrafted | Her "initiate" flow on `qna/root-cause-debugging/` — build is its live evidence |
| Primavera fold-back | Pending | Map: Convex=checkpointing · Gateway=observability · run-hash=config-versioning → the answer's 4 open gaps |
| git commit | **Mostly done by Isha** (fe726ed "Add hackathon-research: Hermes Buildathon SF event package") | Only `HANDOFF.md` untracked; commit on her word |
| Fact-boundary rule | **Changed repo-side** — commits 62df0f3 (removed the real-vs-synthetic account gate) + fae413c (regression test it stays removed) | Memory index may be stale on this; confirm her current rule before applying the old gate |
| Weekly schedule | Deferred by her to post-event | Activate on her ok; config ready (`config/auto-research.md`) |

## FILE MAP

| File | Purpose |
|---|---|
| `HANDOFF.md` | This file — start here |
| `README.md` | Folder purpose + **provenance carve-out** (external research, never her facts) + manual pipeline re-run instructions |
| `config/auto-research.md` | Reusable pipeline: event intake → people/anchors → Digg-first repos → synthesis; weekly discovery mode spec |
| `events/.../post-event-x-draft.md` | Recap-post draft (added post-event, likely by Isha — read before drafting any recap; may supersede the skeletons in isha-tasks) |
| `events/2026-07-11-hermes-buildathon-sf/report.md` | People research (sourced), decisions, RAT table, seams, skill-hardening map, iteration plan |
| `events/.../build-plan.md` | Tonight queue (as planned), Devin brief, 2h schedule, plain-English I/O, screen-by-screen demo readiness, 90-sec beat sheet, acceptance tests |
| `events/.../isha-tasks.md` | Her end-to-end task list (Tonight→W4) with Why + Depends-on + Proof; failure branches; DM/recap skeletons |
| `events/.../isha-tasks.html` | One-pager checklist (localStorage checkboxes) — presentation layer |
| `events/.../roads-not-taken.md` | Every unvisited branch: buried insight + revisit trigger |
| `.claude/agents/research-auditor.md` (in repo) | Persistent auditor — canonical copy in GitHub; a live copy also sits at `TechDiscussion/.claude/agents/` (parent dir, where sessions launch) — sync repo copy after edits |
| `.claude/skills/three-agent-loop/SKILL.md` (in repo) | The mandatory quality loop — canonical copy; live global copy at `~/.claude/skills/three-agent-loop/` |
| `hackathon-research/session-plan-2026-07-10-hermes.md` | Full session decision history + intent versions v1→v3 (copied from `~/.claude/plans/`) |

## INTENT CAPSULE (recompute from her messages when she's active)

2-hour engineering-first builds inside product-tilted events; fork proven OSS, add ONE reliability layer; heavy ML-collab as the networking mechanism; single anchor-mentor targeting (accessibility-weighted); artifacts must convert to referrals + interviews + behavioral-story evidence; she reviews via minimal-word checkpoints and expects every task captured in a visible queue.
