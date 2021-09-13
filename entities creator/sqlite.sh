clear



cd ..
rm *.cs
cd scripts
dotnet new webapi --name Docygen.Api.Sessions --output ./
dotnet add package Microsoft.EntityFrameworkCore --version 3.1.6
dotnet add package Microsoft.EntityFrameworkCore.Design --version 3.1.6
dotnet add package Microsoft.EntityFrameworkCore.Sqlite --version 3.1.6

dotnet ef dbcontext scaffold "Data Source=session.dll" Microsoft.EntityFrameworkCore.Sqlite -c SQLiteContext -o ./ -f 

rm -rf bin
rm -rf obj 
rm -rf Properties
rm -rf Controllers
rm Program.cs
rm Startup.cs
rm *.json
rm *.csproj
rm WeatherForecast.cs
mv *.cs ../
 