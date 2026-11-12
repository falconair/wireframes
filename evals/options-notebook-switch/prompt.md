---
name: options-notebook-switch
tags: [positive, opts]
runs: 1
max_turns: 25
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Write, Edit, Bash, Skill]
---

Our notes app (phone-first, also on desktop web) puts notebooks in a hamburger drawer on
the left. Analytics say people with 5+ notebooks switch notebooks about 12 times a day and
each switch is 3 taps (menu, scroll, tap). I'm not sure what the better pattern is: a
notebook picker in the title, a bottom tab bar of favourite notebooks, a search-first
"jump to" box, or something else. Give me a few options with the trade-offs so we can decide.
