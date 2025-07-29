#!/bin/bash

# Configuration
BRANCH="auto-update"
REPO_DIR=$(pwd)
LOG_FILE="$REPO_DIR/auto-update.log"

# Ensure we're in the right branch
current_branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$current_branch" != "$BRANCH" ]; then
    echo "Error: Not on $BRANCH branch. Current branch is $current_branch."
    exit 1
fi

# Function to log messages
log() {
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $1" | tee -a "$LOG_FILE"
}

log "Starting auto-update script on branch $BRANCH"

while true; do
    # Random sleep between 5 and 30 seconds (for demo purposes)
    SLEEP_TIME=$((5 + RANDOM % 30))
    log "Sleeping for $SLEEP_TIME seconds..."
    sleep $SLEEP_TIME

    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    COMMIT_MESSAGE="Auto-update: $TIMESTAMP"
    
    # Update README with current timestamp
    echo "Last auto-update: $TIMESTAMP" > README.md
    echo "Branch: $BRANCH" >> README.md
    echo "Repository: SmartHome" >> README.md

    # Git operations
    if ! git add . >> "$LOG_FILE" 2>&1; then
        log "Error: Failed to stage changes"
        continue
    fi

    if ! git commit -m "$COMMIT_MESSAGE" >> "$LOG_FILE" 2>&1; then
        log "Warning: No changes to commit"
        continue
    fi

    if ! git push origin "$BRANCH" >> "$LOG_FILE" 2>&1; then
        log "Error: Failed to push to $BRANCH"
        continue
    fi

    log "Successfully updated and pushed changes"
done
