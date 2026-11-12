---
name: negative-api-latency
tags: [negative]
runs: 1
max_turns: 25
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Write, Edit, Bash, Skill]
---

Our GET /orders endpoint (Python, FastAPI, Postgres) went from ~120 ms to ~900 ms p95 after
we added the customer's loyalty tier to each order. The tier comes from a second query per
order. Propose a few ways to fix it with their trade-offs so I can pick one.
