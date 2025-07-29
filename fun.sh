#!/bin/bash

# Variables
FILE_TO_EDIT="README.md"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')  # Full date and time
NEW_CONTENT="Auto-update performed at $TIMESTAMP !!!"
COMMIT_MESSAGE="Auto-update: $TIMESTAMP"
BRANCH="main"   # Change to 'master' if your repo uses master

# Step 1: Append the timestamped content to the file
echo "$NEW_CONTENT" >> "$FILE_TO_EDIT"

# Step 2: Stage the changes
git add "$FILE_TO_EDIT"

# Step 3: Commit with timestamp
git commit -m "$COMMIT_MESSAGE"

# Step 4: Push to GitHub
git push origin "$BRANCH"
