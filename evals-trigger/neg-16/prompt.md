---
name: neg-16
runs: 1
max_turns: 3
timeout_seconds: 180
allowed_tools: [Read, Glob, Grep, Skill]
---

Our GET /orders endpoint got slow after we added the loyalty tier per order (N+1 query). Propose a few fixes with trade-offs.
