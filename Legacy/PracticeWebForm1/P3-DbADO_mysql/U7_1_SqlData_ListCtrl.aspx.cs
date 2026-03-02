using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P3_DbADO_mysql
{
    public partial class U7_1_SqlData_ListCtrl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //反映選取項目之值
        // SelectedItem.Text <- attr DataTextField，
        // SelectedItem.Value <- attr DataValueField
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = ((DropDownList)sender).SelectedValue;
            //等同  ((DropDownList)sender).SelectedItem.Value;
            DropDownListlbl.Text = value;
        }

        //利用OnDataBound 設定預設選擇之項目
        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            int selected_idx = 3;
            ((DropDownList)sender).SelectedIndex = selected_idx;

            string value = ((DropDownList)sender).Items[selected_idx].Value;
            DropDownListlbl.Text = value;


            DropDownListlbl.Text = value;
        }

        //
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = ((ListBox)sender).SelectedValue;
            //等同  ((DropDownList)sender).SelectedItem.Value;
            ListBoxlbl.Text = value;
        }

        protected void ListBoxBtn_Click(object sender, EventArgs e)
        {
            //讀取支援多選的控制項，使用GetSelectedIndices()
            //先清空顯示區
            ListBoxlbl.Text = "";

            int[] idxs = ListBox1.GetSelectedIndices();
            foreach (int idx in idxs)
            {
                string texting = ListBox1.Items[idx].Text;
                ListBoxlbl.Text += texting;
            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //讀取支援多選的控制項，使用 ListItem
            CheckBoxlbl.Text = "";

            ListItemCollection collection = CheckBoxList1.Items;
            foreach (ListItem iteming in collection)
            {
                //只取選擇的項目
                if (iteming.Selected)
                {
                    string texting = iteming.Text;
                    CheckBoxlbl.Text += texting;
                }
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = ((RadioButtonList)sender).SelectedValue;
            RadioButtonlbl.Text = value;
        }
    }
}