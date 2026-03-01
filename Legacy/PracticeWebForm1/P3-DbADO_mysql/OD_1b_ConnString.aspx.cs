using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace P3_DbADO_mysql
{
    public partial class OD_2_ : System.Web.UI.Page
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
                    while (reader.Read())
                    {
                        for (int i = 0; i < fieldCount; i++)
                        {
                            string _name = reader.GetName(i);
                            string _valu = reader.GetValue(i).ToString();

                            var _label = new Label
                            {
                                Text = $"<p> ({i})| {_name}：{_valu} </p>"
                            };
                            ResultPanel1.Controls.Add(_label);
                        }// for i < fieldCount
                        ResultPanel1.Controls.Add(new LiteralControl("<hr />"));
                    }// while Read()
                }// using reader

                conn.Close();
            }// using command
        }
    }
}