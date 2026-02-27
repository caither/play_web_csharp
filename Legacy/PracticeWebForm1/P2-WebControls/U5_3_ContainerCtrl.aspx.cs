using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeForm
{
    public partial class ContainerCtrl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddButton1_Click(object sender, EventArgs e)
        {
            string mystr = TextBox1.Text;
            Label new_label = new Label()
            {
                Text = mystr
            };

            Ph1.Controls.Add(new_label);
            Ph1.Controls.Add(new LiteralControl("<br />"));
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedItem.Value == "0") CmdPanel.Visible = false;
            else CmdPanel.Visible = true;
        }
    }
}