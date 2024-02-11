using ConvertFile.Models;
using ConvertFile.ViewModels;
using Microsoft.Maui.Storage;
using System.Collections.ObjectModel;

namespace ConvertFile.Views;

public partial class HomePage : ContentPage
{
	public HomePage(HomeViewModel vm)
	{
		InitializeComponent();

		BindingContext = vm;
	}
}