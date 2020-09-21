#!/bin/sh

if [ $SW_AGENT_ENABLED ]; then

  if [ $SW_AGENT_ENABLED = 'true' ]; then

    if [ -z $SW_AGENT_COLLECTOR_BACKEND_SERVICES ]; then
      echo 'ERROR environment variable SW_AGENT_COLLECTOR_BACKEND_SERVICES must not be empty'
      exit 1
    else
      echo 'SW_AGENT_COLLECTOR_BACKEND_SERVICES=$SW_AGENT_COLLECTOR_BACKEND_SERVICES'
    fi

    if [ -z $SW_AGENT_NAME ]; then
      echo 'ERROR environment variable SW_AGENT_NAME must not be empty'
      exit 1
    else
      echo 'SW_AGENT_NAME=$SW_AGENT_NAME'
    fi

    export JAVA_OPTS="${JAVA_OPTS} -javaagent:${SKYWALKING_AGENT} -DSW_AGENT_NAME=${SW_AGENT_NAME} -DSW_AGENT_COLLECTOR_BACKEND_SERVICES=${SW_AGENT_COLLECTOR_BACKEND_SERVICES}"
    echo 'JAVA_OPTS=${JAVA_OPTS}'

  fi

fi

exec "$@"
