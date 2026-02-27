using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlProp1
{
    public partial class StdControl1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton1.Text = "LinkButton1_Click OK";
            ////等三秒後顯示 "this is LinkButton"
            //System.Threading.Thread.Sleep(3000); //會看不到"LinkButton1_Click OK"
            //LinkButton1.Text = "this is LinkButton";
        }

        //ImageButton1 的 EventArgs是 ImageClickEventArgs
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("X座標: ");
            sb.Append(e.X.ToString());
            sb.Append("\t Y座標: ");
            sb.Append(e.Y.ToString());
            LabelImageButton.Text = sb.ToString();
        }
    }
}