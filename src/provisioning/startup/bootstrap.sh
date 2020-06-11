#!/bin/bash
# Initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Initialize rvm
. /etc/profile.d/rvm.sh
# Only run bundler in web when env is development.
bundle config --global --delete without
bundle config --global --delete frozen
bundle config --global with 'development document test'
[ -f Gemfile.lock ] && rm Gemfile.lock # Run only when docker-compose build
bundle install
yarn install --check-files