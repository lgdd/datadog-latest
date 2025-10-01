![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/lgdd/datadog-latest/auto-update.yml?label=auto-update&style=flat)
![GitHub last commit](https://img.shields.io/github/last-commit/lgdd/datadog-latest?style=flat&color=blue)

# Datadog Latest

This repository contains information about the latest version of each Datadog's official library for APM and Serverless.

## Why

When using `api.github.com` to get the latest version of a tracer library, you can come accross a rate limiting issue on your IP such as:

```json
{
    "message":"API rate limit exceeded for x.x.x.x. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)",
    "documentation_url":"https://docs.github.com/rest/overview/resources-in-the-rest-api#rate-limiting"
}
```

Sure, you could authenticate to the GitHub API, but that might add an extra pain in your build process just to get some public information.

So because getting the raw content of a file in a repo doesn't fall under the rate limitation of GitHub API, this repo is automatically storing versions (and full JSON response if you need it) from the endpoint for the latest release of a given repo. This repository is automatically updated on a daily basis.

## Usage Example

Download the latest Datadog Java tracer library (APM) in a Dockerfile:
```Dockerfile
ENV TRACER_VERSION=$(curl -s https://raw.githubusercontent.com/lgdd/datadog-latest/refs/heads/main/apm/dd-trace-java)

RUN curl -LO https://github.com/DataDog/dd-trace-java/releases/download/${TRACER_VERSION}/dd-java-agent.jar
```

Getting the latest version of the Datadog Lambda Java library (Serverless):
```
curl -s https://raw.githubusercontent.com/lgdd/datadog-latest/refs/heads/main/serverless/datadog-lambda-java
```

## FAQ

- Why not relying on latest URLs provided by Datadog (e.g. `https://dtdg.co/latest-java-tracer` as mentionned in the [documentation](https://docs.datadoghq.com/tracing/trace_collection/automatic_instrumentation/dd_libraries/java/?tab=dockerfile#instrument-your-application))?

    - This approach is recommended, but you might be worried that it really points to the latest version at the time you need to use it. And if you want to be sure, you would need to fetch the latest version information somehow anyway.

## Reference Table

| Type       | Library                                                                              | Latest Version |
| ---------- | ------------------------------------------------------------------------------------ | -------------- |
| APM        | [dd-trace-cpp](https://github.com/DataDog/dd-trace-cpp)                              | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fapm%2Fdd-trace-cpp.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| APM        | [dd-trace-dotnet](https://github.com/DataDog/dd-trace-dotnet)                        | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fapm%2Fdd-trace-dotnet.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| APM        | [ddprof](https://github.com/DataDog/ddprof)                                          | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fapm%2Fddprof.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| APM        | [dd-trace-go](https://github.com/DataDog/dd-trace-go)                                | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fapm%2Fdd-trace-go.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| APM        | [dd-trace-java](https://github.com/DataDog/dd-trace-java)                            | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fapm%2Fdd-trace-java.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| APM        | [dd-trace-js](https://github.com/DataDog/dd-trace-js)                                | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fapm%2Fdd-trace-js.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| APM        | [dd-trace-php](https://github.com/DataDog/dd-trace-php)                              | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fapm%2Fdd-trace-php.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| APM        | [dd-trace-py](https://github.com/DataDog/dd-trace-py)                                | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fapm%2Fdd-trace-py.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| Serverless | [datadog-lambda-go](https://github.com/DataDog/datadog-lambda-go)                          | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fserverless%2Fdatadog-lambda-go.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| Serverless | [datadog-lambda-java](https://github.com/DataDog/datadog-lambda-java)                      | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fserverless%2Fdatadog-lambda-java.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| Serverless | [datadog-lambda-js](https://github.com/DataDog/datadog-lambda-js)                          | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fserverless%2Fdatadog-lambda-js.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| Serverless | [datadog-lambda-python](https://github.com/DataDog/datadog-lambda-python)                  | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fserverless%2Fdatadog-lambda-python.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| Serverless | [datadog-lambda-rb](https://github.com/DataDog/datadog-lambda-rb)                          | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fserverless%2Fdatadog-lambda-rb.json&query=%24.tag_name&style=flat&label=%20&color=purple) |
| Serverless | [serverless-plugin-datadog](https://github.com/DataDog/serverless-plugin-datadog)    | ![version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2Flgdd%2Fdatadog-latest%2Frefs%2Fheads%2Fmain%2Fserverless%2Fserverless-plugin-datadog.json&query=%24.tag_name&style=flat&label=%20&color=purple) |