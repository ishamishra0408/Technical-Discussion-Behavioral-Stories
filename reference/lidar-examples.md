<!-- File Purpose: ⚠️ Teaching examples from a DIFFERENT project (LiDAR asset-extraction pipeline) — illustrative only, NOT one of Isha's 3 stories. Split out of syllabus/ml-swe-collab.md. -->
# Skills table — worked examples (LiDAR pipeline)

Concrete plain-language examples behind each rubric term, from a different project — a LiDAR asset-extraction pipeline (`span_to_span_matching.py`, `wire_metadata_fetching.py`, pole detection, wire topology, orchestration). Map to your own stories.

| Rubric term | Plain meaning (LiDAR example) |
|---|---|
| Checkpointing / fault tolerance | Script dies halfway through 39k miles of data; save progress, resume where it stopped. |
| Error handling / graceful failure | One corrupt file kills the run; skip it, log it, keep going. |
| Logging / monitoring / observability | Failure at 3am needs a clear trail and an alert. |
| Reproducibility / containerization | Not "works on one laptop"; lock exact code + library versions. |
| Configuration / parameterization | Move the 100m search radius into a settings file anyone can edit. |
| API / service endpoint | Turn a hand-run script into something other systems call with one request. |
| Refactoring / modularization | Shared logic in one place every script imports. |
| Data catalog / metadata store | Searchable index per file: location, area, quality, coordinate system. |
| Object storage | Raw files in cloud storage, not one machine's disk. |
| Tiling / partitioning | ENEL Spain files too big to open; cut into a grid of small squares. |
| Parallelization | Process the squares at the same time, not one by one. |
| Cloud compute / provisioning | 64GB/32-core cloud machine for a 10-min job vs 35 min on a laptop. |
| Autoscaling / orchestration | Add machines for a 39k-mile job, remove them when idle. |
| Containerization | Package code + dependencies to run identically anywhere. |
