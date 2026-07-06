<!-- File Purpose: The behavioral answer for "a technical trade-off." Git = versions. The story's canonical home is personal-context/stories/primavera.md — link there, don't restate. -->
# answer.md — "Tell me about a time you made a technical trade-off" (Primavera)

> **Baseline draft (assistant-written).** Provenance: written "in Isha's shoes" to exercise the eval; the one Isha-stated detail is **seeded RNG, configurable per client** — the service-wrapper framing and the "cap at 500" number are working material. Task 1 replaces this with her real Primavera account before this file is delivered as fact.

## Current draft (synthetic)
I'm the SWE making the Monte Carlo simulation production-ready. The ML engineer hands me a function that takes weather attributes and returns probability distributions. I push back on the interface right away: I ask them to own validation upfront — persistence can't exceed one, duration can't be negative — and to document what happens on bad inputs. Then I wrap their function in a service layer: checkpoint after every client simulation so we never lose work on a crash; log every invocation with inputs and outputs for observability; parameterize iteration count and seed strategy per client so teams tune without code changes; surface latency percentiles and failure rates so problems show up in production. The trade-off: I cap iterations at 500, configurable per client. They want fidelity — more iterations is better. I'm accountable for overnight completion and reproducibility across clients. Five hundred gives solid statistical confidence without blowing out runtime. If they need more, we profile first and decide together.

## Eval result on this draft
4/4 signals · 10/10 tasks (see `qc-eval.md` run log). Passing proves the rubric works — it does **not** mean this answer is real or ready to use.

## Real version — TODO (Task 1)
- Tell the real account: what you actually owned on the weather module, who the ML owner was, the real constraint you traded against, and what you actually did.
- Once captured, the canonical story lives in `personal-context/stories/primavera.md` (synthetic-free). This file then becomes a tight behavioral **answer** that links to that story instead of restating it.
- Re-run `qc-eval.md` against the real answer and update the run log.