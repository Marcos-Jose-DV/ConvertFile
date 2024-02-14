using System.Globalization;

namespace ConvertFile.Converters;

internal class FileSizeConverter : IValueConverter
{
    public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        // Verifica se o valor fornecido não é nulo e é do tipo esperado
        if (value != null && value is long)
        {
            long bytes = (long)value;

            // Determina a unidade de armazenamento apropriada com base no número de bytes
            string unidade = "";
            double tamanho = bytes;

            if (bytes < 1024)
            {
                unidade = "bytes";
            }
            else if (bytes < 1048576)
            {
                unidade = "KB";
                tamanho = bytes / 1024.0;
            }
            else if (bytes < 1073741824)
            {
                unidade = "MB";
                tamanho = bytes / 1048576.0;
            }
            else if (bytes < 1099511627776)
            {
                unidade = "GB";
                tamanho = bytes / 1073741824.0;
            }
            else
            {
                unidade = "TB";
                tamanho = bytes / 1099511627776.0;
            }

            return $"{tamanho:F2} {unidade}"; 
        }

        return value; 
    }

    public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}
