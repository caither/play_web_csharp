using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace P3_DbADO_mysql
{
    public partial class ado_1a_DataReader : System.Web.UI.Page
    {
        private MySqlConnection Conn { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            // set these values correctly for your database server
            var builder = new MySqlConnectionStringBuilder
            {
                Server = "localhost",
                UserID = "appuser",
                Password = "P@ssw0rd",
                Database = "northwind",
                SslMode = MySqlSslMode.None
            };

            // open a connection asynchronously
            Conn = new MySqlConnection(builder.ConnectionString);

            Conn.Open();
            DataSource1.Text = Conn.DataSource;
            DbName1.Text = Conn.Database;

            Conn.Close(); 
            DbState1.Text = Conn.State.ToString();

        }

        protected void SetButton1_Click(object sender, EventArgs e)
        {
            // Specify the parameter value.
            string qstr = SetString1.Text.Trim();

            int price = 264;
            if (qstr != String.Empty)
            {
                try { price = int.Parse(qstr); }
                catch (Exception) { }
            }

            // create a DB command and set the SQL statement with parameters
            var command = Conn.CreateCommand();
            command.CommandText = @" UPDATE products "
                + " SET Price = ? "
                + " WHERE ProductID = 38 ; "
                ;
            command.Parameters.AddWithValue("@price", price);

            Conn.Open();
            int rowCount = command.ExecuteNonQuery();
            Conn.Close();

            DbState1.Text = "影響資料筆數：" + rowCount.ToString();
        }

        protected void QueryButton1_Click(object sender, EventArgs e)
        {
            // Specify the parameter value.
            string qstr = QueryString1.Text.Trim();

            int queryID = 0;
            if (qstr != String.Empty)
            {
                try { queryID = int.Parse(qstr); }
                catch (Exception) { }
            }

            // create a DB command and set the SQL statement with parameters
            var command = Conn.CreateCommand();

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

            try
            {
                if (Conn.State == System.Data.ConnectionState.Open)
                {
                    // Connection 已經被開啟就不能再Open()，否則會出Execption
                }
                else { Conn.Open(); }

                var reader = command.ExecuteReader();

                int fieldCount = reader.FieldCount;
                while (reader.Read())
                {
                    for (int i = 0; i < fieldCount; i++)
                    {
                        string _name = reader.GetName(i);
                        string _valu = reader.GetValue(i).ToString();

                        Label _label = new Label
                        {
                            Text = $"<p> ({i})| {_name}：{_valu} </p>"
                        };
                        ResultPanel.Controls.Add(_label);
                    }// for
                    ResultPanel.Controls.Add(new LiteralControl("<hr />"));
                }// while

                Conn.Close();

            }
            catch (Exception)
            {
                throw;
            }
        }


    }
}