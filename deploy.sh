#!/usr/bin/env bash

function yell () { >&2 echo "$*";  }
function die () { yell "$*"; exit 1; }
function try () { "$@" || die "Command failed: $*"; }

script_path="$( realpath "$0" )"
script_dir="$( dirname "$script_path" )"

build_dir="$script_dir/build"

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project
try hugo

# Remove existing build directory
try rm -rf "$build_dir"

# Clone into the build directory
try mkdir -p "$build_dir"
try git clone "git@github.com:cozykeys/cozykeys.github.io.git" \
    "$build_dir/cozykeys.github.io"

# Copy files over
try cp -r public/* "$build_dir/cozykeys.github.io"

# Commit and push changes
cd "$build_dir/cozykeys.github.io"
git add .
msg="Publish site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
try git commit -m "$msg"
try git push origin master
