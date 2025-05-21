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
    git push origin --force "$branch"
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
# Delete a git branch both locally and on origin with confirmation
git_branch_delete() {
  BRANCH_NAME="$1"
  
  echo -e "Are you sure you want to delete branch '${BRANCH_NAME}' locally and on origin? [y/N]"
  read -r confirm

  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    git branch -D "${BRANCH_NAME}"
    git push origin --delete "${BRANCH_NAME}"
    echo "Branch '${BRANCH_NAME}' deleted"
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

