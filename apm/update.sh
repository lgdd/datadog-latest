#!/usr/bin/env bash

base_url="https://api.github.com/repos/DataDog"
suffix_url="releases/latest"

declare -a libs=(
    "dd-trace-cpp"
    "dd-trace-dotnet"
    "ddprof"
    "dd-trace-go"
    "dd-trace-java"
    "dd-trace-js"
    "dd-trace-php"
    "dd-trace-py"
)

for lib_name in "${libs[@]}"
do
    version=$(curl -s "$base_url/$lib_name/$suffix_url" | jq -r '.tag_name')
    if [ $version != null ]
    then
        echo $version > $lib_name
    fi
done