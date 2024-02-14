namespace ConvertFile.Models;

public class FileItem
{
    public Image ImageItem { get; set; }
    public string FileName { get; set; }
    public long FileSize { get; set; }
    public string FullPath { get; set; }
}