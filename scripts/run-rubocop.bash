#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running the Rubocop to clean your code"
bundle exec rubocop
