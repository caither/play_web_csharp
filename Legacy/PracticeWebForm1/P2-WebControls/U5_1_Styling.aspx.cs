using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlProp1
{
    public partial class Properties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AccessKeyButton_Click(object sender, EventArgs e)
        {
            Label1.Text = "AccessKeyButton OK";
        }
    }
}