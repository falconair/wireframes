---
type: regex
pattern: "Duplicate</li>\\s*<li>[^<]*Export"
match: contains
target:
  source: file
  path: "index.html"
---
