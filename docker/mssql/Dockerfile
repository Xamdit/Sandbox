# Use the official Azure SQL Edge image
FROM mcr.microsoft.com/azure-sql-edge

# Set environment variables
ENV ACCEPT_EULA=1
ENV MSSQL_SA_PASSWORD=kUIJ1ttEiLtAOL23

# Expose the necessary port
EXPOSE 1433

# Add SYS_PTRACE capability
RUN apt-get update && apt-get install -y libcap2-bin && setcap cap_sys_ptrace=eip /opt/mssql/bin/sqlservr

# Start the SQL Edge service
CMD ["/opt/mssql/bin/sqlservr"]
