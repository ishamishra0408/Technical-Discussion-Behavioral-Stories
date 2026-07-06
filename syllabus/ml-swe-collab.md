<!-- File Purpose: Dimension: ML-SWE collaboration. Home of the DS-vs-SWE LiDAR skills table. TODO -->
# SWE vs DS — Plain Meaning vs Engineering Term

**LiDAR Asset Extraction Pipeline · SWE-owned work.**
Scripts: `span_to_span_matching.py`, `wire_metadata_fetching.py`, pole detection, wire topology, orchestration.

## Make scripts reliable

| What it means (example) | Engineering term |
|---|---|
| **Don't lose work on crash** — Script dies halfway through 39k miles of data; make it save progress and resume where it stopped. | Checkpointing / fault tolerance |
| **Survive bad files** — One corrupt file kills the whole run; skip it, log it, keep going. | Error handling / graceful failure |
| **Know why it broke** — Failure at 3am needs a clear trail and an alert. | Logging / monitoring / observability |
| **Same result every time** — Must not be "works on Rishabh's laptop"; lock exact code + library versions. | Reproducibility / containerization |

## Make scripts reusable

| What it means (example) | Engineering term |
|---|---|
| **Change settings without code edits** — Move numbers like the 100m search radius into a settings file anyone can edit. | Configuration / parameterization |
| **Trigger automatically** — Turn a hand-run script into something other systems call with one request. | API / service endpoint |
| **Stop copy-paste** — Put shared logic in one place every script imports. | Refactoring / modularization |

## Store & organize the raw map data

| What it means (example) | Engineering term |
|---|---|
| **Make files findable** — Searchable index of each file: location, area, quality, coordinate system. Replaces the weak `las_bounds` file with a proper table. | Data catalog / metadata store |
| **Hold huge files cheaply** — Keep raw files in cloud storage, not one machine's hard drive. | Object storage (S3) / blob storage |

## Split huge files

| What it means (example) | Engineering term |
|---|---|
| **Break files down** — ENEL Spain files are too big to open at once; cut into a grid of small squares. | Tiling / chunking / partitioning |
| **Do many at once** — Process the small squares at the same time, not one by one. | Parallelization |

## Run on big machines / cloud

| What it means (example) | Engineering term |
|---|---|
| **Rent power on demand** — Use a 64GB / 32-core cloud machine for a 10-min job instead of 35 min on a laptop. | Cloud compute / provisioning |
| **Scale up and down** — Add machines for a 39k-mile job, remove them when idle. | Autoscaling / orchestration (Kubernetes) |
| **Run anywhere identically** — Package code + every dependency so it runs the same on any machine. | Containerization (Docker) |

**One line:** DS's script proves the math works once. SWE makes that same math run unattended, on any size job, on rented machines, with no human babysitting.

## ML-adjacent work you did → How to write it as an Engineer
 
| What you did | How to write it |
|---|---|
| Optimized search algorithms | Hill-climbed ML search models on relevance |
| A/B tested ranking changes | Ran offline and online evals to ship model updates |
| Tuned a recommendation feed | Traded off engagement vs quality on a recommender |
| Owned spam or fraud rules | Set precision and recall targets on a classifier |
| Investigated bad search or feed results | Diagnosed model failure modes in production |
| Labeled or reviewed content at scale | Built and structured training data |
 
**Only Engineer work that already touched ML, ranking, relevance, or data belongs here.** No model in the original work means no honest AI bullet. That gap is what the portfolio project fills.
 