using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Storage;

namespace ConvertFile.Services;

public class FileService
{
    private readonly IFileSaver _fileSaver;

    public FileService(IFileSaver fileSaver)
    {
        _fileSaver = fileSaver;
    }

    public async Task SaveFileAsync(string fileName, Stream stream, CancellationToken cancellationToken)
    {
        var fileSaveResult = await FileSaver.SaveAsync("DCIM", fileName, stream, cancellationToken);
        if (fileSaveResult.IsSuccessful)
        {
            await Toast.Make($"File is saved: {fileSaveResult.FilePath}").Show(cancellationToken);
        }
        else
        {
            await Toast.Make($"File is not saved, {fileSaveResult.Exception.Message}").Show(cancellationToken);
        }
    }

    public async Task<Stream> FilePickerAsync()
    {
        try
        {

            var result = await FilePicker.PickAsync(new PickOptions
            {
                FileTypes = FilePickerFileType.Images,
                PickerTitle = "Escolha a image"

            });

            if (result is null)
            {
                return null;
            }

            var stream = await result.OpenReadAsync();

            return stream;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            return null;
        }
    }
}
