using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    class commm
    {
        private static string m_ConnectionString = "Data Source=SG2NWPLS14SQL-v05.shr.prod.sin2.secureserver.net;Initial Catalog=icemmmt;Persist Security Info=True;User ID=icemmmt;Password=um2e6Z^3;trusted_connection=false";

        public static string GetConnectionString()
        {
            return m_ConnectionString;
        }
    }
}
