# wireframe-proposals

A Claude Code skill for proposing UI changes as pictures, not prose. Each change is drawn
as a cheap wireframe: **Now** (red, dashed outline on the problem) next to **Proposed**
(green, solid outline on the change). Grey bars stand in for everything that stays the
same, and each side gets one sentence on why.

It deliberately doesn't copy your app's real look. A page of five proposals is about
10 KB of HTML, so it's quick to draw, quick to read and quick to change.

It triggers whenever UI changes are being proposed: after a design critique or UX
audit, while brainstorming a screen, when a plan changes layout, or when you ask
"what would that look like?". It has four layouts:

| Layout | Use it when |
|---|---|
| Now vs Proposed | something exists and should change |
| Options A / B / C | the fix isn't decided; each option shows its gain and cost |
| New screen | nothing exists yet; numbered callouts explain the parts |
| States strip | one element across empty, loading, error or phone width |

## Install

In Claude Code:

```
/plugin marketplace add falconair/wireframe-proposals
/plugin install wireframe-proposals@wireframe-proposals
```

To install it without the plugin system, copy `skills/wireframe-proposals/` into
`~/.claude/skills/`.

## What's in it

- `skills/wireframe-proposals/SKILL.md`: what to draw, the size budget, how to check
  it, and how to hand it over.
- `skills/wireframe-proposals/kit.html`: about 4 KB of fixed CSS that gets copied
  verbatim, plus one worked example of each layout.
- `tests/`: QA scenarios, each with its findings and the outputs with and without the skill.

Mockups are written to `docs/superpowers/specs/mockups/` in your project. The skill
screenshots each page in Claude's browser pane before showing it to you.
