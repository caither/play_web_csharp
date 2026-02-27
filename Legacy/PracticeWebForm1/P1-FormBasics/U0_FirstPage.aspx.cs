using System;

namespace WebFormBasics
{
    public partial class U0_FirstPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = TextBox1.Text + ", 歡迎光臨。";
        }
    }
}