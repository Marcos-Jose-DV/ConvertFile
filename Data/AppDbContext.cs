using ConvertFile.Models;

namespace ConvertFile.Data;

public class AppDbContext
{
    public List<PdfTo> SeedData()
    {
        List<PdfTo> pdfTo = new()
        {
            new PdfTo {Title = "PDF para JPG", FileType = "JPG" },
            new PdfTo {Title = "PDF para WORD", FileType = "WORD" },
            new PdfTo {Title = "PDF para POWERPOINT", FileType = "POWERPOINT" },
            new PdfTo {Title = "PDF para EXCEL", FileType = "EXCEL" },

        };


        return pdfTo;
    }
}
