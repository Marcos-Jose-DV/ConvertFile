namespace ConvertFile.Models;

public class FileItem
{
    public Guid IdFile { get; set; }
    public string FileName { get; set; }
    public long FileSize { get; set; }
    public string FullPath { get; set; }
    public byte[] ConvertedFile { get; set; } 
}