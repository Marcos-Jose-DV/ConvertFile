using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Storage;

namespace ConvertFile.Services;

public class FileService
{
   private  readonly IFileSaver fileSaver;

    public FileService(IFileSaver fileSaver)
    {
        this.fileSaver = fileSaver;
    }

    public async Task SaveFileAsync(string fileName,Stream stream, CancellationToken cancellationToken)
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

    public async Task FilePickerAsync()
    {
        var result = await FilePicker.PickAsync(new PickOptions
        {

        });
    }
}
