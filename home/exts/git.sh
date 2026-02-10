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

# Delete local branches and worktrees that have been merged or deleted on the remote.
# Uses worktrunk (wt) to handle worktree+branch cleanup in one pass.
git_cleanup() {
    if ! command -v wt >/dev/null 2>&1; then
        echo "error: wt (worktrunk) is required but not installed"
        return 1
    fi

    git fetch -p

    local default_branch
    default_branch=$(git rev-parse --abbrev-ref origin/HEAD 2>/dev/null | sed 's|origin/||')
    : "${default_branch:=main}"

    # Find branches that are integrated or same-commit (safe to delete),
    # excluding the default branch and the current worktree.
    branches=$(wt list --format=json --branches | jq -r --arg default "$default_branch" '
        .[] | select(
            (.is_main | not) and
            (.is_current | not) and
            (.branch != $default) and
            (.main_state == "integrated" or .main_state == "empty" or .main_state == "same_commit")
        ) | .branch
    ')

    if [ -z "$branches" ]; then
        echo "Nothing to clean up."
        return 0
    fi

    echo -e "\nDelete these merged branches and their worktrees? [y/N]"
    echo "$branches"
    read -r confirm

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo "$branches" | xargs wt remove --force --force-delete --yes
        echo "Cleanup complete."
    else
        echo "Cancelled."
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

