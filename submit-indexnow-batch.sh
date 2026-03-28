#!/usr/bin/env bash
set -euo pipefail

KEY="8825677c4165429e412f8f7cafe82339100afcf7e7853741791914311511dda4"
HOST="rubyonrails.info"

# Provide URLs as args; defaults to key sections if none provided
if [[ "$#" -gt 0 ]]; then
  URLS_JSON="["
  for url in "$@"; do
    if [[ "$URLS_JSON" != "[" ]]; then
      URLS_JSON+=", "
    fi
    URLS_JSON+="\"$url\""
  done
  URLS_JSON+="]"
else
  URLS_JSON='["https://rubyonrails.info/", "https://rubyonrails.info/#about", "https://rubyonrails.info/#experience", "https://rubyonrails.info/#skills", "https://rubyonrails.info/#education", "https://rubyonrails.info/#contact"]'
fi

PAYLOAD=$(cat <<JSON
{
  "host": "$HOST",
  "key": "$KEY",
  "urlList": $URLS_JSON
}
JSON
)

curl -s -H 'Content-Type: application/json' -d "$PAYLOAD" https://www.bing.com/indexnow

