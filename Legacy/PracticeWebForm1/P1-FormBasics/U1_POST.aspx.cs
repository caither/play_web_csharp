using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webf1
{
    public partial class Hello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //WebForm根據id tag操縱控制項
            Label1.Text = "從code behind丟訊息給asp Label";

            span_serv.InnerText = "從code behind丟訊息給tag span";


            //接收aspx送來的request
            //Form、QueryString的key取的是name tag，不是id tag
            if (IsPostBack)
            {
                //method Post的資料:用 Request.Form接收
                if (Request.Form["text_name"] != null)
                {
                    string message = "Form_POST got " + Request.Form["text_name"] + "。 <br>";
                    //Response.Write會把message插在整個DOM的最前面
                    Response.Write(message);
                }
                //method Get的資料:用 QueryString接收
                if (Request.QueryString["text_name"] != null)
                {
                    string message = "Form_GET got " + Request.QueryString["text_name"] + "。 <br>";

                    Response.Write(message);
                }
            }
        }
    }
}