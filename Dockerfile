FROM defradigital/cdp-perf-test-docker:1.10960440822.0

WORKDIR /opt/perftest

COPY scenarios/ ./scenarios/
COPY entrypoint.sh .
COPY user.properties .

ENV S3_ENDPOINT=https://s3.eu-west-2.amazonaws.com
ENV TEST_SCENARIO=test

ENTRYPOINT [ "./entrypoint.sh" ]
