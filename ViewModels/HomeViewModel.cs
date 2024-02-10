using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ConvertFile.Services;
using System.Text;

namespace ConvertFile.ViewModels;

public partial class HomeViewModel : ObservableObject
{
    readonly FileService _fileService;

    public HomeViewModel(FileService fileService)
    {
        _fileService = fileService;
    }

    [RelayCommand]
    async Task SaveFileStatic(CancellationToken cancellationToken)
    {
        using var stream = new MemoryStream(Encoding.Default.GetBytes("Hello from the Community Toolkit!"));
        _fileService.SaveFileAsync("test.txt", stream, cancellationToken);
    }
}
