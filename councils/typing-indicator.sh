#!/bin/bash
# Send a typing indicator to a Discord channel/thread
# Usage: typing-indicator.sh <channel_id>
# Triggers "is typing..." for ~10 seconds

CHANNEL_ID="$1"
if [ -z "$CHANNEL_ID" ]; then
  echo "Usage: typing-indicator.sh <channel_id>"
  exit 1
fi

curl -s -X POST "https://discord.com/api/v10/channels/${CHANNEL_ID}/typing" \
  -H "Authorization: Bot ${DISCORD_BOT_TOKEN}" \
  -H "Content-Type: application/json" \
  > /dev/null 2>&1

echo "ok"
