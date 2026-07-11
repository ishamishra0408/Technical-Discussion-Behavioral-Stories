<!-- File Purpose: Hackathon research system — external research, NEVER facts about Isha. -->
# hackathon-research/

⚠️ **Provenance carve-out (same rule as `reference/`):** everything in this folder is external research — judges, repos, event intel. Nothing here is Isha's account. Never cite this folder as her facts; her facts live only in `personal-context/`.

## What this is
Per-event research packages + a reusable auto-research pipeline that produces them.

- `config/auto-research.md` — the packaged pipeline (sources, filters, ranking criteria, templates). A weekly scheduled agent runs it over new Bay Area AI hackathons.
- `events/<date>-<slug>/` — one folder per researched event:
  - `report.md` — final research report (anchor people, repo pick, iteration plan, brand phrase, RAT)
  - `roads-not-taken.md` — unvisited decision branches: insight + revisit trigger
  - `build-plan.md` — build-window plan, team split, test cases

## How to re-run the pipeline manually
Give Claude Code the event URL + `config/auto-research.md` and say "run the hackathon pipeline on this event."
