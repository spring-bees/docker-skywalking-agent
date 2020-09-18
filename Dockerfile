FROM openjdk:8-jre-alpine

MAINTAINER coolbeevip@gmail.com

ARG SKYWALKING_VERSION=8.1.0
ARG SKYWALKING_BIN=apache-skywalking-apm-${SKYWALKING_VERSION}.tar.gz
ARG DOWNLOAD_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/skywalking/${SKYWALKING_VERSION}/apache-skywalking-apm-${SKYWALKING_VERSION}.tar.gz

ENV SKYWALKING_HOME=/skywalking \
    SKYWALKING_AGENT=${SKYWALKING_HOME}/agent/skywalking-agent.jar \
    SW_AGENT_NAME=YourAppName

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
  && ln -s /usr/local/bin/docker-entrypoint.sh \
  && mkdir ${SKYWALKING_HOME} \
  && wget ${DOWNLOAD_URL} -P ${SKYWALKING_HOME} \
  && tar -xzvf ${SKYWALKING_HOME}/${SKYWALKING_BIN} -C /skywalking \
  && mv ${SKYWALKING_HOME}/apache-skywalking-apm-bin/agent /skywalking \
  && rm -rf ${SKYWALKING_HOME}/apache-skywalking-apm-bin \
  && rm -rf ${SKYWALKING_HOME}/${SKYWALKING_BIN}

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
