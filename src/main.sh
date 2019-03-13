#!/usr/bin/env bash

parameters="$@"
GREEN='\033[00;32m'
CYAN='\033[00;36m'

function info() {
  printf "\n${CYAN}%s${END}\n" "$*"
}

function success() {
  printf "\n${GREEN}%s${END}\n" "$*"
}

path_to_script=${PWD}
current_dir=$(dirname $0)

if [[ "$parameters" = *"--path"* ]]; then
  cd $(echo "$parameters" | ack -o "(?<=--path=).*?([^\s]+|$)")
fi

if [[ "$parameters" = *"--port"* ]]; then
  port=$(echo "$parameters" | ack -o "(?<=--port=).*?([^\s]+|$)")
fi

info "Opening python webserver..."
python "${path_to_script}/${current_dir}/main.py" ${port}
success "Done!"