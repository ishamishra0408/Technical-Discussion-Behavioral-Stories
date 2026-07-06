# Session Handoff — ML-SWE Interview Prep

*Paste into a new chat to restore context. Grounded only in facts I provided. Synthetic items flagged.*

## Intent & roles

Revisit 3 shipped ML-adjacent projects (Primavera, LetsTransport, Quotr) → how I'd build them today, to (a) collaborate better with ML engineers, (b) nail "a time you made a technical trade-off." My role: engineer who shipped these; own the ML-SWE seam. Assistant role: adversarial interviewer — clarify, opinionated pros/cons, grade against the skills table, ask what actually happened. Approach split: 40% context / 40% verification / 20% implementation.

## How to run the session (workflow)

Capture → Fulfill → Refocus → Persist. Answer tangents fully, log them, then point back to the task.

- Show the live progress table each turn; move items DONE / IN PROGRESS / PENDING.
- Keep a tangent log so side-quests aren't lost.

### Task Status

| # | Task | Status |
|---|------|--------|
| 1 | Capture my real Primavera story + run through eval | PENDING |
| 2 | Two follow-ups on Primavera | PENDING |
| 3 | LetsTransport: clarify → eval → test → follow-ups | PENDING |
| 4 | Quotr: clarify → eval → test → follow-ups | PENDING |
| 5 | Pick winner → craft final answer | PENDING |

Tangent log: (none open)

## 1. Resume — three roles (source of truth)

**Quotr — AI Engineer.** RAG over architectural PDFs (~60MB): OCR, metadata chunking, FAISS, hybrid BM25 → >90% grounding, <2s latency. CV pipeline (PyTorch table detection + OCR) → normalized JSON.

**LetsTransport — Sr SWE (Jul22–Sep23, Series E logistics).** Node/Mongo scheduling + slot discovery; Spring Boot REST (~50% faster); Mongo↔ES via Monstache (−300ms); KYC onboarding (+60% activation); docs+reviews (−15% bugs). ⚠️ "Vehicle classification" ML angle is verbal only — not in bullets, pending deep dive.

**Oracle/Primavera — Sr SWE (Jan19–Jul21).** Monte Carlo risk engine (~40% scheduler perf); rules engine storing weather attributes in Risk Module; import/export for legacy interop; Jenkins CI/CD (−50% cycle).

## 2. Skills table — SWE vs DS (canonical rubric)

Source: LiDAR pipeline doc. DS proves the math once; SWE makes it run unattended, any size, rented machines, no babysitting. 17 tasks across 5 buckets:

- **Reliable:** checkpointing/fault-tolerance · error-handling/graceful-failure · logging/observability · reproducibility/containerization
- **Reusable:** configuration/parameterization · API/service-endpoint · refactoring/modularization
- **Store data:** data-catalog/metadata-store · object-storage
- **Split files:** tiling/partitioning · parallelization
- **Cloud:** compute/provisioning · autoscaling/orchestration · containerization

## 3. Primavera eval (APPROVED)

Scoped to reliability + reusability. Pass/fail, no partial credit.

**Signals (all 4):** names ML owner + constraint (fidelity via more iterations) · names my SWE bucket + constraint · states the real trade-off (fidelity vs runtime/determinism) · explains how I resolved it.

**Tasks (all 10):** checkpointing · error-handling/graceful-failure · logging/observability · reproducibility/containerization · configuration/parameterization · API/service-endpoint · refactoring/modularization · graceful degradation on bad inputs · data validation · observability under load.

**Design rule:** each story's eval stays scoped to what I owned; the 3 evals jointly cover all 17 tasks.

## 4. Architect draft — ⚠️ SYNTHETIC, not my real story

Assistant-written "in your shoes" version, self-scored 4/4 + 10/10. Only confirmed-real piece: hybrid seeded-RNG, configurable per client. Everything else (e.g. "cap at 500 iterations," service-layer specifics) is invented. Use as a comparison baseline only — my actual Primavera account is still uncaptured (= Task 1).

## 5. Story-crafting shape (target output)

Cold-fact hook → high stakes → first / second / third → outcome. Bar: holds up with top SF engineers.

## Appendix — regenerate Primavera context

Perplexity prompt: "Give me the snapshot of product and engineering requirements of weather risk module so that I can have a rich technical discussion for product teardown."

Verified facts: probabilistic simulation engine (not a trained model); weather-risk events w/ duration + persistence; Monte Carlo ~100 iterations → probabilistic weather calendar → quantitative risk analysis (schedule/cost/resource).

## File index

| File | Role |
|------|------|
| Resume | Source of truth for facts |
| Skills table (LiDAR doc) | Rubric + gold-standard example (reference pattern, not a 4th story) |
| Chatbot story signals | STAR structure template |
| AI-PM infographic | Reframing lens (not facts about my work) |
| Perplexity teardown | Primavera domain context |
| This handoff | Context carrier for new sessions |
