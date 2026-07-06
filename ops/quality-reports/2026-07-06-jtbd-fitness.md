<!-- File Purpose: First quality report under the v2 JTBD-fitness methodology (see _template.md). Assesses the post-fix tree at commit "Quality reports v2". -->
# Quality report — JTBD fitness · 2026-07-06 (evening)

**Overall: ADEQUATE-plus, grade set by JTBD 12** (frequent + fragile: every session ends with a handoff). It moved from WEAK to ADEQUATE today via the embedded skeleton; it can't reach OPTIMAL while a repo-blind agent executes the format. Nothing scores WEAK.

## JTBD structural fitness (jobs from ops/jtbd-map.md)

| # | Job | Sources | Extraction | Drift guard | Reads | Verdict |
|---|-----|---------|------------|-------------|-------|---------|
| 1 | Contract & goal | CLAUDE.md only | →voice tags, deterministic | C2 | 1 | OPTIMAL |
| 2 | Hypothetical sparring | persona lines | deterministic | C2 | 1 | OPTIMAL |
| 3 | Tangents / multi-intent | contract lines | deterministic | C2 | 1 | OPTIMAL |
| 4 | Track progress | session.md | copy snapshot | C6, G2 (row reconciliation) | 1 | OPTIMAL |
| 5 | Fetch syllabus skill | syllabus table | bucket filter, deterministic | C5; ⚠️ mirror↔Google-Doc drift unguarded | 1 | ADEQUATE |
| 6 | Fetch project detail | stories/*.md | all 3 summaries, deterministic | C3 | 3 | OPTIMAL |
| 7 | Grade vs rubric | qc-eval.md | VERBATIM copy — the one hand-done step | C4 | 1 | ADEQUATE |
| 8 | Capture real story | composite of 6+7 | deterministic | C3+C4 | 4 | ADEQUATE |
| 9 | Failure-mode exploration | story + skills | deterministic; invention permitted | G6 at record time only | 2 | OPTIMAL |
| 10 | Regenerate lost context | sources.md recipe | **fixed today:** always compiled | C6 | 1 | OPTIMAL |
| 11 | Angle brainstorm & pick | stories + decision-log rows | **fixed today:** scorecard rows compile when Q2="all" | C3; scorecard write guarded at merge | 4 | ADEQUATE |
| 12 | Generate handoff | **fixed today:** skeleton in briefing ≡ G1–G8 | voice fills a shape | T2 fixture (pending run) guards skeleton↔gate equivalence | 0 extra | ADEQUATE — grade-setter |

## Cross-cutting
- **Fact boundary / zoning:** clean. personal-context/ = Isha-stated; reference/ labeled; G6 authorship rule tested (B1–B4), incl. confirmation precedent (B3).
- **Consistency sweep:** clean outside ops/ history (retired mechanics, policing phrases, stale paths — zero hits).
- **Validation status (the honest column):** gate fixtures — tested (suites v1+v2, 16 executed). Compile checklist — statically verified only. Skeleton↔gate equivalence — T2 written, NOT yet run. **Live voice round-trip — still untested; remains the single largest unknown.** B5 cross-session blind spot — accepted, mitigated at answer-write time.

## Findings carried forward
1. (from evening chat report) Live round-trip untested — no structural fix; run one real session.
2. Syllabus mirror has no drift guard against the read-only Google Doc — acceptable while the Doc is stable; add a periodic diff check only if the Doc changes.
3. JTBD 7's verbatim-copy requirement is the last hand-done extraction — tolerable at one rubric; revisit if active questions multiply.

## Excluded from this report (per _template.md)
Line-count metrics · duplication census · process-health narration.
