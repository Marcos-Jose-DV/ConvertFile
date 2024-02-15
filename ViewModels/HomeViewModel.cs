using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using CommunityToolkit.Maui.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ConvertFile.Models;
using ConvertFile.Services;
using System.Collections.ObjectModel;
using System.Drawing;
using Image = Microsoft.Maui.Controls.Image;

namespace ConvertFile.ViewModels;

public partial class HomeViewModel : ObservableObject
{
    private readonly FileService _fileService;
    private readonly IFolderPicker _folderPicker;

    [ObservableProperty]
    ObservableCollection<FileItem> _fileItems = new();

    [ObservableProperty]
    string _fileName, _fileTypeTitle, _FullPath;

    [ObservableProperty]
    List<Stream> _stream = new();

    [ObservableProperty]
    bool _isBusy, _isVisibleFooter, _isVisibleHeader, _isVisibleDiplayInfo, _isVisibleDowloadFile;

    [ObservableProperty]
    int _fileTotal;

    [ObservableProperty]
    long _fileSize;

    private List<FileResult> _results;

    public HomeViewModel(FileService fileService, IFolderPicker folderPicker)
    {
        _fileService = fileService;
        IsVisibleHeader = true;
        _folderPicker = folderPicker;
    }

    //[RelayCommand]
    //async Task SaveFile(CancellationToken cancellationToken)
    //{
    //    _fileService.SaveFileAsync(FileName, Stream[0], cancellationToken);
    //}

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
                FileTypes = FilePickerFileType.Images,
                PickerTitle = "Escolha a image",
            }));


            if (_results.Count() == 0)
            {
                await Toast.Make($"Nenhum arquivo selecionado").Show(cancellationToken);
                return;
            }

            IsBusy = !IsBusy;
            IsVisibleHeader = !IsVisibleHeader;
            IsVisibleDiplayInfo = !IsVisibleDiplayInfo;
            IsVisibleFooter = !IsVisibleFooter;
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
    }

    [RelayCommand]
    private void RemoveFile(FileItem obj)
    {
        FileItems.Remove(obj);
        FileTotal -= 1;
        FileSize -= obj.FileSize;
    }

    [RelayCommand]
    private async Task ConvertFile()
    {
        if (FileTypeTitle is null)
        {
            await Toast.Make($"Por favor, selecione o tipo de arquivo para conversão: PNG, GIF, JPEG").Show();
            return;
        }

        IsBusy = !IsBusy;
        try
        {
            for (int i = 0; i < FileItems.Count; i++)
            {
                using (Bitmap bitmap = new(FileItems[i].FullPath))
                {
                    using (MemoryStream stream = new())
                    {

                        FileSize -= FileItems[i].FileSize;
                        FileItem fileItem = new()
                        {
                            FileName = Path.GetFileNameWithoutExtension(FileItems[i].FileName) + "." + FileTypeTitle.ToLower(),
                            FullPath = FileItems[i].FullPath
                        };

                        switch (FileTypeTitle)
                        {
                            case "PNG":
                                bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                                break;
                            case "GIF":
                                bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Gif);
                                break;
                            case "ICON":
                                bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Icon);
                                break;
                            case "JPEG":
                                bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                                break;
                        }
                        fileItem.ConvertedFile = stream.ToArray();
                        fileItem.FileSize = fileItem.ConvertedFile.Length;
                        FileSize += fileItem.FileSize;

                        FileItems[i] = fileItem;

                        await Task.Delay(100);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Clean();
            await Toast.Make($"Error! tente de novo, {ex.Message}").Show();
            return;
        }
        finally
        {
            IsBusy = !IsBusy;
            IsVisibleDowloadFile = true;
            IsVisibleFooter = false;
        }
    }

    [RelayCommand]
    private async Task Dowload(CancellationToken cancellationToken)
    {
        var folderPickerResult = await _folderPicker.PickAsync(cancellationToken);
        if (folderPickerResult.IsSuccessful)
        {
            FullPath = folderPickerResult.Folder.Path;
            for (int i = 0; i < FileItems.Count; i++)
            {
                string fileName = FileItems[i].FileName;
                string filePath = Path.Combine(folderPickerResult.Folder.Path, fileName);
                File.WriteAllBytes(filePath, FileItems[i].ConvertedFile);
            }
            await Toast.Make($"Arquivo salvo com sucesso - {folderPickerResult.Folder.Path}", ToastDuration.Long).Show(cancellationToken);
            Clean();
        }
        else
        {
            await Toast.Make($"Folder is not picked, {folderPickerResult.Exception.Message}").Show(cancellationToken);
        }

    }

    [RelayCommand]
    private void Canceled()
    {
        Clean();
    }
    private void Clean()
    {
        IsVisibleHeader = true;
        IsVisibleDowloadFile = false;
        IsVisibleDiplayInfo = false;
        FileItems.Clear();
        FileTotal = 0;
        FileSize = 0;
        FileTypeTitle = null;
    }
}