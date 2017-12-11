using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace GShop_Win
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            System.Windows.Controls.WebBrowser browser = new System.Windows.Controls.WebBrowser();
            // you can put any other uri here, or better make browser field and navigate to desired uri on some event
            browser.Navigate(new Uri("http://localhost:60181"));
            grdBrowserHost.Children.Add(browser);
        }
        private void Window_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                this.Close();
            }
            else
            {
                this.Topmost = !this.Topmost;
            }
        }
    }
}
