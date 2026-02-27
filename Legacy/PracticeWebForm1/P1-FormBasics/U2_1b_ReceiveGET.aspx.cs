using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webf2
{
    public partial class Rdest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //接受GET method字串
            //url e.g. /Rdest.aspx?hello=abc123
            string message = "your message: \t" + Request.QueryString["hello"];

            Response.Write(message);
        }
    }
}