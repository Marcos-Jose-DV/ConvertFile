using CommunityToolkit.Maui;
using CommunityToolkit.Maui.Storage;
using ConvertFile.Data;
using ConvertFile.Services;
using ConvertFile.ViewModels;
using ConvertFile.Views;
using Microsoft.Extensions.Logging;

namespace ConvertFile;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
            .UseMauiCommunityToolkit()
            .ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
			});


		builder.Services.AddSingleton<IFileSaver>(FileSaver.Default);
        builder.Services.AddSingleton<IFolderPicker>(FolderPicker.Default);
        builder.Services.AddSingleton<HomePage>();
		builder.Services.AddSingleton<HomeViewModel>();
		builder.Services.AddSingleton<PDFToPage>();
		builder.Services.AddSingleton<PDFToViewModel>();
		builder.Services.AddSingleton<FileService>();
		builder.Services.AddSingleton<AppDbContext>();

#if DEBUG
		builder.Logging.AddDebug();
#endif

		return builder.Build();
	}
}
