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
    public partial class U9_3_DataSet : System.Web.UI.Page
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
            SetLabelCtrl(ds);
        }

        //從DataSet 轉存到Label Control
        private void SetLabelCtrl(DataSet ds)
        {
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                foreach (DataColumn col in ds.Tables[0].Columns)
                {
                    string col_name = col.ColumnName;
                    string resulting = row[col].ToString();
                    string col_type = col.DataType.Name;

                    Label labeling = new Label()
                    {
                        Text = String.Format("<p>({2}) {0}： {1}</p>", col_name, resulting, col_type)
                    };

                    ResultPanel.Controls.Add(labeling);
                }
                ResultPanel.Controls.Add(new LiteralControl("<hr />"));
            }
        }
    }
}