#!/usr/bin/env bash
# Install DecisionCouncil + companion skills globally (Claude Code + Cursor)
# Usage: curl -fsSL https://raw.githubusercontent.com/Endokelp/DecisionCouncil/main/install.sh | bash
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
echo "=== DecisionCouncil installer ==="

install_council "$HOME/.claude/skills/council" "Claude Code"
install_council "$HOME/.cursor/skills/council" "Cursor"

echo ""
echo "=== Companion skills (global) ==="

run_skills_add() {
  echo "  npx skills add $*"
  npx --yes skills add "$@" || echo "  warning: npx skills add failed ($*). Install manually. See README."
}

run_skills_add mvanhorn/last30days-skill -g -y
run_skills_add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y

echo ""
echo "Done."
echo "  skills.sh:   npx skills add Endokelp/DecisionCouncil --skill council -g -y"
echo "  Cursor:      restart, then  council this: <your question>"
echo "  Claude Code: restart, then  /council <your question>"
echo ""
