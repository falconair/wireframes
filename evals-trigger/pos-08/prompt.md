---
name: pos-08
runs: 1
max_turns: 3
timeout_seconds: 180
allowed_tools: [Read, Glob, Grep, Skill]
---

our cli tool `deployctl status` prints a wall of text. propose a cleaner layout for the output - grouped by service, with the failing ones on top
