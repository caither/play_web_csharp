<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OD_4_GridView.aspx.cs" Inherits="P3_DbADO_mysql.OD_4_GridView" %>

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
            <h2>Query norhtwind，使用 DataSet 中繼，GridView.DataBind </h2>

            <asp:Label ID="LabelQ" runat="server" Text="Qurey by Product id"></asp:Label>
            <asp:TextBox ID="QueryString1" runat="server" placeholder="Product id"></asp:TextBox>

            <asp:Button ID="QueryButton1" runat="server" Text="Query" OnClick="QueryButton1_Click" />
            <br />
            <div id="grid_view">
                <p>樣式為GridView自動格式化：簡單樣式</p>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>

            </div>
        </div>
    </form>
</body>
</html>
