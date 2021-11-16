#!/bin/bash

set -eu

for t in $(rg -o 'addAkkaModuleDependency\([^),]*' build.sbt | awk -F'(' '{print $2}' | sort -u); do
  target_name=$(echo "$t" | tr -d '"')
  build_file_name="3rdparty/jvm/com/typesafe/akka/BUILD"

  mkdir -p "$(dirname "${build_file_name}")"
  echo "jvm_artifact(" >> "${build_file_name}"
  echo "  name='${target_name}'," >> "${build_file_name}"
  echo "  group='com.typesafe.akka'," >> "${build_file_name}"
  echo "  artifact='${target_name}_2.13'," >> "${build_file_name}"
  echo "  version='2.5.32'," >> "${build_file_name}"
  echo ")" >> "${build_file_name}"
  echo >> "${build_file_name}"
done

for t in $(rg -o '"[^"]*"\s*%%?.*%.*' project/Dependencies.scala | sort -u | tr ' ' '@'); do
  t=$(echo "$t" | tr '@' ' ')
  group=$(echo "$t" | awk '{print $1}')
  build_file_name="3rdparty/jvm/"$(echo "$group" | tr -d '"' | tr '.' '/')"/BUILD"

  target_name=$(echo "$t" | awk '{print $3}')
  version=$(echo "$t" | awk '{print $5}')

  mkdir -p "$(dirname "${build_file_name}")"
  echo "jvm_artifact(" >> "${build_file_name}"
  echo "  name=${target_name}," >> "${build_file_name}"
  echo "  group=${group}," >> "${build_file_name}"
  echo "  artifact=${target_name}," >> "${build_file_name}"
  echo "  version=${version}," >> "${build_file_name}"
  echo ")" >> "${build_file_name}"
  echo >> "${build_file_name}"

done
