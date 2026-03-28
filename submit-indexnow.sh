#!/usr/bin/env bash
set -euo pipefail

KEY_FILE="8825677c4165429e412f8f7cafe82339100afcf7e7853741791914311511dda4.txt"
KEY="$(cat "$KEY_FILE")"
DEFAULT_URL="https://rubyonrails.info/"
URL="${1:-$DEFAULT_URL}"

if [[ -z "$KEY" ]]; then
  echo "IndexNow key file is empty: $KEY_FILE" >&2
  exit 1
fi

# Submit URL to IndexNow (Bing-supported)
# You can pass a different URL as the first argument.
curl -s "https://www.bing.com/indexnow?url=${URL}&key=${KEY}"
