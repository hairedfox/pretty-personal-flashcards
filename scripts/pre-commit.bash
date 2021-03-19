#!/usr/bin/env bash

echo "Running all the pre-commit hook"
./scripts/run-rubocop.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
  echo "Clean your code before committing"
  exit 1
fi

echo "Well done!!! Keep up the good work"
