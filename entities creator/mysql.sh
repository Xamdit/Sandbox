#!/bin/bash

clear

APP_NAME="${PWD##*/}"
dotnet new webapi --name $APP_NAME --output ./
dotnet add package Microsoft.EntityFrameworkCore --version 3.1.6
dotnet add package Microsoft.EntityFrameworkCore.Design --version 3.1.6
dotnet add package MySql.EntityFrameworkCore
mkdir Entities
dotnet ef dbcontext scaffold "Server=localhost;User=root;Database=${APP_NAME};Convert Zero Datetime=True" MySql.EntityFrameworkCore -c MyContext -o ./Entities -f
# dotnet ef migrations add MyFirstMigration
#dotnet ef database update

# dotnet ef dbcontext scaffold "DataSource=./storage.sqlite" Microsoft.EntityFrameworkCore.Sqlite -c MyContext -o ./Entities -f
