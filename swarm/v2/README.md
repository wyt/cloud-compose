# dlink ops platform docker compose project

整合各个微服务模块的compose文件，集中到一个工程中处理，方便jenkins等集成。

## 介绍说明

`多docker compose文件docker stack deploy方式启动`

``` bash
[root@docker_001 swarm2]# docker network create -d overlay cloud-cook-overlay
u5urstz9h4flvpqv5yygq7juo
[root@docker_001 swarm2]# docker stack deploy -c docker-compose-infra.yml cc
Creating service cc_config-server
Creating service cc_gateway-service
Creating service cc_eureka-server
[root@docker_001 swarm2]# docker stack deploy -c docker-compose-app-sample.yml cc-app
Creating service cc-app_app-sample-consume
Creating service cc-app_app-sample-produce
[root@docker_001 swarm2]# docker service ls
ID                  NAME                        MODE                REPLICAS            IMAGE                                      PORTS
niakx3u4o7b2        cc-app_app-sample-consume   replicated          1/1                 wangyt/app-sample-consume:1.0.1-SNAPSHOT   *:9002->9002/tcp
nhb9mztqc5bn        cc-app_app-sample-produce   replicated          1/1                 wangyt/app-sample-produce:1.0.1-SNAPSHOT   *:9003->9003/tcp
uqp6g2oe7wj2        cc_config-server            replicated          1/1                 wangyt/config-server:1.0.1-SNAPSHOT        *:7766->7766/tcp
xyr9nnut74b4        cc_eureka-server            replicated          1/1                 wangyt/eureka-server:1.0.1-SNAPSHOT        *:7777->7777/tcp
xz29ld7hqhgm        cc_gateway-service          replicated          1/1                 wangyt/gateway-service:1.0.1-SNAPSHOT      *:7000->7000/tcp
[root@docker_001 swarm2]# 
[root@docker_001 swarm2]# 
[root@docker_001 swarm2]# docker service ps $(docker service ls -q)
ID                  NAME                          IMAGE                                      NODE                DESIRED STATE       CURRENT STATE                ERROR               PORTS
t6o75uvzg900        cc-app_app-sample-produce.1   wangyt/app-sample-produce:1.0.1-SNAPSHOT   docker_003          Running             Running about a minute ago                       
jkxqt10vs4v6        cc-app_app-sample-consume.1   wangyt/app-sample-consume:1.0.1-SNAPSHOT   docker_003          Running             Running about a minute ago                       
phi0rhyffy49        cc_eureka-server.1            wangyt/eureka-server:1.0.1-SNAPSHOT        docker_001          Running             Running about a minute ago                       
reqpxcd8cay1        cc_gateway-service.1          wangyt/gateway-service:1.0.1-SNAPSHOT      docker_001          Running             Running about a minute ago                       
vjkzsqfywm95        cc_config-server.1            wangyt/config-server:1.0.1-SNAPSHOT        docker_001          Running             Running about a minute ago                       
```

## 参与贡献
    
* https://yongtao.wang