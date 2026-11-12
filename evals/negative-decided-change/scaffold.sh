#!/usr/bin/env bash
cat > index.html <<'HTML'
<!doctype html><html><body>
<div class="toolbar"><button>New</button><button>Export</button>
<details class="more"><summary>More</summary><ul><li>Duplicate</li><li>Archive</li></ul></details></div>
</body></html>
HTML
