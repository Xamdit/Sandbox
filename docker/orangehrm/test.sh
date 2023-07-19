#!/bin/bash

#yarn prisma:format
#yes | yarn prisma:migrate
yes | npx prisma migrate dev --name init --schema prisma/schema.prisma
#dotnet ef dbcontext scaffold 'Server=localhost:3306;Database=xamdit;Username=root;Password=griktvtwi@wss3407' pomelo.entityframeworkcore.mysql -o ./entities/ -c MyDbContext -f
dotnet ef dbcontext scaffold "Server=localhost;Port=3306;Database=xamdit;User=root;Password=griktvtwi@wss3407" Pomelo.EntityFrameworkCore.MySql -o ./entities/ -c MyDbContext -f

#dotnet ef dbcontext scaffold "Server=localhost;User=root;Database=${APP_NAME};Convert Zero Datetime=True" pomelo.entityframeworkcore.mysql -c MyContext -o ./Entities -f

#yarn global add prisma@latest

#dotnet ef migrations add ExecuteSqlFromFile


