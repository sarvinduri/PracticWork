using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms.DataVisualization.Charting;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Глазкова_Труфанова.Classes;

namespace Глазкова_Труфанова.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageDiagram.xaml
    /// </summary>
    public partial class PageDiagram : Page
    {
        public PageDiagram()
        {
            InitializeComponent();
            ChartPayments.ChartAreas.Add(new ChartArea("Main"));
            var currentSeries = new Series("Payments")
            {
                IsValueShownAsLabel = true
            };
            ChartPayments.Series.Add(currentSeries);
            CmbUsers.ItemsSource = Auto_repair_shopsEntities.GetContext().repair.ToList();
            CmbChart.ItemsSource = Enum.GetValues(typeof(SeriesChartType));
        }
        private void UpdateChart(object sender, SelectionChangedEventArgs e)
        {
            if (CmbUsers.SelectedItem is repair currentUser &&
                CmbChart.SelectedItem is SeriesChartType currentType)
            {
                Series currentSeries = ChartPayments.Series.FirstOrDefault();
                currentSeries.ChartType = currentType;
                currentSeries.Points.Clear();

                var RepairList = Auto_repair_shopsEntities.GetContext().repair.ToList();

                foreach (var rep in RepairList)

                {
                    currentSeries.Points.AddXY(rep.id_repair, rep.price);
                }
            }
        }
    }
}
