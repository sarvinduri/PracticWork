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
using Глазкова_Труфанова.Classes;

namespace Глазкова_Труфанова.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageClassDriver.xaml
    /// </summary>
    public partial class PageClassDriver : Page
    {
        public List<ClassDriver> CurrentClassDriverList { get; set; }
        public PageClassDriver()
        {
            InitializeComponent();
            dtgDriver.ItemsSource = Auto_repair_shopsEntities.GetContext().Driver.ToList();
        }
    }
}
