#!/bin/bash
# podman run -d \
#   --name sqledge \
#   -p 1433:1433 \
#   -e ACCEPT_EULA=1 \
#   -e MSSQL_SA_PASSWORD=kUIJ1ttEiLtAOL23 \
#   --cap-add SYS_PTRACE \
#   --restart unless-stopped \
#   mcr.microsoft.com/azure-sql-edge

docker run -d \
  --name sqledge \
  -p 1433:1433 \
  -e ACCEPT_EULA=1 \
  -e MSSQL_SA_PASSWORD=kUIJ1ttEiLtAOL23 \
  --cap-add SYS_PTRACE \
  mcr.microsoft.com/azure-sql-edge
