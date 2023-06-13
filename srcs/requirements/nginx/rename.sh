#!/bin/bash

echo "rename is called: version: $1"
# Input string
if [$1 == *.*]
	echo "ok"
input_string=$1

# Extract version number
version_number=$(echo "$input_string" | grep -o -E '[0-9]+\.[0-9]+')

# Split version number into major and minor parts
major_version=$(echo "$version_number" | cut -d '.' -f 1)
minor_version=$(echo "$version_number" | cut -d '.' -f 2)

# Increment minor version, and if necessary, increment major version and reset minor version
minor_version=$((minor_version + 1))
if [ "$minor_version" -eq 10 ]; then
  minor_version=0
  major_version=$((major_version + 1))
fi

# Combine major and minor versions to form incremented version number
incremented_version="${major_version}.${minor_version}"

# Replace original version number with incremented version number
output_string=$(echo "$input_string" | sed "s/${version_number}/${incremented_version}/")

echo "$output_string"
