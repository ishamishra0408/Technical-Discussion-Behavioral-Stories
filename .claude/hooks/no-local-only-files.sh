#!/bin/bash
# no-local-only-files — SessionEnd hook.
# Guarantee: nothing project-related stays on this machine alone.
# 1) syncs live agent/skill copies into the repo  2) commits any changes  3) pushes.
# Repo override via NLOF_REPO is for testing only.

REPO="${NLOF_REPO:-/Users/ishamishra/Desktop/TechDiscussion/Technical-Discussion-Behavioral-Stories}"
LOG="$HOME/.claude/no-local-only-files.log"

{
  echo "--- $(date '+%Y-%m-%d %H:%M:%S') SessionEnd sync"

  if [ -z "$NLOF_REPO" ]; then
    cp "/Users/ishamishra/Desktop/TechDiscussion/.claude/agents/research-auditor.md" \
       "$REPO/.claude/agents/research-auditor.md" 2>/dev/null
    cp "$HOME/.claude/skills/three-agent-loop/SKILL.md" \
       "$REPO/.claude/skills/three-agent-loop/SKILL.md" 2>/dev/null
  fi

  cd "$REPO" || { echo "repo not found"; exit 0; }
  git add -A
  if git diff --cached --quiet; then
    echo "nothing to commit"
  else
    git commit -q -m "auto: no-local-only-files sync (SessionEnd)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
    echo "committed: $(git log -1 --oneline)"
  fi
  git push -q && echo "pushed" || echo "push failed (will retry next session end)"
} >> "$LOG" 2>&1

exit 0
