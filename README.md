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

So because getting the raw content of a file in a repo doesn't fall under the rate limitation of GitHub API, this repo is automatically storing versions and full JSON response from the endpoint for the latest release of a given repo. This repository is automatically updated on a daily basis.

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