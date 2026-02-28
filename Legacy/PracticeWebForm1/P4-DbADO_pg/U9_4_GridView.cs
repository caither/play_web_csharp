using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeForm
{
    public partial class U9_4_GridView : System.Web.UI.Page
    {
        private NpgsqlConnection Pgconn { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string gdb_str = String.Format("Server={0};Port={1};User Id={2};Password={3};Database={4}");
            Pgconn = new NpgsqlConnection(gdb_str);

            QueryToTable();
        }

        private void QueryToTable()
        {
            string query_sql = String.Format(@"SELECT catalog_id
	, path, cloud_cover
	, acquisition_date, acquisition_time
FROM public.imagery2
WHERE catalog_id like '102001003C09%'
Limit 10;");

            Pgconn.Open();

            NpgsqlCommand cmd = new NpgsqlCommand(query_sql, Pgconn);

            //建立DataAdapter
            NpgsqlDataAdapter adapt = new NpgsqlDataAdapter(cmd);
            //寫入DataSet
            DataSet ds = new DataSet();
            adapt.Fill(ds);

            Pgconn.Close();

            //從DataSet 取資料放上頁面
            SetGridView(ds);
        }
        // 綁定給GridView
        private void SetGridView(DataSet ds)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}