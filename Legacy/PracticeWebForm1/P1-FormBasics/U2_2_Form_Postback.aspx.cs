using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webevent1
{
    public partial class UWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //使用Form Data方式傳遞資料
            if (Text1.Value.Length > 0)
            {
                Message.Value = "您好, " + Text1.Value + "~~~";
            }
            else
            {
                // Page.IsPostBack 用於判斷這個網頁為初次呈現，或是為了回應回傳而載入。
                if (!IsPostBack)
                {
                    Message.Value = "尚未輸入."; // 初次呈現的狀況
                }
                else
                {
                    Message.Value = "輸入點什麼吧?"; // 為了回應回傳而載入的狀況
                }
            }
        }
    }
}