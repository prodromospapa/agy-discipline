#!/usr/bin/env bash
#
# SessionStart hook: inject personal Antigravity delegation-discipline rules
# as session context. Complements antigravity-for-claude-code's coding_policy
# hook; does not replace it. Prints the hookSpecificOutput JSON on stdout.
#
# Toggle off via plugin userConfig `enabled` (env CLAUDE_PLUGIN_OPTION_ENABLED:
# off / false / 0 / no / disabled). Default: on.
#
set -uo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"

raw="$(printf '%s' "${CLAUDE_PLUGIN_OPTION_ENABLED:-on}" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')"
case "$raw" in
  off|false|0|no|disabled) exit 0 ;;
esac

cat "$HERE/discipline-context.json"
exit 0
