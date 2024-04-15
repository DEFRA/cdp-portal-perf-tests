FROM justb4/jmeter:5.5

ENV TZ="Europe/London"

USER root

RUN apk add --no-cache \
   curl \
   aws-cli

WORKDIR /opt/perftest

COPY . .

ENTRYPOINT [ "./entrypoint.sh" ]

ENV JM_HOME /opt/perftest
ENV TEST_SCENARIO test
