using Csv;
using Syroot.Windows.IO;
using System.Data;
using System.IO;
using System.Linq;

namespace DataAccessLayer.Csv
{
    public static class CsvHelper
    {
        private const char Delimiter = ';';
        private static readonly string DownloadsLocation = new KnownFolder(KnownFolderType.Downloads).Path;

        public static void ExportSqlQuery(DataSet query, string fileName)
        {
            var columnNames = query
                .Tables[0]
                .Columns
                .Cast<DataColumn>()
                .Select(x => x.ColumnName)
                .ToArray();

            var rows = query
                .Tables[0]
                .Select()
                .Select(dr => dr.ItemArray
                    .Select(x => x.ToString())
                    .ToArray())
                .ToList();

            File.WriteAllText($"{DownloadsLocation}/{fileName}.csv", CsvWriter.WriteToText(columnNames, rows, Delimiter));
        }
    }
}
