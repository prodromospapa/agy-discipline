# agy-discipline

Personal cost-discipline rules for [Antigravity (agy)](https://antigravity.google/docs/cli-using) delegation in Claude Code, layered on top of the [antigravity-for-claude-code](https://github.com/yuting0624/antigravity-for-claude-code) plugin.

This plugin does not add delegation capability itself — install `antigravity-for-claude-code` for that. It only injects session-start guardrails learned from real usage:

1. **Pre-flight** — run `agy-doctor` once per session before the first delegation.
2. **Short leash** — never let a delegation call, or a subagent wrapping it, wait past the plugin's configured timeout without a progress signal. On a quota/rate-limit error (429 / RESOURCE_EXHAUSTED), stop calling agy for the rest of the session instead of retrying.
3. **Session cost-awareness** — flag it when a delegation turned out to be a net loss versus doing the task directly, not just when it looks profitable in isolation.
4. **Verify, always** — never trust agy's self-reported success; independently check the result.

## Install

```
claude plugin marketplace add https://github.com/<your-username>/agy-discipline.git
claude plugin install agy-discipline@agy-discipline
```

## Configure

```
/plugin configure agy-discipline@agy-discipline
```

`enabled` (default `on`) toggles the session-start injection off if desired.
