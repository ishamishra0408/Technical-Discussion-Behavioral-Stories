<!-- File Purpose: Story-fit scorecard for this question, then a log of decisions + basis. Copied from qna/_template/ at question activation. -->
# decision-log.md — "Tell me about a situation that required you to dig deep to get to the root cause"

## Angle scorecard
Brainstorm story×angle pairs for this question; pick the strongest ANGLE (same-story rows allowed).
| Story × angle | Shows the chosen dimension? | Narrative strength | Notes / provenance |
|---|---|---|---|
| Primavera: Monte Carlo perf regression (root-causing the slowdown behind the ~40% fix) | High | High | Already the active story for `tradeoff-system-design` — reusing it here risks overlap across questions. |
| Primavera: weather-attributes rules-engine data-accuracy bug | Med | Med | Thinnest detail of the six; provenance mostly synthetic. |
| LetsTransport: Mongo↔ES dashboard slow queries (root-causing stale sync before Monstache, −300ms) | High | High | Clean distributed-systems root cause (stale index / silent sync lag); concrete metric + customer-facing stakes. |
| LetsTransport: KYC onboarding drop-off (before push-notification + rules-engine fix) | Med | High | Root cause reads more UX/funnel than technical dig; strong metric (+60% activation) but weaker "root cause" fit. |
| Quotr: RAG grounding-accuracy investigation (chasing ungrounded answers before hitting >90%) | High | High | Most ML-adjacent of the six — directly stresses SWE↔ML debugging (is it retrieval, chunking, or generation?); freshest project, no overlap with the active trade-off question. |
| Quotr: CV table-extraction errors (OCR/table-detection misses → malformed JSON) | Med | Med | Real failure mode but no quantified before/after in the resume record. |
| **Pick (strongest angle)** | **Quotr: RAG grounding-accuracy investigation** | | Best dimension fit + no story overlap with the currently active question; pulls the project intent (ML-adjacent, rebuild-with-today's-AI) most directly. |

## Decisions + basis
| Date | Decision | Basis |
|------|----------|-------|
| 2026-07-06 | Activated new question `root-cause-debugging`; ran angle exploration since `answer.md` had no real version. Picked Quotr RAG-grounding angle. | Scorecard above — strongest dimension fit, avoids doubling up on Primavera (already active elsewhere), best ML-collab framing for a root-cause story. |
