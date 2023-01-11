using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    class commm
    {
        private static string m_ConnectionString = "Data Source=SG2NWPLS19SQL-v05.mssql.shr.prod.sin2.secureserver.net; Initial Catalog=KiranaWorld; User ID=KiranaWorld; Password='c28@t7wO';trusted_connection=false";

        public static string GetConnectionString()
        {
            return m_ConnectionString;
        }
    }
}
