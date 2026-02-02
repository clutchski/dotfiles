#!/bin/bash
git config --global core.excludesfile ~/.gitignore
if [[ "$(hostname)" == bt* ]]; then
  git config --global user.email "matt@braintrustdata.com"
fi
