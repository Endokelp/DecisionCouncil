#!/usr/bin/env bash
# Install council + complementary skills globally (Claude Code + Cursor)
# Usage: curl -fsSL https://raw.githubusercontent.com/Endokelp/council-skill/main/install.sh | bash
#    or: ./install.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COUNCIL_SRC="$REPO_ROOT/skills/council"

if [[ ! -f "$COUNCIL_SRC/SKILL.md" ]]; then
  echo "error: SKILL.md not found at $COUNCIL_SRC" >&2
  exit 1
fi

install_council() {
  local dest="$1"
  local label="$2"
  mkdir -p "$dest"
  cp -R "$COUNCIL_SRC/." "$dest/"
  echo "  Installed council -> $dest  ($label)"
}

echo ""
echo "=== Council skill installer ==="

install_council "$HOME/.claude/skills/council" "Claude Code"
install_council "$HOME/.cursor/skills/council" "Cursor"

echo ""
echo "=== Complementary skills (global) ==="

run_skills_add() {
  echo "  npx skills add $*"
  npx --yes skills add "$@" || echo "  warning: npx skills add failed ($*). Install manually — see README."
}

run_skills_add mvanhorn/last30days-skill -g -y
run_skills_add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y

echo ""
echo "Done."
echo "  Claude Code: restart session, then  /council <your question>"
echo "  Cursor:      say  council this: <your question>"
echo "  Companions:  /last30days  and  /deep-research  should also be available."
echo ""
