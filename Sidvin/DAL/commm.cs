using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    class commm
    {
        private static string m_ConnectionString = "Data Source=103.21.58.193; Initial Catalog=sidvin; User ID=sidvin; Password='fi7Fb2*6';trusted_connection=false";

        public static string GetConnectionString()
        {
            return m_ConnectionString;
        }
    }
}
