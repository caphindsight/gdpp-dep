#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

build_index() {
  local dir="$1"
  local ind="$2"
  :> "$ind"
  for i in $(ls "$dir"); do
    if [ -f "${dir}/${i}" ]; then
      printf "%s=%s\n" "$i" "$(cat ${dir}/${i})" >>"$ind"
    fi
  done
  for i in $(ls "$dir"); do
    if [ -d "${dir}/${i}" ]; then
      printf "%s\n" "$i" >>"$ind"
    fi
  done
}

build_index data/bind index/bind
build_index data/spec index/spec
build_index data/engine index/engine
