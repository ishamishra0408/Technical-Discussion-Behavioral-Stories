<!-- File Purpose: Map of the voice agent's jobs-to-be-done — how each task flows through the repo (compile-side) and briefing (voice-side), with fragility ratings. v2 (2026-07-06), corrected for the fact-boundary rule and angle scoring. -->
# jtbd-map.md — voice-agent jobs, paths, and fragility

Voice is repo-blind: every path = what Claude Code compiles into `voice-session.md` at initiate (left) + what voice does with it live (right). A task gets fragile when compile filtering and runtime need diverge.

| # | Task (JTBD) | Path (compile → voice) | Rating |
|---|---|---|---|
| 1 | Confirm contract & goal (before-we-begin) | CLAUDE.md →voice lines → ⚓Contract · voice reads briefing top | Easy |
| 2 | Sparring / hypothetical brainstorming | persona + intent + freedom line · no grounding required — ranging beyond the briefing is by design | Easy |
| 3 | Tangent capture, multi-intent split, loop-per-item | contract rules · applied live | Easy |
| 4 | Track progress | session.md → §State snapshot · voice updates its copy | Easy–Medium |
| 5 | Fetch a syllabus skill | syllabus/ml-swe-collab.md filtered to chosen bucket(s) → §Skill rows | Medium — unchosen buckets aren't compiled; voice may improvise definitions (fine for discussion) |
| 6 | Fetch project detail | stories/*.md → §Story briefs (all 3 summaries; active story fuller) | Easy–Medium — summaries always present; depth beyond them is hypothetical by design |
| 7 | Grade an answer vs the rubric | qna/<slug>/qc-eval.md verbatim → §Rubric | Medium — rubric must be copied verbatim; paraphrase = silent drift (compile check C4) |
| 8 | Interview Isha to capture the real story | story brief + rubric gaps in §goal | Medium |
| 9 | Explore failure modes / failure beats in a story | story summary + skill rows; invention is a legitimate tool here | Easy–Medium — free exploration; the only rule is at record time: beats enter answer.md as Isha's account only when Isha-stated/confirmed (gate G6, precedent test B3) |
| 10 | Regenerate lost context | qna/<slug>/sources.md recipe (compiled if goal needs it) | Medium — breaks if compile judged it unneeded |
| 11 | Brainstorm story×angle pairs for a question, pick the strongest angle | all 3 §Story briefs + question + showcase dimension → angle scorecard in qna/<slug>/decision-log.md at merge time | Medium — same-story rows allowed; never rank whole stories |
| 12 | Generate the closing SESSION HANDOFF block | one contract line describes the format; the 8 gate checks live in handoff-eval.md, unseen by voice | **Complex — top open fragility.** Voice reconstructs 8 checks from one line; a malformed handoff costs a full round-trip. Hardening (embed a handoff skeleton in the briefing) proposed, not yet approved |

**Known limitations (tested, accepted):** B5 blind spot — a prior session's hypothetical resurfacing as established fact passes the gate; caught repo-side at answer-write time (see ops/e2e-tests.md suite v2). R3 spoken probe (free engagement with verbal-only material) pending the next live session.
