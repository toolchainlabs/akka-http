#!/bin/bash

set -eu

for t in $(rg -o '"[^"]*"\s*%%?.*%.*' project/Dependencies.scala | sort -u | tr ' ' '@'); do
  t=$(echo "$t" | tr '@' ' ')
  group=$(echo "$t" | awk '{print $1}')
  dir="3rdparty/jvm/"$(echo "$group" | tr -d '"' | tr '.' '/')
  build_file_name="${dir}/BUILD"

  target_name=$(echo "$t" | awk '{print $3}')
  version=$(echo "$t" | awk '{print $5}')

  mkdir -p "$dir"
  echo "jvm_artifact(" >> "${build_file_name}"
  echo "  name=${target_name}," >> "${build_file_name}"
  echo "  group=${group}," >> "${build_file_name}"
  echo "  artifact=${target_name}," >> "${build_file_name}"
  echo "  version=${version}," >> "${build_file_name}"
  echo ")" >> "${build_file_name}"
  echo >> "${build_file_name}"

done
