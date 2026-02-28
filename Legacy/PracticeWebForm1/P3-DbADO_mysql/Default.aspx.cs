using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webf3
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = DateTime.Now.ToString();

            //自動更新頁面
            Response.AppendHeader("Refresh", "30");

            AddRootFileLinks();
        }

        private void AddRootFileLinks()
        {
            //用AppDomain.CurrentDomain.BaseDirectory取得跟路徑
            DirectoryInfo root_dir = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory);

            FileInfo[] aspx_files = root_dir.GetFiles("*.aspx", SearchOption.TopDirectoryOnly);

            Debug.WriteLine(aspx_files.Length);

            foreach (FileInfo aspx in aspx_files)
            {
                //動態新增list tag
                PlaceHolder1.Controls.Add(new LiteralControl("<li>"));

                //新增連結
                HyperLink link = new HyperLink()
                {
                    Text = aspx.Name,
                    Target = "_blank",
                    //轉成絕對路徑
                    NavigateUrl = ResolveUrl("~/") + aspx.Name,
                    ID = aspx.Name
                };
                PlaceHolder1.Controls.Add(link);

                PlaceHolder1.Controls.Add(new LiteralControl("</li>"));
            }


        }
    }
}