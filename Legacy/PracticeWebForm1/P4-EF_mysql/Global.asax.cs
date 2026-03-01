using P4_EF_mysql.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace P4_EF_mysql
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {

            // Initialize the product database.
            //Database.SetInitializer(new ProductDatabaseInitializer());
        }
    }
}