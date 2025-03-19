#!/bin/bash
# podman run -d \
#   --name sqledge \
#   -p 1433:1433 \
#   -e ACCEPT_EULA=1 \
#   -e MSSQL_SA_PASSWORD=kUIJ1ttEiLtAOL23 \
#   --cap-add SYS_PTRACE \
#   --restart unless-stopped \
#   mcr.microsoft.com/azure-sql-edge

podman run -d \
  --name mysql-container \
  -e MYSQL_ROOT_PASSWORD=kUIJ1ttEiLtAOL23 \
  -e MYSQL_DATABASE=mydatabase \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=kUIJ1ttEiLtAOL23 \
  -p 3307:3306 \
  docker.io/mysql:latest


# docker run -d \
#   --name sqledge \
#   -p 1433:1433 \
#   -e ACCEPT_EULA=1 \
#   -e MSSQL_SA_PASSWORD=kUIJ1ttEiLtAOL23 \
#   --cap-add SYS_PTRACE \
#   mcr.microsoft.com/azure-sql-edge
