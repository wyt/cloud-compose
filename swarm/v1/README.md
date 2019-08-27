# dlink ops platform docker compose project

整合各个微服务模块的compose文件，集中到一个工程中处理，方便jenkins等集成。

## 介绍说明

`多docker compose文件docker stack deploy方式启动`

``` bash
[root@docker_001 swarm]# pwd
/root/cloud-cook/swarm
[root@docker_001 swarm]# docker stack deploy -c docker-compose-infra.yml -c docker-compose-app-sample.yml cc
[root@docker_001 swarm]# docker stack ls
NAME                SERVICES            ORCHESTRATOR
cc                  5                   Swarm
[root@docker_001 swarm]# docker service ls
ID                  NAME                    MODE                REPLICAS            IMAGE                                      PORTS
0e261gs9g1cf        cc_app-sample-consume   replicated          1/1                 wangyt/app-sample-consume:1.0.1-SNAPSHOT   *:9002->9002/tcp
kfmipxmv9h17        cc_app-sample-produce   replicated          1/1                 wangyt/app-sample-produce:1.0.1-SNAPSHOT   *:9003->9003/tcp
wl50861qrgz7        cc_config-server        replicated          1/1                 wangyt/config-server:1.0.1-SNAPSHOT        *:7766->7766/tcp
123uonyrrviw        cc_eureka-server        replicated          1/1                 wangyt/eureka-server:1.0.1-SNAPSHOT        *:7777->7777/tcp
iyy2rbyeqql4        cc_gateway-service      replicated          1/1                 wangyt/gateway-service:1.0.1-SNAPSHOT      *:7000->7000/tcp
[root@docker_001 swarm]# 
```

## 参与贡献
    
* https://yongtao.wang