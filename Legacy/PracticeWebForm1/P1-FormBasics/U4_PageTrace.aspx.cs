using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webf3
{
    public partial class PageTrace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //產生run time error
        private void InvokeError(object obj)
        {
            //object obj = "some thing";
            ErrorMaker.ParseBool(obj);
        }

        protected void BoolButton_Click(object sender, EventArgs e)
        {
            InvokeError(BoolBox.Text);
        }
    }

    public class ErrorMaker
    {
        //傳入的物件無法解析成Boolean時發生錯誤
        public static void ParseBool(object obj)
        {
            bool b = bool.Parse(obj.ToString());
        }
    }
}