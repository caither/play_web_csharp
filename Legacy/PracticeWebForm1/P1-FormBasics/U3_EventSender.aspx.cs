using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webf3
{
    public partial class SenderTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCom_Click(object sender, EventArgs e)
        {
            //(利用javascript alert)顯示觸發Click事件的項目內文
            string alert_str =
                String.Format("<script>alert('{0}');</script>", ((Button)sender).Text);

            //插入alert_str於html header
            Response.Write(alert_str);
        }
    }
}