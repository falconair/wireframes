---
name: pair-settings-save
tags: [positive, pair]
runs: 1
max_turns: 25
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Write, Edit, Bash, Skill]
---

I ran a quick usability test on the Settings page of our team dashboard (web app). Two
problems came up:

1. Settings is one long form (Profile, Notifications, Billing, API keys). The only Save
   button is at the very bottom. People change a toggle near the top, never scroll down,
   leave, and lose the change. There's no "unsaved changes" warning.
2. The "Regenerate API key" button sits right under the key, styled exactly like "Copy".
   Regenerating instantly breaks every integration using the old key.

What would you change? Give me your fix for each.
