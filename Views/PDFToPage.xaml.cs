using ConvertFile.ViewModels;

namespace ConvertFile.Views;

public partial class PDFToPage : ContentPage
{
	public PDFToPage(PDFToViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}