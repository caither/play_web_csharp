using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webf2
{
    public partial class Rsource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //method Get的資料:用 QueryString接收
            if (IsPostBack && Request.QueryString["1a_naming"].Length > 0)
            {
                //轉址
                string rdest_query = "U2_1b_ReceiveGET.aspx?hello=" + Request.QueryString["1a_naming"];

                Response.Redirect(rdest_query);
            }

        }
    }
}