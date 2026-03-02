<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U7_4a_FormView.aspx.cs" Inherits="P3_DbADO_mysql.U7_4_FormView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindMySql_ODBC %>" ProviderName="<%$ ConnectionStrings:NorthwindMySql_ODBC.ProviderName %>" SelectCommand="SELECT EmployeeID, FirstName, LastName, Photo, Notes, birthdate FROM employees LIMIT 20;"></asp:SqlDataSource>

        <h1>FormView控制項，顯示功能</h1>
        <p>單筆資料列舉</p>

        <h2>FormView控制項，搭配html table</h2>
        <ul>
            <li>每次只顯示一個項目，較適用於編輯環境</li>
            <li>啟用分頁: AllowPaging="True"</li>
        </ul>
        <div id="FormView1Html">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True">
                <ItemTemplate>
                    firstname: 
                    <%# DataBinder.Eval(Container.DataItem, "firstname") %>
                    <br />
                    birthdate: 
                    <%# DataBinder.Eval(Container.DataItem, "birthdate") %>
                    <br />
                </ItemTemplate>
            </asp:FormView>
        </div>
        
        <br />

    </form>
</body>
</html>
