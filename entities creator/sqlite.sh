clear
args=("$@")
for arg in "${args[@]}"; do
    :
    mkdir ${arg}
    cd ${arg}
    dotnet new webapi --name ${arg} --output ./
    dotnet add package Microsoft.EntityFrameworkCore --version 3.1.6
    dotnet add package Microsoft.EntityFrameworkCore.Design --version 3.1.6
    dotnet add package Microsoft.EntityFrameworkCore.Sqlite --version 3.1.6

    dotnet ef dbcontext scaffold "Data Source=session.dll" Microsoft.EntityFrameworkCore.Sqlite -c SQLiteContext -o ./SQLiteContext -f
    cd ..
done
