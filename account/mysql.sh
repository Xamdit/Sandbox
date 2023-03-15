clear

APP_NAME="${PWD##*/}"
 
dotnet new webapi --name $APP_NAME --output ./
dotnet add package Microsoft.EntityFrameworkCore --version 3.1.6
dotnet add package Microsoft.EntityFrameworkCore.Design --version 3.1.6
dotnet add package Pomelo.Entityframeworkcore.MySql --version 3.1.2
dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL --version 3.1.2


mkdir Entities
 
dotnet ef dbcontext scaffold 'Server=95.111.195.20:5432;Database=mono;Username=parin.k;Password=griktvtwi' Npgsql.EntityFrameworkCore.PostgreSQL -o ./entities/ -c MyDbContext -f --schema account 
#dotnet ef migrations add MyFirstMigration
#dotnet ef database update


#dotnet ef dbcontext scaffold "DataSource=./storage.sqlite" Microsoft.EntityFrameworkCore.Sqlite -c MyContext -o ./Entities -f 
