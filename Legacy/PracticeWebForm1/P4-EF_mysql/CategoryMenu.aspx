<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryMenu.aspx.cs" Inherits="P4_EF_mysql.CategoryMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="CategoryMenu" style="text-align: center">
            <asp:ListView ID="categoryList"
                ItemType="P4_EF_mysql.Models.Product"
                runat="server"
                SelectMethod="GetCategories">
                <ItemTemplate>
                    <b style="font-size: large; font-style: normal">
                        <a href="/ProductList.aspx?id=<%#: Item.ProductID %>">
                            <%#: Item.ProductName %>
                        </a>
                    </b>
                </ItemTemplate>
                <ItemSeparatorTemplate>|  </ItemSeparatorTemplate>
            </asp:ListView>
        </div>
    </form>
</body>
</html>
