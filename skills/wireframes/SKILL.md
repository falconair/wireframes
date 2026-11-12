---
name: wireframes
description: Use when proposing or comparing UI changes for the user to decide on - after a design critique, UX or interaction audit, or design review, while brainstorming a screen or flow, when weighing UI options, sketching a screen that doesn't exist yet, or laying out empty, loading, error and phone-width states. Also when the user asks what a proposed screen or layout would look like. Not for colour, contrast or typography tweaks, or for UI changes the user has already decided and asked you to build.
---

# Wireframes

## Overview

A UI proposal is a picture, not a page of prose. Draw each change as a cheap wireframe:
the **Now** next to the **Proposed**, grey bars for everything that stays the same, real
labels only on the elements under discussion, and one sentence of why. It does **not**
reproduce the app's real look: no brand colours, no real fonts, no pixel fidelity. The user
sees the change at a glance, and drawing it costs few tokens.

**When not to use:** the change is purely visual style (colour, contrast, fonts, spacing
tokens), so describe it or show real CSS. Or the user has already decided and asked you to
build it, so build it. Or nothing about layout, controls or flow changes.

## The output

One self-contained HTML file, built like this:

1. **Path:** `docs/mockups/YYYY-MM-DD-<topic>.html` in the project, so mockups are kept
   with the code and can be committed. If the project already keeps mockups in another
   `mockups/` folder, use that one instead.
2. **Head:** copy everything from `<!doctype html>` to `</style></head><body>` in
   [kit.html](kit.html) verbatim. Change only `<title>`. Use kit classes only. Inline
   `style` is for size and spacing (width, height, margin, a `.menu`'s position), never colour.
3. `<h1>` and a one-line `.lede`.
4. One section per change: `<h2>N · outcome in the user's words</h2>`, then one layout:

| Situation | Layout | Labels |
|---|---|---|
| Something exists and should change | `.pair`: Now, then Proposed | `.lbl.b` "Now: what's wrong" · `.lbl.g` "Proposed: what changes" |
| The fix isn't decided | `.opts`: 2-3 options, with a small `.solo` Now above when the thing exists | `.lbl.o` "A · name (recommended)"; `.why` "+ gain · − cost" |
| Nothing exists yet | `.solo`: Proposed only | `.lbl.g`; numbered `.n` callouts explained in `.why` |
| One element across states or widths | `.strip`: one frame per state | `.lbl` "Empty", "Loading", "Error", "Phone"…; at most one `.why` under the strip |

5. Each side of a `.pair`, and each option, gets a label (10 words at most), its frame or
   frames, and one `.why` sentence. Use two frames on one side when the change is a sequence
   (menu, then the toast after it).

Read [kit.html](kit.html) once: below the CSS it has a worked example of each layout and an
index of every class.

## Drawing rules

- **Real text only where the decision is:** the changed control, its immediate neighbours, and
  the app name or breadcrumb for orientation. Everything else is `.box` (text line, set
  `width`), `.img` (image or chart) or a `.row` of grey bars.
- **Mark the one control that changes:** `.bad` (red dashed) on the problem in Now, `.good`
  (solid green) on the change in Proposed and on what sets each option apart. Mark nothing in
  a `.strip`. Outline the control, never a full-width bar or a whole frame, because frames clip
  outlines at their edges.
- **Something missing:** draw an empty dashed slot where it belongs
  (`<span class="in bad">no search here</span>`), not an outline on a nearby element.
- **Fit about 800px:** each `.pair` column is about 380px, so keep a `.bar` to about 5 items.
- **Kind of app:** web or desktop → `.f`; narrow screens or native mobile → `.phone`;
  terminal UI → `.f.mono.pad` with real text lines and grey bars for unchanged output.
- **Open questions** go in that side's `.why`, phrased as a question.
- **Budget:** at or under about 15 KB per file. A section over about 1.5 KB is drawing content
  nobody is deciding about, so swap that content for grey bars.

## Check it before showing

If a browser tool that can screenshot is available, open the file and look. In the Claude
desktop app, that means `mcp__Claude_Browser__preview_start` with `url: file://<absolute path>`,
then `mcp__Claude_Browser__computer` with action `screenshot`. If the browser refuses the local file,
treat the page as unviewed (see below). Check that each outline sits on its intended element, that
nothing is clipped or wrapped, and that overlays don't hide what they explain. Fix, then
look again.

With no screenshot tool (CLI, headless, subagent), re-read the markup against those checks
and say in the handover that the page hasn't been viewed.

## Hand it over

In chat, write only:

- the file as a markdown link relative to the project root;
- one line per section: number, title, and state ("ready", "pick A/B/C", or the open question);
- the decisions you need: one sentence each, your pick and the single main reason.

The drawings and their `.why` lines carry the detail and the trade-offs, so don't describe
them again. Wait for the user's picks
before building. Without a user to ask (subagent, headless), return the same three things
and stop.

## Common mistakes

| Mistake | Instead |
|---|---|
| Labelling every element | Label only what the decision touches |
| Restyling to match the app | Kit CSS verbatim; grey bars |
| A paragraph per drawing in chat | Link, one line per section, decisions |
