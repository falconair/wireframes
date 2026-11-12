# Publishing wireframes

For the maintainer: how to release a version, and where the skill is listed. Users don't need
this file; the README covers installing.

## The manifests

One repo serves every agent. Keep `name`, `version` and `description` the same in all of them.

| File | Read by |
|---|---|
| `skills/wireframes/SKILL.md` | every agent that supports Agent Skills |
| `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` | Claude Code; Copilot CLI and Codex also read them |
| `plugin.json` (root, [Agent Plugins 1.0.0](https://agent-plugins.org/schemas/1.0.0/plugin.schema.json)) | Copilot CLI and VS Code, Cursor, Codex, Antigravity, github/awesome-copilot |
| `gemini-extension.json` | Gemini CLI extensions and its gallery |
| `.cursor-plugin/marketplace.json` | Cursor's "From GitHub Repository" import |

The root `plugin.json` schema doesn't allow extra keys. Agent-specific fields (such as
Antigravity's `displayName` and `logo`) belong in that agent's own manifest folder.

## Releasing a version

1. Bump `version` in `plugin.json`, `.claude-plugin/plugin.json` and `gemini-extension.json`.
2. Validate:
   ```bash
   claude plugin validate --strict .
   gemini extensions validate .
   ```
3. Run the evals (Claude Code; about $5 for both suites):
   ```bash
   claude plugin eval . --allow-tools Write Edit Bash --scaffold --no-publish
   claude plugin eval . --eval-dir evals-trigger --ablation none --no-publish
   ```
4. Commit, then tag and release:
   ```bash
   git tag v0.1.0 && git push origin v0.1.0
   gh release create v0.1.0 --generate-notes
   ```

## Where it's listed

| Where | How to get listed | Needs | Status |
|---|---|---|---|
| GitHub (falconair/wireframes) | public repo | | live |
| Claude Code marketplace in this repo | `/plugin marketplace add falconair/wireframes` | `.claude-plugin/` | live, tested |
| Gemini CLI extensions gallery | automatic: the crawler picks up repos with the `gemini-cli-extension` topic once a day | root `gemini-extension.json` | topic added |
| skills.sh | automatic: ranked by `npx skills` install counts | nothing | appears once people install it |
| shahbazac.com | card in `_data/open_source.yml` | | to do |
| falconair/skills gallery | add an entry | | to do |
| Anthropic plugin directory (claude.ai, Cowork, Claude Code) | submit at [claude.ai/directory/manage](https://claude.ai/directory/manage). Don't open PRs to anthropics/claude-plugins-official; they aren't monitored | paid claude.ai plan; `claude plugin validate --strict` passes; safety and policy review | to do |
| OpenAI plugin directory (ChatGPT, Codex) | upload a ZIP of the repo at [platform.openai.com/plugins](https://platform.openai.com/plugins) and choose "Skills only"; it converts `.claude-plugin/plugin.json` | verified identity; review; no hooks | to do |
| Cursor Marketplace | submit the repo at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish); every plugin is reviewed by hand | open source, README, kebab-case name, valid manifest | to do |
| github/awesome-copilot (the default Copilot CLI and VS Code marketplace) | the "external plugin" issue form in that repo; don't edit `external.json` in a PR | release tag plus full commit SHA, licence, root `plugin.json`, an install smoke test | to do after the first release |
| Antigravity Marketplace | the partner intake form linked from antigravity.google/docs/build-plugins, after `agy plugin validate --strict` passes | `displayName`, `logo`, `author` in an Antigravity manifest; README | to do; needs a logo |
| hesreallyhim/awesome-claude-code | issue form only, no PRs | repo at least 14 days old with ongoing commits, or 100+ stars | eligible from 2026-11-26 |
| VoltAgent/awesome-agent-skills | PR titled `Add skill: falconair/wireframes` | evidence of real community use; brand-new skills are turned down | later |

Directory rules change often. Check each one's current submission page before applying.
