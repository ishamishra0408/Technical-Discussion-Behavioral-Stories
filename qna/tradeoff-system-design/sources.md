<!-- File Purpose: Approved sources for this question, each with its role and any synthetic/unverified flag. -->
# sources.md — "a technical trade-off" question

| Source | Role here | Flags |
|--------|-----------|-------|
| SWE-vs-DS skills table — Google Doc `1rQPFySmhmE0e4LPnfDEFPbTG3yJvPPojyN3o6i4hjLI` | Grading rubric behind `qc-eval.md`; 5 buckets / 14 mirrored tasks. | Read-only. Mirror: `syllabus/ml-swe-collab.md` — edit the mirror, never the Doc. |
| Resume — Oracle / Primavera bullets | Factual anchor: Monte Carlo ~40% perf, weather-attributes rules engine, import/export, Jenkins −50%. | True facts: `personal-context/resume.md`. |
| Primavera weather-module teardown → `reference/primavera-weather-teardown.md` | Product context: probabilistic sim (not a trained model); weather events with duration + persistence; MC ~100 iterations → weather calendar → quantitative risk analysis. | ⚠️ LLM-generated, unverified. Context only, not a factual claim. |
| Hello Interview — "AI chatbot story signals" | Reference example of a strong behavioral story's shape (snapshot → stakes → role → actions → results → learnings). | Not Isha's story. Structure template only. |
| Session architect draft | Origin of the synthetic baseline now in `answer.md`. | ⚠️ Synthetic. |

## Regenerate Primavera context (recipe)
Perplexity prompt: "snapshot of product and engineering requirements of weather risk module for a product teardown." Expected shape: probabilistic sim (not a trained model); weather events w/ duration + persistence; MC ~100 iterations → weather calendar → quantitative risk analysis. Full snapshot: `reference/primavera-weather-teardown.md`.
