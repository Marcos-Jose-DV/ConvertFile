using System.Drawing;

namespace ConvertFile;

public partial class MainPage
{ 
    public MainPage()
    {
        InitializeComponent();

      
    }

    













    private void OnCounterClicked(object sender, EventArgs e)
    {
        // AddImagem();
    }

    //public async Task GetConvertedPNGFileAsync(string imagename)
    //{
    //    // Carrega a imagem do arquivo
    //    var bitmap = Bitmap.FromFile(imagename);

    //    // Define o caminho completo para o arquivo de saída
    //    // string outputFilePath = Path.Combine(outputPath, Path.GetFileNameWithoutExtension(imagename) + ".png");

    //    // Salva a imagem no formato PNG
    //    //bitmap.Save(outputFilePath, System.Drawing.Imaging.ImageFormat.Png);

    //    var folderPicker = new OpenFolderDialog();
    //    string selectedFolder = await folderPicker.ShowAsync();
    //    if (!string.IsNullOrEmpty(selectedFolder))
    //    {
    //        // Faz algo com o caminho do diretório selecionado
    //        Console.WriteLine($"Diretório selecionado: {selectedFolder}");
    //    }

    //    if (result != null)
    //    {
    //        var outputFilePath = Path.Combine(result, Path.GetFileNameWithoutExtension(imagename) + ".png");
    //        bitmap.Save(outputFilePath, System.Drawing.Imaging.ImageFormat.Png);
    //    }
    //}

    //public async Task<ImageSource> AddImagem()
    //{
    //    try
    //    {
    //        // Abre o diretorio para adicionar uma imagem
    //        var result = await FilePicker.PickAsync(new PickOptions
    //        {
    //            PickerTitle = "Pegar Image",
    //            FileTypes = FilePickerFileType.Images

    //        });

    //        if (result == null)
    //        {
    //            return null;
    //        }

    //        var source = GetConvertedPNGFileAsync(result.FullPath);
    //        //receber a imagem e retorna a imagem adicionada
    //        //var stream = await result.OpenReadAsync();
    //        //var image = ImageSource.FromStream(() => stream);



    //        //// Chama o metodo para geral um guid para renomear o nome da imagem
    //        //string fileName = GenerateLowerCaseGuid() + Path.GetExtension(result.FileName);

    //        //// Combina o caminho do arquivo depois salva no caminho
    //        //string filePath = Path.Combine(_directory, fileName);
    //        //using FileStream fileStream = File.Create(filePath);
    //        //Stream.Null.CopyTo(fileStream);

    //        return null;
    //    }
    //    catch (NullReferenceException ex)
    //    {
    //        return ex.ToString();
    //    }
    //    catch (Exception ex)
    //    {
    //        return ex.ToString();
    //    }
    //}
}
