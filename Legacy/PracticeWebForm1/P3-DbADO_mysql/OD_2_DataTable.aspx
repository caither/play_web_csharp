<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OD_2_DataTable.aspx.cs" Inherits="P3_DbADO_mysql.OD_2_DataTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="db_status">
            <p>DataSource:<asp:Label ID="DataSource1" runat="server" Text="Label"></asp:Label></p>
            <p>Database:<asp:Label ID="DbName1" runat="server" Text="Label"></asp:Label></p>
            <p>DbState:<asp:Label ID="DbState1" runat="server" Text="Label"></asp:Label></p>
        </div>

        <div id="db_query">
            <h2>Query norhtwind，使用 DataReader + Table Control</h2>

            <asp:Label ID="LabelQ" runat="server" Text="Qurey by Product id"></asp:Label>
            <asp:TextBox ID="QueryString1" runat="server" placeholder="Product id"></asp:TextBox>

            <asp:Button ID="QueryButton1" runat="server" Text="Query" OnClick="QueryButton1_Click" />
            <br />
            <asp:Table ID="Table1" runat="server"></asp:Table>
        </div>
    </form>
</body>
</html>
