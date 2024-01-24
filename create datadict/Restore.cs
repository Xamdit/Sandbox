using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using CsvHelper;
using System.Globalization;

// Model class to represent a record in mssql.csv
public class YourModel
{
  // Define properties here according to the CSV file structure
}

// Your DbContext class
public class YourDbContext : DbContext
{
  public DbSet<YourModel> YourModels { get; set; }

  // Configure your DbContext (e.g., connection string) here
}

public class CsvToDbMigrator
{
  public static List<YourModel> ReadCsvFile(string filePath)
  {
    using (var reader = new StreamReader(filePath))
    using (var csv = new CsvReader(reader, CultureInfo.InvariantCulture))
    {
      var records = csv.GetRecords<YourModel>().ToList();
      return records;
    }
  }

  public static void MigrateCsvToDb(string csvFilePath)
  {
    var records = ReadCsvFile(csvFilePath);

    // Assuming you have set up your DbContext and connection string
    using (var context = new YourDbContext())
    {
      context.YourModels.AddRange(records);
      context.SaveChanges();
    }
  }
}

class Program
{
  static void Main(string[] args)
  {
    string csvFilePath = "path_to_your_mssql.csv"; // Replace with the actual path
    CsvToDbMigrator.MigrateCsvToDb(csvFilePath);
  }
}
