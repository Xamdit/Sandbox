#!/bin/bash

# docker pull microsoft/mssql-server-linux:2017-latest

# docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=password" \
#   -p 1433:1433 --name mssqlserver \
#   -d mcr.microsoft.com/mssql/server:2017-latest

# change sql password
# docker exec -it mssqlserver /opt/mssql-tools/bin/sqlcmd \
#    -S localhost -U SA -P "passowrd" \
#    -Q 'ALTER LOGIN SA WITH PASSWORD="password"'

# docker exec -it mssqlserver "bash"
# /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "password"

docker run -d \
  --name sqledge \
  -p 1433:1433 \
  -e ACCEPT_EULA=1 \
  -e MSSQL_SA_PASSWORD=kUIJ1ttEiLtAOL23 \
  --cap-add SYS_PTRACE \
  mcr.microsoft.com/azure-sql-edge
