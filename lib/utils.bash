#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later
set -euo pipefail

TOOL_NAME="fornax"
BINARY_NAME="fornax"

fail() { echo -e "\e[31mFail:\e[m $*" >&2; exit 1; }

list_all_versions() {
  local curl_opts=(-sL)
  [[ -n "${GITHUB_TOKEN:-}" ]] && curl_opts+=(-H "Authorization: token $GITHUB_TOKEN")
  curl "${curl_opts[@]}" "https://api.github.com/repos/ionide/Fornax/releases" 2>/dev/null | \
    grep -o '"tag_name": "[^"]*"' | sed 's/"tag_name": "v\?//' | sed 's/"$//' | sort -V
}

download_release() {
  local version="$1" download_path="$2"
  mkdir -p "$download_path"
  echo "$version" > "$download_path/VERSION"
}

install_version() {
  local install_type="$1" version="$2" install_path="$3"

  mkdir -p "$install_path/bin"
  dotnet tool install --tool-path "$install_path/bin" Fornax --version "$version" || fail "dotnet tool install failed"
}
