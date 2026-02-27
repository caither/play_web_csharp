using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebControls
{
    public partial class U6_1_TableCtrl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //WebForm預設用UnobtrusiveValidationMode來驗証，可以設定不要使用UnobtrusiveValidationMode，如下
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }
    }
}