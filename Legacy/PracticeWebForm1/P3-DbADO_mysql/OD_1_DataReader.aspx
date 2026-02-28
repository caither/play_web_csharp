<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OD_1_DataReader.aspx.cs" Inherits="P3_DbADO_mysql.ado_1a_DataReader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="db_status">
            <p>DataSource:<asp:Label ID="DataSource1" runat="server" Text="Label"></asp:Label></p>
            <p>DataBase:<asp:Label ID="DbName1" runat="server" Text="Label"></asp:Label></p>

            <p>DbState:<asp:Label ID="DbState1" runat="server" Text="Label"></asp:Label></p>
        </div>
        <br />

        <div id="db_update">
            <h3>Update productID=38</h3>
            <asp:Label ID="Label1" runat="server" Text="Set Price:"></asp:Label>
            <asp:TextBox ID="SetString1" runat="server" Text="264"></asp:TextBox>
            <asp:Button ID="SetButton1" runat="server" Text="Update" OnClick="SetButton1_Click" />
        </div>
        <br />

        <div id="db_query">
            <h3>Query northwind products； 使用 DataReader + new LiteralControl html</h3>

            <asp:Label ID="LabelQ" runat="server" Text="Find by Product id"></asp:Label>
            <asp:TextBox ID="QueryString1" runat="server" placeholder="Product id"></asp:TextBox>

            <asp:Button ID="QueryButton1" runat="server" Text="Query" OnClick="QueryButton1_Click" />
            <br />
            <asp:Panel ID="ResultPanel" runat="server"></asp:Panel>
        </div>

    </form>
</body>
</html>
