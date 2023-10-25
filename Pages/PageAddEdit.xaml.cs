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
    /// Логика взаимодействия для PageAddEdit.xaml
    /// </summary>
    public partial class PageAddEdit : Page
    {
        private repair repair_currentRepair = new repair();
        public PageAddEdit(repair selectedrepair)
        {
            InitializeComponent();

            if (selectedrepair!= null) 
                repair_currentRepair = selectedrepair;

            DataContext = repair_currentRepair;
           
            CmbCar.ItemsSource = Auto_repair_shopsEntities.GetContext().car.ToList();
            CmbCar.SelectedValuePath = "id_car";
            CmbCar.DisplayMemberPath = "car_number";

            CmbDriver.ItemsSource = Auto_repair_shopsEntities.GetContext().Driver.ToList();
            CmbDriver.SelectedValuePath = "id_driver";
            CmbDriver.DisplayMemberPath = "full_name";

            CmbMechanic.ItemsSource = Auto_repair_shopsEntities.GetContext().Mechanic.ToList();
            CmbMechanic.SelectedValuePath = "id_mechanic";
            CmbMechanic.DisplayMemberPath = "full_name";
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (repair_currentRepair.id_mechanic == 0)
                Auto_repair_shopsEntities.GetContext().repair.Add(repair_currentRepair);
            try
            {
                Auto_repair_shopsEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
                Classes.ClassFrame.frmObj.Navigate(new Pages.PageRepair());
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.Message.ToString());
            }
            //repair rep = new repair()
            //{
            //    id_car = int.Parse(CmbCar.SelectedValue.ToString()),
            //    id_driver = int.Parse(CmbDriver.SelectedValue.ToString()),
            //    id_mechanic = int.Parse(CmbMechanic.SelectedValue.ToString()),
            //    price = int.Parse(TxtPrice.Text)
            //};
            //Auto_repair_shopsEntities.GetContext().repair.Add(rep);
            //Auto_repair_shopsEntities.GetContext().SaveChanges();
                
        }
    }
}