#!/bin/sh

if [ $SW_AGENT_COLLECTOR_BACKEND_SERVICES ]; then
  echo "SW_AGENT_NAME=$SW_AGENT_NAME"
  echo "SW_AGENT_COLLECTOR_BACKEND_SERVICES=$SW_AGENT_COLLECTOR_BACKEND_SERVICES"
  JAVA_OPT="${JAVA_OPT} -javaagent:${SKYWALKING_AGENT} -DSW_AGENT_NAME=${SW_AGENT_NAME} -DSW_AGENT_COLLECTOR_BACKEND_SERVICES=${SW_AGENT_COLLECTOR_BACKEND_SERVICES}"
fi

exec "$@"
