#!/usr/bin/env bash

base_url="https://api.github.com/repos/DataDog"
suffix_url="releases/latest"

declare -a libs=(
    "datadog-lambda-python"
    "datadog-lambda-js"
    "datadog-lambda-rb"
    "datadog-lambda-go"
    "datadog-lambda-java"
    "serverless-plugin-datadog"
)

for lib_name in "${libs[@]}"
do
    version=$(curl -s "$base_url/$lib_name/$suffix_url" | jq -r '.tag_name')
    if [ $version != null ]
    then
        echo $version > $lib_name
    fi
done