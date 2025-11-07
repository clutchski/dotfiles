#
# little git extentions
#


# common typo
alias gitst="git st"

# Force push the current branch, as long as it's not master or main.
git_force_push() {
  branch=$(git rev-parse --abbrev-ref HEAD)

  if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
    echo "No force pushing to '$branch"
  else
    git push origin --force-with-lease "$branch"
  fi
}

# Prune remote branches and delete local branches that have been deleted on the remote
git_branch_cleanup() {
    git fetch -p

    deleted_branches=$(git branch -vv | grep ': gone]' | awk '{print $1}')

    if [ -z "$deleted_branches" ]; then
        return 0
    fi

    echo -e "\nDo you want to delete these local branches? [y/N]"
    echo "$deleted_branches"
    read -r confirm

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo "$deleted_branches" | xargs -r git branch -D
        echo "Branches deleted successfully."
    else
        echo "Operation cancelled."
    fi
}
# Delete git branches both locally and on origin with confirmation
git_branch_delete() {
  if [ $# -eq 0 ]; then
    echo "Usage: git_branch_delete <branch1> [branch2] [branch3] ..."
    return 1
  fi
  
  echo -e "Are you sure you want to delete the following branches locally and on origin? [y/N]"
  for branch in "$@"; do
    echo "  - ${branch}"
  done
  read -r confirm

  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    for branch in "$@"; do
      echo "Deleting branch '${branch}'..."
      git branch -D "${branch}"
      git push origin --delete "${branch}"
      echo "Branch '${branch}' deleted"
    done
  else
    echo "Operation cancelled."
  fi
}

git_branch_squash() {
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    BASE=${1:-main}
    MERGE_BASE=$(git merge-base HEAD $BASE)
    echo "Squashing $BRANCH onto $BASE (merge-base: $MERGE_BASE)"
    git reset --soft $MERGE_BASE && echo "All changes staged. Commit manually with: git commit"
}

# Create a git worktree in a parallel directory
git_worktree_new() {
  if [ $# -eq 0 ]; then
    echo "Usage: git_worktree_new <branch_name> [base_branch]"
    echo "  Creates a worktree in a parallel directory"
    echo "  Default base branch: main"
    return 1
  fi

  BRANCH_NAME="$1"
  BASE_BRANCH="${2:-main}"

  # Get the repo name and parent directory
  REPO_ROOT=$(git rev-parse --show-toplevel)
  REPO_NAME=$(basename "$REPO_ROOT")
  PARENT_DIR=$(dirname "$REPO_ROOT")

  # Sanitize branch name for directory (replace / with -)
  SANITIZED_BRANCH=$(echo "$BRANCH_NAME" | tr '/' '-')

  # Create worktree directory name
  WORKTREE_DIR="${PARENT_DIR}/${REPO_NAME}-${SANITIZED_BRANCH}"

  if [ -d "$WORKTREE_DIR" ]; then
    echo "Error: Directory already exists: $WORKTREE_DIR"
    return 1
  fi

  echo "Creating worktree for branch '${BRANCH_NAME}' from '${BASE_BRANCH}'..."
  echo "Location: ${WORKTREE_DIR}"

  git worktree add -b "$BRANCH_NAME" "$WORKTREE_DIR" "$BASE_BRANCH"

  if [ $? -eq 0 ]; then
    echo "Worktree created successfully!"

    # Copy .env if it exists
    if [ -f "$REPO_ROOT/.env" ]; then
      cp "$REPO_ROOT/.env" "$WORKTREE_DIR/.env"
      echo "Copied .env file"
    fi

    # Copy .claude/settings.local.json if it exists
    if [ -f "$REPO_ROOT/.claude/settings.local.json" ]; then
      mkdir -p "$WORKTREE_DIR/.claude"
      cp "$REPO_ROOT/.claude/settings.local.json" "$WORKTREE_DIR/.claude/settings.local.json"
      echo "Copied .claude/settings.local.json file"
    fi

    # Run mise trust if mise is available and config exists
    if command -v mise >/dev/null 2>&1; then
      if [ -f "$WORKTREE_DIR/.mise.toml" ] || [ -f "$WORKTREE_DIR/mise.toml" ]; then
        mise trust "$WORKTREE_DIR"
      fi
    fi

    cd "$WORKTREE_DIR"
  else
    echo "Failed to create worktree"
    return 1
  fi
}

# Delete a git tag both locally and on origin with confirmation
git_tag_delete() {
  TAG_NAME="$1"

  echo -e "Are you sure you want to delete tag '${TAG_NAME}' locally and on origin? [y/N]"
  read -r confirm

  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    git tag -d "${TAG_NAME}"
    git push origin --delete "refs/tags/${TAG_NAME}"
    echo "Tag '${TAG_NAME}' deleted"
  fi
}

