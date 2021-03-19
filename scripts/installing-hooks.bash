#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)

echo "Installing hooks.."

# This command creates symlink to the pre-commit scripts
ln -s ../../scripts/pre-commit.bash $GIT_DIR/hooks/pre-commit
# ln -s ./pre-push.bash $GIT_DIR/hooks/pre-push

echo "Done!"
