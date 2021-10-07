sudo docker pull mcr.microsoft.com/mssql/server:2019-latest

create container
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=p@ssw0rd" \
   -p 1433:1433 --name mssql -h mssql \
   -d mcr.microsoft.com/mssql/server:2019-latest

docker exec -it mssql /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P "p@ssw0rd" \
   -Q 'ALTER LOGIN SA WITH PASSWORD="p@ssw0rd"'

# sudo docker exec -it mssql "bash"
# /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "p@ssw0rd"
