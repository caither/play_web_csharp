using Npgsql;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeForm
{
    public partial class UDataTable : System.Web.UI.Page
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
            NpgsqlDataReader reader = cmd.ExecuteReader();
            int field_cnt = reader.FieldCount;

            //寫入名稱列
            TableHeaderRow header_row = MakeHeaderRow(reader, field_cnt);
            Table1.Rows.Add(header_row);
            //寫入資料列
            while (reader.Read())
            {
                TableRow rowing = new TableRow();
                for (int i = 0; i < field_cnt; i++)
                {
                    TableCell cell = new TableCell();
                    cell.Text = reader.GetValue(i).ToString();
                    rowing.Cells.Add(cell);
                }
                Table1.Rows.Add(rowing);
            }

            Pgconn.Close();
        }

        //建立Row: 欄名稱之列
        private static TableHeaderRow MakeHeaderRow(NpgsqlDataReader reader, int field_cnt)
        {
            TableHeaderRow header = new TableHeaderRow();
            header.BackColor = Color.LightBlue; //using System.Drawing;
            for (int i = 0; i < field_cnt; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                cell.Text = reader.GetName(i).ToString();
                header.Cells.Add(cell);
            }
            return header;
        }
    }
}