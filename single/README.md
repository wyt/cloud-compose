# cloud compose project

整合各个微服务模块的compose文件，集中到一个工程中处理，方便jenkins等集成。

## 介绍说明

`多docker compose文件同时启动`

```xml
docker-compose -f docker-compose-infra.yml -f docker-compose-app-sample.yml up -d
```

`查看日志`

```xml
docker-compose -f docker-compose-infra.yml -f docker-compose-app-sample.yml logs -f
```

version3版本，非docker swarm环境下启动时，需要指定 compatibility参数，内存和cpu限制才会生效，reservations可能不会被支持。
https://github.com/docker/compose/issues/4513
https://github.com/docker/compose/pull/5684

`相关命令`

```xml
docker-compose --compatibility -f docker-compose-infra.yml up -d
docker-compose --compatibility -f docker-compose-infra.yml logs -f
docker-compose --compatibility -f docker-compose-infra.yml kill eureka-server
```
    
## 参与贡献
    
* https://yongtao.wang