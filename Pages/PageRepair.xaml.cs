using System;
using System.Collections.Generic;
using System.IO;
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
using Excel = Microsoft.Office.Interop.Excel;
using Word = Microsoft.Office.Interop.Word;

namespace Глазкова_Труфанова.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageRepair.xaml
    /// </summary>
    public partial class PageRepair : Page
    {
        public PageRepair()
        {
            InitializeComponent();

            dtgRepair.ItemsSource = Auto_repair_shopsEntities.GetContext().repair.ToList();
            CmbPrice.ItemsSource = Auto_repair_shopsEntities.GetContext().repair.Select(x=>x.price).Distinct().ToList();
            CmbFullName.ItemsSource = Auto_repair_shopsEntities.GetContext().Driver.ToList();
            CmbFullName.SelectedValuePath = "id_driver";
            CmbFullName.DisplayMemberPath = "full_name";
        }

        private void BtnResetFiltr_Click(object sender, RoutedEventArgs e)
        {
            dtgRepair.ItemsSource = Auto_repair_shopsEntities.GetContext().repair.ToList();
        }

        private void CmbPrice_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            decimal price = (decimal)(CmbPrice.SelectedValue);
            dtgRepair.ItemsSource = Auto_repair_shopsEntities.GetContext().repair.Where(x => x.price == price).ToList();
        }

        private void CmbFullName_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int dr = int.Parse(CmbFullName.SelectedValue.ToString());
            dtgRepair.ItemsSource = Auto_repair_shopsEntities.GetContext().repair.Where(x => x.id_driver == dr).ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Classes.ClassFrame.frmObj.Navigate(new PageAddEdit(null));
        }

        private void BtnClean_Click(object sender, RoutedEventArgs e)
        {
            var usersForRemoving = dtgRepair.SelectedItems.Cast<repair>().ToList();
            if (MessageBox.Show($"Удалить {usersForRemoving.Count()} пользователей?",
                "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)

                try
                {                    
                    Auto_repair_shopsEntities.GetContext().repair.RemoveRange(usersForRemoving);
                    Auto_repair_shopsEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены");
                    dtgRepair.ItemsSource = Auto_repair_shopsEntities.GetContext().repair.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Classes.ClassFrame.frmObj.Navigate(new PageAddEdit((sender as Button).DataContext as repair));
        }

        private void BtnControl_Click(object sender, RoutedEventArgs e)
        {
            Classes.ClassFrame.frmObj.Navigate(new Pages.PageClassDriver());
        }

        private void BtnGoListView_Click(object sender, RoutedEventArgs e)
        {
            Classes.ClassFrame.frmObj.Navigate(new Pages.PageListView());
        }

        private void BtnExcel_Click(object sender, RoutedEventArgs e)
        {
            var app = new Excel.Application();

            Excel.Workbook wr =
             app.Workbooks.Open($"" +
             $"{Directory.GetCurrentDirectory()}" +
             $"\\Шаблон.xlsx");
            Excel.Worksheet worksheet = (Excel.Worksheet)wr.Worksheets[1];

            int indexRows = 1;

            worksheet.Cells[1][indexRows] = "ФИО водителя";
            worksheet.Cells[2][indexRows] = "ФИО механика";
            worksheet.Cells[3][indexRows] = "Цена";

            var ListRepair = Auto_repair_shopsEntities.
                GetContext().repair.ToList();

            foreach (var repair in ListRepair)
            {
                indexRows++;
                worksheet.Cells[1][indexRows] = indexRows - 1;
                worksheet.Cells[1][indexRows] = repair.Driver.full_name;
                worksheet.Cells[1][indexRows] = repair.Mechanic.full_name;
                worksheet.Cells[1][indexRows] = repair.price;
            }
            app.Visible = true;
        }

        private void BtnWord_Click(object sender, RoutedEventArgs e)
        {
            var wordApp = new Word.Application();

            wordApp.Visible = true;
            wordApp.Documents.Add();
            wordApp.Documents.Open($"" +
             $"{Directory.GetCurrentDirectory()}" +
             $"\\Шаблон.docx");
        }

        private void BtnChart_Click(object sender, RoutedEventArgs e)
        {
            Classes.ClassFrame.frmObj.Navigate(new Pages.PageDiagram());
        }
    }
}