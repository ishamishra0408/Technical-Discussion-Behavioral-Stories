<!-- File Purpose: Single live handoff. Git holds history; no sessions folder. TODO -->
<!-- OPERATING RULES — compiled from CLAUDE.md. Read first, follow. Edit CLAUDE.md, not here. -->
<!-- OPERATING RULES — compiled from CLAUDE.md. Read first, follow. Edit CLAUDE.md, not here. -->
## Rules
- Multi-intent → separate items, drop none. One loop per item; update progress after each.
- Capture → Fulfill → Refocus → Persist: answer tangents, log, return to top task.
- Confirm before repo writes / decision-locks (commit, approve, delete). Else just go.
- Real vs synthetic: flag invented content, never as my real account. Stories = single source of truth. Skills-table doc read-only. No speculative drafts — one question, small steps.
- Already passed handoff-eval before paste; don't re-run in voice.

---

## Intent
Revisit 3 shipped ML-adjacent projects → rebuild with today's ML/AI, to collaborate better with ML engineers and answer behavioral prompts (e.g. "a technical trade-off") at top-SF-engineer level. Me: engineer who shipped these, own the ML-SWE seam. Assistant: adversarial interviewer — clarify, opinionated, grade vs skills table, ask what actually happened. Split: 40% context / 40% verification / 20% implementation.

## Progress
| # | Task | Status |
|---|---|---|
| 1 | Capture REAL Primavera story + run eval | PENDING ← current |
| 2 | Two Primavera follow-ups | PENDING |
| 3 | LetsTransport: clarify → eval → test → follow-ups | PENDING |
| 4 | Quotr: clarify → eval → test → follow-ups | PENDING |
| 5 | Per question: score 3 stories → pick best → craft answer | PENDING |

Tangents: none.

## Stories (full = personal-context/stories/)
- **Primavera** (Oracle 19–21): Monte Carlo risk engine ~40% perf; weather-attributes rules engine; legacy import/export; Jenkins −50%. I owned sim reliability + reusability; an ML owner owned the probabilistic math.
- **LetsTransport** (22–23): Node/Mongo scheduling; Spring Boot REST ~50% faster; Mongo↔ES −300ms; KYC +60%. ⚠️ "Vehicle classification" is verbal only — not in resume, unverified.
- **Quotr**: RAG over ~60MB PDFs (OCR, FAISS, hybrid BM25) → >90% grounding, <2s; PyTorch CV table→JSON.

## Skills table (mirror of syllabus/ml-swe-collab.md) — grading rubric
*DS proves the math once; SWE makes it run unattended at any scale, no babysitting.*
- Reliable: checkpointing · error-handling · logging/observability · reproducibility/containerization
- Reusable: config/parameterization · API/endpoint · refactoring/modularization
- Store: data-catalog · object-storage — Split: tiling/partitioning · parallelization — Cloud: provisioning · autoscaling · containerization

## Primavera answer-eval (APPROVED) → qna/tradeoff-system-design/qc-eval.md
Scoped to Reliable + Reusable. Pass/fail, no partial credit.
- Signals (4): names ML owner + constraint (fidelity via iterations) · names my SWE bucket + constraint · states the trade-off (fidelity vs runtime/determinism) · how I resolved it.
- Tasks (10): the 7 Reliable+Reusable rows above, plus graceful-degradation · data-validation · observability-under-load.

## ⚠️ Synthetic baseline — NOT real
Assistant "in your shoes" draft (service wrapper, "cap 500 iterations") self-scored 4/4 + 10/10. Only real bit: seeded-RNG configurable per client. Rest invented. Task 1 = capture my actual account for the first time.

## Next
Task 1: I tell the real Primavera story; assistant runs it through the answer-eval above.

## Regenerate Primavera context (if needed)
Perplexity: "snapshot of product and engineering requirements of weather risk module for a product teardown." → probabilistic sim (not a trained model); weather events w/ duration + persistence; MC ~100 iterations → weather calendar → quantitative risk analysis.