#!/bin/bash

# Set variables
REPO_URL="https://github.com/morethanwords/tweb.git"
COMMIT_SHA="0b53d072b5d8fa610818a414958d7804ef627dce"
FOLDER="public"
TARGET_DIR="tweb-public"

# Clone the repo
git clone --filter=blob:none --sparse "$REPO_URL" tweb-temp
cd tweb-temp || exit 1

# Checkout the specific commit
git checkout "$COMMIT_SHA"

# Sparse-checkout setup
git sparse-checkout init --cone
git sparse-checkout set "$FOLDER"

# Move the folder out
cd ..
mv tweb-temp/"$FOLDER" "$TARGET_DIR"

# Clean up
rm -rf tweb-temp

echo "✅ '$FOLDER/' folder at commit $COMMIT_SHA has been saved to '$TARGET_DIR/'"
