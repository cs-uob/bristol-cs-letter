#!/usr/bin/env sh
# Deploy the letter template into a new directory, without git history.
set -eu

if [ $# -ne 1 ] || [ -z "$1" ]; then
  echo "Usage: $0 <directory>" >&2
  exit 1
fi

target=$1
if [ -e "$target" ]; then
  echo "Directory already exists." >&2
  exit 1
fi

echo "Creating new letter in ./$target..."
git clone --depth=1 https://github.com/cs-uob/bristol-cs-letter.git "$target"
rm -rf "$target/.git" "$target/scripts" "$target/.github"
