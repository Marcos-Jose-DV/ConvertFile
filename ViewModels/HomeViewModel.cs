using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ConvertFile.Models;
using ConvertFile.Services;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.IO;

namespace ConvertFile.ViewModels;

public partial class HomeViewModel : ObservableObject
{
    private readonly FileService _fileService;

    [ObservableProperty]
    ObservableCollection<FileItem> _fileItems = new();

    [ObservableProperty]
    Image _image;

    [ObservableProperty]
    string _fileName, _fileTypeTitle;

    [ObservableProperty]
    List<Stream> _stream = new();

    [ObservableProperty]
    bool _isBusy, _isVisibleFooter, _isVisibleHeader;

    [ObservableProperty]
    int _fileTotal;

    [ObservableProperty]
    long _fileSize;

    private IEnumerable<FileResult> _results;
    public HomeViewModel(FileService fileService)
    {
        _fileService = fileService;
        IsVisibleHeader = true;
    }

    [RelayCommand]
    async Task SaveFile(CancellationToken cancellationToken)
    {
        _fileService.SaveFileAsync(FileName, Stream[0], cancellationToken);
    }

    [RelayCommand]
    async Task SelectFile(CancellationToken cancellationToken)
    {
        List<FileItem> fileItems = new();

        try
        {
            //Stream = await _fileService.FilePickerAsync();
          _results = await FilePicker.PickMultipleAsync(new PickOptions
            {
                FileTypes = FilePickerFileType.Images,
                PickerTitle = "Escolha a image",
          });


            if (_results.Count() == 0)
            {
                await Toast.Make($"Nenhum arquivo selecionado").Show(cancellationToken);
                return;
            }

            IsBusy = true;
            IsVisibleHeader = false;
            IsVisibleFooter = true;
            foreach (var result in _results)
            {
                if (FileTotal == 100)
                {
                    await Toast.Make($"Maximo 100 arquivos").Show(cancellationToken);
                    break;
                }

                var fileSize = new FileInfo(result.FullPath);
                var stream = await result.OpenReadAsync();
                //Stream.Add(stream);
               
                var source = ImageSource.FromStream(() => stream);
                
                var image = new Image
                {
                    Source = source,
                    HeightRequest = 50,
                    WidthRequest = 50
                };

                FileItems.Add(new FileItem
                {
                    //ImageItem = image,
                    FileName = result.FileName,
                    FileSize = fileSize.Length
                });

                FileTotal += 1;
                FileSize += fileSize.Length;

                await Task.Delay(100);
            }
        }
        catch (Exception ex)
        {
            await Toast.Make($"Error! tente de novo, {ex.Message}").Show(cancellationToken);
            Console.WriteLine(ex.Message);

        }
        finally
        {
            IsBusy = false;
        }
    }

    [RelayCommand]
    private void FileType(string fileTypeTitle)
    {
        FileTypeTitle = fileTypeTitle;
    }
}