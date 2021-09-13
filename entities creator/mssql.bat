

dotnet new webapi --name Docygen.Api.Entities --output ./
dotnet add package Microsoft.EntityFrameworkCore --version 3.1.6
dotnet add package Microsoft.EntityFrameworkCore.Design --version 3.1.6
@REM dotnet add package Pomelo.Entityframeworkcore.MySql --version 3.1.2
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 3.1.6

dotnet ef dbcontext scaffold "Data Source=KSHSERVER;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Password=KsH2020;Initial Catalog=CVP" Microsoft.EntityFrameworkCore.SqlServer -c MSSql -o ./Entities -f 
