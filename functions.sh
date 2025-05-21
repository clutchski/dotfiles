#!/usr/bin/env bash


. ~/.exts/git.sh
. ~/.exts/blackhole.sh


# Run claude from the repository root
claude-root() {
  local root_dir
  root_dir=$(git rev-parse --show-toplevel 2>/dev/null)

  if [ $? -eq 0 ]; then
    cd "$root_dir" && claude "$@"
  else
    claude "$@"
  fi
}

# Remove vim swp files
vimclean () {
    rm -rf ~/.vim/tmp
    mkdir -p ~/.vim/tmp
    rm -rf ~/.cache/ctrlp
    find . -name "*.sw*" -exec rm {} \;
}

# Print the directory of a Python module.
pymod ()  {
    # FIXME: could replace in the middle of a path
    python -c "import $1; print($1.__file__.replace('.pyc', '.py'))"
}

alias_if_exists () {
    which $1 &> /dev/null
    if [ $? -eq 0 ]
    then
        alias $2="$1"
    fi
}

camera_reset() {
    sudo killall VDCAssistant
    sudo killall AppleCameraAssistant
}

youtube_to_mp3() {
    yt-dlp --extract-audio --audio-format mp3 $1:x
}

op_save_login() {
  if [ "$#" -lt 2 ]; then
    echo "Usage: op_save_login <url> <base_email> [--no-alias]"
    return 1
  fi

  if ! command -v op >/dev/null 2>&1; then
    echo "❌ 1Password CLI 'op' not found."
    return 1
  fi

  if ! command -v jq >/dev/null 2>&1; then
    echo "❌ 'jq' is required but not found."
    return 1
  fi

  URL="$1"
  BASE_EMAIL="$2"
  USE_ALIAS=true

  # Optional third argument: --no-alias
  if [ "$3" = "--no-alias" ]; then
    USE_ALIAS=false
  fi

  # Extract base domain (e.g. getmulberry.com from accounts.getmulberry.com)
  FULL_DOMAIN=$(echo "$URL" | sed -E 's|https?://||' | cut -d/ -f1)
  DOMAIN=$(echo "$FULL_DOMAIN" | awk -F. '{if (NF>=2) print $(NF-1)"."$NF; else print $0}')

  if [ "$USE_ALIAS" = true ]; then
    EMAIL_NAME=$(echo "$BASE_EMAIL" | cut -d@ -f1)
    EMAIL_DOMAIN=$(echo "$BASE_EMAIL" | cut -d@ -f2)
    FINAL_EMAIL="${EMAIL_NAME}+${DOMAIN}@${EMAIL_DOMAIN}"
  else
    FINAL_EMAIL="$BASE_EMAIL"
  fi

  echo "🔐 Creating 1Password login for $DOMAIN using email: $FINAL_EMAIL..."

  ITEM_JSON=$(op item create \
    --category=login \
    "title=$DOMAIN" \
    "username=$FINAL_EMAIL" \
    "url=$URL" \
    --generate-password \
    --format=json)

  ITEM_ID=$(echo "$ITEM_JSON" | jq -r '.id')

  if [ -z "$ITEM_ID" ] || [ "$ITEM_ID" = "null" ]; then
    echo "⚠️ Failed to retrieve item ID from 1Password response."
    return 1
  fi

  LINK="https://start.1password.com/open/i?a=items&v=All%20Vaults&i=$ITEM_ID"

  echo "✅ Login saved as '$DOMAIN'"
  echo "🔗 View in 1Password: $LINK"
}


