using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace P3_DbADO_mysql
{
    public partial class OD_2_DataTable : System.Web.UI.Page

    {
        private MySqlConnection conn { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var connStrSettings = ConfigurationManager.ConnectionStrings["NorthwindMySql"];
            if (connStrSettings == null || string.IsNullOrWhiteSpace(connStrSettings.ConnectionString))
            {
                throw new ConfigurationErrorsException("Missing NorthwindMySql connstring in Web.config");
            }
            string connStr = connStrSettings.ConnectionString;

            // 建立DB連線
            conn = new MySqlConnection(connStr);

            conn.Open();
            DataSource1.Text = conn.DataSource;
            DbName1.Text = conn.Database;

            conn.Close();
            DbState1.Text = conn.State.ToString();
        }

        protected void QueryButton1_Click(object sender, EventArgs e)
        {
            // 設定參數
            string qstr = QueryString1.Text.Trim();
            int queryID = 0;
            if (!string.IsNullOrWhiteSpace(qstr))
            {
                try { queryID = int.Parse(qstr); }
                catch (Exception ex) { DbState1.Text = ex.ToString(); }
            }
            using (var command = conn.CreateCommand())
            {
                string whereClause = " WHERE Price > 5 ";
                if (queryID != 0)
                {
                    whereClause = " WHERE ProductID = ? ";
                    command.Parameters.AddWithValue("@queryID", queryID);
                }
                command.CommandText = @"SELECT ProductID, Unit, Price, ProductName from products "
                + whereClause
                + " ORDER BY Price DESC "
                + " LIMIT 20;";

                conn.Open();

                using (var reader = command.ExecuteReader())
                {
                    int fieldCount = reader.FieldCount;

                    // 名稱列
                    TableHeaderRow header = MakeHeader(reader, fieldCount);
                    Table1.Rows.Add(header);

                    // 資料列
                    while (reader.Read())
                    {
                        var _row = new TableRow();
                        // 標題列
                        //var header_row = MakeHeaderRow();
                        // 資料列
                        for (int i = 0; i < fieldCount; i++)
                        {
                            // 裝載TableCell至Row
                            var _cell = new TableCell();
                            _cell.Text = reader.GetValue(i).ToString();
                            _row.Cells.Add(_cell);
                        }// for i < fieldCount

                        Table1.Rows.Add(_row);
                    }// while Read()

                }// using reader

                conn.Close();
            }// using command
        } // QueryButton1_Click()


        /// <summary>
        /// 使用欄名稱建立 TableHeaderRow
        /// </summary>
        /// <param name="reader"></param>
        /// <param name="fieldCount"></param>
        /// <returns>header</returns>
        private static TableHeaderRow MakeHeader(MySqlDataReader reader, int fieldCount)
        {
            var header = new TableHeaderRow();
            header.BackColor = Color.LightBlue; // using System.Drawing
            for (int i = 0; i < fieldCount; i++)
            {
                var _hcell = new TableHeaderCell();
                // 以 Column Name作為 Header row
                _hcell.Text = reader.GetName(i);
                header.Cells.Add(_hcell);
            }
            return header;
        }

    }// class OD_2_DataTable
}//ns