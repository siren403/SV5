#!/usr/bin/env bash

dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

source $dir/init.sh

# Check if GIT_USER_NAME and GIT_USER_EMAIL are set
if [ -n "$GIT_USER_NAME" ] && [ -n "$GIT_USER_EMAIL" ]; then
  # Set the git config values if the environment variables are not empty
  git config --global user.name "$GIT_USER_NAME"
  git config --global user.email "$GIT_USER_EMAIL"
  echo "Git user name and email set to: $GIT_USER_NAME, $GIT_USER_EMAIL"
else
  echo "GIT_USER_NAME and/or GIT_USER_EMAIL are not set. Skipping git config."
  echo "# git config user" >> .env
  echo "GIT_USER_NAME=" >> .env
  echo "GIT_USER_EMAIL=" >> .env
  exit -1
fi
