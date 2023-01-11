using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KiranaWorldApp
{
    public class commm
    {
        private static string m_ConnectionString = "Data Source=148.72.232.167; Initial Catalog=KiranaWorld; User ID=KiranaWorld; Password='c28@t7wO';trusted_connection=false";

        public static string GetConnectionString()
        {
            return m_ConnectionString;
        }
    }
}