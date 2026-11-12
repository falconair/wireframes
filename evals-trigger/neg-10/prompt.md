---
name: neg-10
runs: 1
max_turns: 3
timeout_seconds: 180
allowed_tools: [Read, Glob, Grep, Skill]
---

the disabled state on our primary button fails WCAG contrast (2.1:1). bump it so it passes AA, the color is in src/styles/tokens.css
