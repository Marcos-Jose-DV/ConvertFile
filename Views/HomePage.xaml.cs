using ConvertFile.ViewModels;

namespace ConvertFile.Views;

public partial class HomePage : ContentPage
{
	public HomePage(HomeViewModel vm)
	{
		InitializeComponent();

		BindingContext = vm;
	}
}