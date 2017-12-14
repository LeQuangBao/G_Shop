using System;
using System.Windows;
using System.Windows.Input;

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
            rfe.Click += rfe_Click;
            go.Click += go_Click;
            //System.Windows.Controls.WebBrowser browser = new System.Windows.Controls.WebBrowser();
            //// you can put any other uri here, or better make browser field and navigate to desired uri on some event
            //browser.Navigate(new Uri("http://localhost:60181/"));
            //grdBrowserHost.Children.Add(browser);
            brw.Navigate("http://localhost:60181/");
            link.Text = "http://localhost:60181/";
        }
        private void rfe_Click(object sender, RoutedEventArgs e)
        {
            // do something
            brw.Refresh();
        }
        private void go_Click(object sender, RoutedEventArgs e)
        {
            // do something
            brw.Navigate(link.Text);
        }
        private void OnKeyDownHandler(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Return)
            {
                brw.Navigate(link.Text);
            }
        }
    }
}
