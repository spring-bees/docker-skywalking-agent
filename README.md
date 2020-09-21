内置 skywalking agent 库

环境变量控制参数

* SW_AGENT_ENABLED=(true|false) 开启跟踪 Agent
* SW_AGENT_NAME Agent 名称
* SW_AGENT_COLLECTOR_BACKEND_SERVICES Skywalking 服务地址

开启后会自动生成一下 JAVA_OPTS

```
JAVA_OPTS="${JAVA_OPTS} -javaagent:${SKYWALKING_AGENT} -DSW_AGENT_NAME=${SW_AGENT_NAME} -DSW_AGENT_COLLECTOR_BACKEND_SERVICES=${SW_AGENT_COLLECTOR_BACKEND_SERVICES}"
```
