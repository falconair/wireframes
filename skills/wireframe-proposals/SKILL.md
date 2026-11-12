---
name: wireframe-proposals
description: Use when proposing, comparing or explaining UI changes - after a design critique, UX or interaction audit, accessibility or design review, while brainstorming a screen or flow, when a plan or spec changes layout, navigation or controls, when choosing between UI options, sketching a screen that doesn't exist yet, or showing empty, loading, error and phone-width states. Also when the user asks "what would that look like" or "show me".
---

# Wireframe proposals

## Overview

A UI proposal is a picture, not a page of prose. Draw each change as a cheap wireframe:
the **Now** next to the **Proposed**, grey bars for everything that stays the same, real
labels only on the elements under discussion, and one sentence of why. It does **not**
reproduce the app's real look: no brand colours, no real fonts, no pixel fidelity. The
value is that the user sees the change at a glance and you spend few tokens drawing it.

## The output

One self-contained HTML file, built like this:

1. **Path:** `<project root>/docs/superpowers/specs/mockups/YYYY-MM-DD-<topic>.html`. Create
   the folder if it's missing. Write it inside the project: the browser pane renders
   `file://` pages only from the session's project folder, and refuses files in `/tmp`,
   the scratchpad or `~/.claude` as "a local file", so you can't screenshot them.
2. **Head:** copy everything from `<!doctype html>` to `</style></head><body>` in
   [kit.html](kit.html) verbatim. Change only `<title>`. Add no new classes. Inline `style`
   is for size and spacing (width, height, margin, position of a `.menu`); colour comes only
   from kit classes (`.red`, `.mut`, `.lk`, `.hl`).
3. `<h1>` and a one-line `.lede`.
4. One section per change: `<h2>N · outcome in the user's words</h2>`, then exactly one
   of these layouts:

| Situation | Layout | Labels |
|---|---|---|
| Something exists and should change | `.pair`: Now, then Proposed | `.lbl.b` "Now: what's wrong" · `.lbl.g` "Proposed: what changes" |
| The fix isn't decided | `.opts`: 2-3 options (put a small `.solo` Now above it when the thing exists) | `.lbl.o` "A · name (recommended)"; `.why` "+ gain · − cost" |
| Nothing exists yet | `.solo`: Proposed only | `.lbl.g`; numbered `.n` callouts explained in `.why` |
| One element across states or widths | `.strip`: one frame per state | `.lbl` "Empty", "Loading", "Error", "Signed out", "375px"…; at most one `.why` under the strip |

5. Each side of a `.pair`, and each option, has its label (10 words at most), its frame or
   frames, and one `.why` sentence. Use two frames on one side when the change is a
   sequence (menu, then the toast after it).

[kit.html](kit.html) has one worked example of each layout below the CSS. Read it once
for the markup pattern.

## Drawing rules

- **Real text only where the decision is:** the changed control, its immediate
  neighbours, the app name or breadcrumb for orientation. Everything else is
  `.box` (text line, set `width`), `.img` (image or chart) or a `.row` of grey bars.
- **Mark the one control that changes:** `.bad` (red dashed) on the problem in Now, `.good`
  (solid green) on the change in Proposed, and on what makes each option distinct in `.opts`.
  Mark nothing in a `.strip`. Outline the control, not a full-width bar or whole frame: frames
  clip outlines at their edges.
- **Something missing:** when the problem is an absence, draw an empty dashed slot where it
  belongs (`<span class="in bad">no search here</span>`). Don't outline a nearby element.
- **Fit the pane:** it is about 800px wide, so each `.pair` column is about 380px. Keep a `.bar`
  to about 5 items or it wraps. Use `.chk` for checkboxes, `.in` for inputs, `.chip` for chips.
- **Width matters → `.phone`** (240px frame standing in for 375px). Use it when the problem is
  about narrow screens. Otherwise use desktop frames `.f`.
- **Overlays** sit inside the frame they cover: `.menu` (dropdown, positioned under the bar), `.dlg`
  (dialog), `.sheet` (bottom sheet, in `.phone`), `.toast`, `.hint` (inline notice).
- **Open questions** go in that side's `.why`, phrased as a question.

## Budget

The kit CSS is fixed at about 4 KB. Markup should stay **at or under about 1.5 KB per section** (2 KB for options drawn as phones),
and **at or under about 15 KB for the whole file** with 5 changes. Over budget means you're drawing content
nobody is deciding about: replace it with grey bars.

## Verify before showing

1. `preview_start` with `url: file://<absolute path>` (built-in browser pane only).
2. `computer` → `screenshot`. Check that every `.bad`/`.good` outline sits on the intended element,
   that no label or button is clipped or wrapped awkwardly, and that overlays don't cover the
   thing they explain.
3. Fix and re-shoot until it reads right at a glance. If the screenshot is refused as "a
   local file", the file is outside the project folder (see step 1 of The output).

## Hand it over

The pane already shows the page. In chat, write:

- the file as a markdown link relative to the project root, e.g.
  `[2026-11-12-search.html](docs/superpowers/specs/mockups/2026-11-12-search.html)`;
- one line per section: number, title, and its state (ready, or "pick A/B/C", or the open question);
- the decisions you need, each with your recommendation.

Don't re-describe what the drawings show. Wait for the user's OK or picks before building.

## Common mistakes

| Mistake | Instead |
|---|---|
| Writing your own CSS or restyling to match the app | Kit CSS verbatim; grey bars |
| Labelling every element | Label only what the decision touches |
| Proposed with no Now | Use `.pair`, or `.solo` only when nothing exists |
| Outlining the whole frame | Outline the one control that changes |
| Long chat recap of every drawing | Path, one line per section, decisions |
| Saving to /tmp or the scratchpad | Use the project's `docs/superpowers/specs/mockups/` |
| Showing it unseen | Screenshot in the pane first |
