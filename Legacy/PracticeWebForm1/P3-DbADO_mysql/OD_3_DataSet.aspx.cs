using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P3_DbADO_mysql
{
    public partial class OD_3_DataSet : System.Web.UI.Page
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

                // * 用Adapter填入 Dataset */
                conn.Open();
                var dataAdapter = new MySqlDataAdapter(command);
                var dataSet = new DataSet();
                dataAdapter.Fill(dataSet);
                conn.Close();

                // * 從DataSet.Tables 取資料放上頁面 */
                foreach (DataRow _row in dataSet.Tables[0].Rows)
                {
                    foreach (DataColumn _col in dataSet.Tables[0].Columns)
                    {
                        string _name = _col.ColumnName;
                        string _valu = _row[_col].ToString();
                        string _type = _col.DataType.Name;

                        var _label = new Label
                        {
                            Text = $"<p> {_type}| {_name}：{_valu} </p>"
                        };
                        ResultPanel1.Controls.Add(_label);
                    } // foreach column
                    ResultPanel1.Controls.Add(new LiteralControl("<hr />"));
                } // foreach row
            }// using command

        }// QueryButton1_Click()

    }// class OD_3_DataSet
}// namespace