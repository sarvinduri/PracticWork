using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Глазкова_Труфанова.Classes
{
    public class ClassDriver
    {
        public int Id_driver { get; set; }
        public string Full_name { get; set; }
        public string Phone { get; set; }
        public int Id_car { get; set; }
    }
    public partial class ClassRepair
    {
        public List<ClassRepair> CurrentClassRepairList { get; set; }
        public ClassRepair()
        {

        }
    }
}
