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

current_dir=$(dirname $0)
port=4004

if [[ "$parameters" = *"--path"* ]]; then
  relative_path=$(echo "$parameters" | ack -o "(?<=--path=).*?([^\s]+|$)")
fi

if [[ "$parameters" = *"--port"* ]]; then
  port=$(echo "$parameters" | ack -o "(?<=--port=).*?([^\s]+|$)")
fi

info "Opening python webserver..."
python "${current_dir}/src/main.py" ${port} ${relative_path}
success "Done!"