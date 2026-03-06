#!/bin/bash
# Persistent typing indicator for a Discord channel
# Usage: typing-loop.sh <channel_id> <duration_seconds>
# Fires typing every 8 seconds for the specified duration
# Run in background: bash typing-loop.sh <id> 180 &

CHANNEL_ID="$1"
DURATION="${2:-120}"

if [ -z "$CHANNEL_ID" ]; then
  echo "Usage: typing-loop.sh <channel_id> [duration_seconds]"
  exit 1
fi

END_TIME=$((SECONDS + DURATION))
while [ $SECONDS -lt $END_TIME ]; do
  curl -s -X POST "https://discord.com/api/v10/channels/${CHANNEL_ID}/typing" \
    -H "Authorization: Bot ${DISCORD_BOT_TOKEN}" \
    -H "Content-Type: application/json" \
    > /dev/null 2>&1
  sleep 8
done
