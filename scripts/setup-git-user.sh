#!/usr/bin/env bash

dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

source $dir/init.sh

# Check and set GIT_USER_NAME if it's set
if [ -n "$GIT_USER_NAME" ]; then
  git config --global user.name "$GIT_USER_NAME"
  echo "Git user.name set to: $GIT_USER_NAME"
else
  echo "GIT_USER_NAME is not set. Skipping git config for user.name."
fi

# Check and set GIT_USER_EMAIL if it's set
if [ -n "$GIT_USER_EMAIL" ]; then
  git config --global user.email "$GIT_USER_EMAIL"
  echo "Git user.email set to: $GIT_USER_EMAIL"
else
  echo "GIT_USER_EMAIL is not set. Skipping git config for user.email."
fi
