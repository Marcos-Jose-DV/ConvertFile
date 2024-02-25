
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ConvertFile.Data;
using ConvertFile.Models;
using ConvertFile.Services;
using System.Collections.ObjectModel;

namespace ConvertFile.ViewModels;

public partial class PDFToViewModel : ObservableObject
{
    private readonly FileService _fileService;
    private readonly IFolderPicker _folderPicker;
    private readonly AppDbContext _context;

    [ObservableProperty]
    ObservableCollection<FileItem> _fileItems = new();

    [ObservableProperty]
    List<PdfTo> _pdfToItems = new();

    [ObservableProperty]
    string _fileName, _fileTypeTitle, _FullPath;

    [ObservableProperty]
    List<Stream> _stream = new();

    [ObservableProperty]
    bool _isBusy, _isVisibleFooter, _isVisibleHeader, _isVisibleDiplayInfo, _isVisibleDowloadFile, _isVisibleOption, _isVisibleClose;

    [ObservableProperty]
    int _fileTotal;

    [ObservableProperty]
    long _fileSize;

    private List<FileResult> _results;
    public PDFToViewModel(FileService fileService, IFolderPicker folderPicker, AppDbContext context)
    {
        _fileService = fileService;
        _folderPicker = folderPicker;
        _context = context;
        IsVisibleOption = true;


        PdfToItems = _context.SeedData();
    }

    [RelayCommand]
    async Task SelectFile(CancellationToken cancellationToken)
    {
        try
        {
            if (FileTotal == 100)
            {
                await Toast.Make($"Maximo 100 arquivos").Show(cancellationToken);
                return;
            }

            if (FileSize > 209715200)
            {
                await Toast.Make($"Tamanho maximo 200 MB").Show(cancellationToken);
                return;
            }

            _results = new List<FileResult>(await FilePicker.PickMultipleAsync(new PickOptions
            {
                FileTypes = FilePickerFileType.Pdf,
                PickerTitle = "Escolha a image",
            }));


            IsBusy = true;

            if (_results.Count() == 0)
            {
                await Toast.Make($"Nenhum arquivo selecionado").Show(cancellationToken);
                return;
            }

            IsVisibleHeader = false;
            IsVisibleDiplayInfo = true;
            IsVisibleFooter = true;

            foreach (var result in _results)
            {
                if (FileTotal == 100)
                {
                    await Toast.Make($"Maximo 100 arquivos").Show(cancellationToken);
                    break;
                }

                var fileSize = new FileInfo(result.FullPath);

                var item = new FileItem
                {
                    FileName = result.FileName,
                    FileSize = fileSize.Length,
                    FullPath = result.FullPath
                };

                FileTotal += 1;
                FileSize += fileSize.Length;

                if (FileSize > 209715200)
                {
                    FileTotal -= 1;
                    FileSize -= fileSize.Length;
                    _results.Remove(result);
                    await Toast.Make($"Tamanho maximo 200 MB").Show(cancellationToken);
                    break;
                }
                FileItems.Add(item);
                await Task.Delay(100);
            }

            _results.Clear();
        }
        catch (Exception ex)
        {
            await Toast.Make($"Error! tente de novo, {ex.Message}").Show(cancellationToken);
        }
        finally
        {
            IsBusy = !IsBusy;
        }
    }
    [RelayCommand]
    private void FileType(string fileTypeTitle)
    {
        FileTypeTitle = fileTypeTitle;
        IsVisibleHeader = true;
        IsVisibleOption = false;
        IsVisibleClose = true;
    }
    [RelayCommand]
    private void RemoveFile(FileItem obj)
    {
        FileItems.Remove(obj);
        FileTotal -= 1;
        FileSize -= obj.FileSize;

        if(FileTotal == 0)
        {
            IsVisibleHeader = true;
            IsVisibleDiplayInfo = false;
            IsVisibleFooter = false;
        }
    }

    [RelayCommand]
    private void Close()
    {
        IsVisibleHeader = false;
        IsVisibleOption = true;
        IsVisibleClose = false;
        IsVisibleDiplayInfo = false;
        IsVisibleFooter = false;
        IsVisibleDowloadFile = false;
        FileItems.Clear();
        FileTotal = 0;
        FileSize = 0;
        FileTypeTitle = null;
    }
}
