using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webf3
{
    public partial class TryCatch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                // TextBox 的輸入內容加起來，呈現在 ResultLabel
                short a = short.Parse(TextBoxA.Text);
                short b = short.Parse(TextBoxB.Text);
                int c = a + b;
                ResultLabel.Text = c.ToString();

            }
            catch (FormatException fex)
            {
                ResultLabel.Text = fex.Message;
            }
            catch (Exception ex)
            {
                ResultLabel.Text = ex.ToString();
            }
            finally
            {
                ResultLabel.Text += "<br /> finish.";
            }
        }
    }
}