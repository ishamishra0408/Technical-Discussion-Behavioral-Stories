<!-- File Purpose: Dimension: ML-SWE collaboration. Compact grading rubric (5 buckets / 14 tasks). Mirrors the read-only skills-table Google Doc; worked examples live in reference/lidar-examples.md. -->
# ML-SWE collaboration — grading rubric

**One line:** DS's script proves the math works once. SWE makes that same math run unattended, on any size job, on rented machines, with no human babysitting.

| # | Bucket | Task | One-line meaning |
|---|--------|------|------------------|
| 1 | Reliable | Checkpointing / fault tolerance | Don't lose work on crash; resume where it stopped. |
| 2 | Reliable | Error handling / graceful failure | One bad input never kills the whole run. |
| 3 | Reliable | Logging / monitoring / observability | Failures leave a clear trail and raise an alert. |
| 4 | Reliable | Reproducibility / containerization | Same result every time; versions locked. |
| 5 | Reusable | Configuration / parameterization | Change settings without code edits. |
| 6 | Reusable | API / service endpoint | Other systems trigger it with one request. |
| 7 | Reusable | Refactoring / modularization | Shared logic lives once; everything imports it. |
| 8 | Store | Data catalog / metadata store | Every file findable by its properties. |
| 9 | Store | Object storage | Huge files held cheaply in cloud storage. |
| 10 | Split | Tiling / chunking / partitioning | Break oversized inputs into processable pieces. |
| 11 | Split | Parallelization | Process the pieces simultaneously. |
| 12 | Cloud | Compute provisioning | Rent power on demand for the job's size. |
| 13 | Cloud | Autoscaling / orchestration | Add machines under load, remove when idle. |
| 14 | Cloud | Containerization | Runs identically on any machine. |

Worked examples per row: `reference/lidar-examples.md` (⚠️ from a different project — illustrative only).
