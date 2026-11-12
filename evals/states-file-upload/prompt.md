---
name: states-file-upload
tags: [positive, strip]
runs: 1
max_turns: 25
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Write, Edit, Bash, Skill]
---

The attachment uploader in our support-ticket form (web) only has designs for two states:
the empty drop zone and the finished file list. Engineers keep guessing the rest. Propose
what it should look like while a file is dragged over it, while uploading (with progress and
cancel), when a file is too big (25 MB limit), when the network drops mid-upload, and at
phone width.
