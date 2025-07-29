#!/bin/bash


while true; do
    # Random sleep between 5 and 20 minutes
    SLEEP_TIME=$((5 + RANDOM % 30))
    echo "Sleeping for $SLEEP_TIME seconds..."
    sleep $SLEEP_TIME

    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    NEW_CONTENT="Auto-update performed at $TIMESTAMP"
    COMMIT_MESSAGE="Auto-update: $TIMESTAMP"
    BRANCH="main"

    echo "$NEW_CONTENT" > README.md

    git add .
    git commit -m "$COMMIT_MESSAGE"
    git push origin "$BRANCH"
done
