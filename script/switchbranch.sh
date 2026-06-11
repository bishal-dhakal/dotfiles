
#!/bin/bash

BRANCH=$1

NEW_BRANCH=$2

if [ -z "$BRANCH" ]; then

  echo "❌ Usage: checkoutandpull <branch> [new-branch]"

  exit 1

fi

run_git() {

  local dir=$1

  local name=$(basename "$dir")

  local git_cmd="git -C $dir"

  [ "$dir" = "$PWD" ] && git_cmd="git"

  echo "📦 $name"

  # Stash if dirty

  if ! $git_cmd diff --quiet || ! $git_cmd diff --cached --quiet; then

    echo "⚠️  Uncommitted changes — stashing..."

    $git_cmd stash push -m "auto-stash before $BRANCH"

  fi

  # Skip checkout if already on the branch

  CURRENT=$($git_cmd rev-parse --abbrev-ref HEAD)

  if [ "$CURRENT" != "$BRANCH" ]; then

    $git_cmd checkout "$BRANCH" || {

      echo "❌ Failed to checkout $BRANCH"

      FAILED+=("$name")

      return

    }

  else

    echo "✅ Already on $BRANCH, skipping checkout"

  fi

  # Pull

  $git_cmd pull origin "$BRANCH" || {

    echo "❌ Failed to pull $BRANCH"

    FAILED+=("$name")

    return

  }

  # Create new branch if provided

  if [ -n "$NEW_BRANCH" ]; then

    $git_cmd checkout -b "$NEW_BRANCH" && \

      echo "🌿 Created and switched to $NEW_BRANCH" || \

      echo "⚠️  Branch $NEW_BRANCH may already exist"

  fi

  SUCCESS=$((SUCCESS + 1))

  echo "---"

}

SUCCESS=0

FAILED=()

echo "🔀 Branch: $BRANCH"

[ -n "$NEW_BRANCH" ] && echo "🌿 New branch: $NEW_BRANCH"

echo ""

if [ -d "$PWD/.git" ]; then

  run_git "$PWD"

else

  for dir in "$PWD"/*/; do

    [ -d "$dir/.git" ] && run_git "$dir"

  done

fi

echo ""

echo "✅ $SUCCESS succeeded | ❌ ${#FAILED[@]} failed"

for f in "${FAILED[@]}"; do echo "   - $f"; done

