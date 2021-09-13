<?php 

    $dbUname="root";
    $dbPword="rootpassword";
    $dbHost="database_server";
    $dbName="mysql";
    $link=mysqli_connect($dbHost,$dbUname,$dbPword,$dbName);

    echo phpinfo();

?>