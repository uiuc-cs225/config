#!/usr/bin/env bash

# Creates an array from the name of the variable and values
array_from_str () {
  ([ "$#" -lt "1" ] || [ "$#" -gt "2" ]) && return 1

  # Read in the array data
  local DATA
  if [ "$#" -eq "1" ]; then
    DATA="$(cat -)"
  else
    DATA="$2"
  fi

  # Convert the data into an array
  eval "$1=($DATA)"
}

# Unique Array Functions with indicies starting at 0
array_append () {
  eval "$1=(\"\${$1[@]}\" \"$2\")"
}
array_new () {
  unset "$1"
  declare -a "$1"
}
array_at () {
  eval "echo \"\${$1[$2]}\""
}
array_size () {
  eval "echo \${#$1[@]}"
}
