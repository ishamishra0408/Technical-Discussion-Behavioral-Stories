<!-- File Purpose: Dimension: ML-SWE collaboration. Compact grading rubric (5 buckets / 14 tasks), split by who owns what. This file is the source of truth — no external doc to mirror. Worked examples live in reference/lidar-examples.md. -->
# ML-SWE collaboration — grading rubric

**One line:** DS's script proves the math works once. SWE makes that same math run unattended, on any size job, on rented machines, with no human babysitting.

**Why the split matters:** a behavioral answer that can't say which side of each row *she* owned — vs. what she expected the ML/DS counterpart to own — isn't showing collaboration, it's showing solo work. Every row below names both.

| # | Bucket | Task | DS/ML owns | SWE owns |
|---|--------|------|------------|----------|
| 1 | Reliable | Checkpointing / fault tolerance | Defines what intermediate state must survive a crash (which outputs/params can't be silently lost or recomputed wrong). | Implements the checkpoint/resume mechanism — durable writes, restart logic. |
| 2 | Reliable | Error handling / graceful failure | Defines what counts as a bad input and what should happen to it (skip, flag, degrade). | Implements the isolation so one bad input never kills the whole run. |
| 3 | Reliable | Logging / monitoring / observability | Defines which signals indicate model/data quality problems and what should trigger investigation. | Builds the logging/tracing/alerting pipeline that surfaces those signals with enough detail to root-cause. |
| 4 | Reliable | Reproducibility / containerization | Pins model/data versions and defines what "same result" means (seeds, data snapshot). | Builds the container/environment that guarantees identical execution across runs and machines. |
| 5 | Reusable | Configuration / parameterization | Decides which knobs matter (iteration count, thresholds, seed strategy) and their safe ranges. | Exposes those knobs as validated config so settings change without code edits. |
| 6 | Reusable | API / service endpoint | Defines the input/output contract the model function must honor. | Wraps it as a service/endpoint other systems can trigger with one request. |
| 7 | Reusable | Refactoring / modularization | Keeps model logic isolated and versioned so it can be swapped without touching the wrapper. | Builds the shared interface/module boundary so callers don't duplicate integration logic. |
| 8 | Store | Data catalog / metadata store | Defines what metadata about a dataset/run actually matters for discovery and reuse. | Builds and maintains the catalog/metadata service that makes it queryable. |
| 9 | Store | Object storage | Defines what artifacts must persist (models, intermediate outputs) and for how long. | Implements cheap, durable storage and access patterns at scale. |
| 10 | Split | Tiling / chunking / partitioning | Defines what a valid chunk boundary looks like without breaking correctness. | Implements the splitting/partitioning mechanism at scale. |
| 11 | Split | Parallelization | Confirms the pieces are independent enough to run concurrently (no hidden shared state). | Implements the concurrent execution — workers, scheduling, aggregation. |
| 12 | Cloud | Compute provisioning | Estimates the compute/memory profile the job needs (CPU vs. GPU, size). | Provisions the right infrastructure on demand. |
| 13 | Cloud | Autoscaling / orchestration | Defines the load signals that indicate more or less compute is needed. | Implements the orchestration that scales machines up/down accordingly. |
| 14 | Cloud | Containerization | Specifies the runtime/dependency requirements the model needs to run correctly. | Builds and maintains the container image so it runs identically everywhere. |

Worked examples per row: `reference/lidar-examples.md` (⚠️ from a different project — illustrative only).
