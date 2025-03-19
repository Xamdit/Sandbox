#!/bin/bash
#dotnet add package Microsoft.EntityFrameworkCore  
#dotnet add package Microsoft.EntityFrameworkCore.Design  
#dotnet add package Microsoft.EntityFrameworkCore.Sqlite
npx prisma db push --schema prisma/schema.prisma
rm *.cs
dotnet ef dbcontext scaffold "Data Source=session.dll" Microsoft.EntityFrameworkCore.Sqlite -c SQLiteContext -o . -f