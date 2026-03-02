<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U7_2b_SqlData_DataList.aspx.cs" Inherits="P3_DbADO_mysql.U7_2b_SqlData_DataList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindMySql_ODBC %>" ProviderName="<%$ ConnectionStrings:NorthwindMySql_ODBC.ProviderName %>" SelectCommand="SELECT EmployeeID, FirstName, LastName, Photo, Notes, birthdate FROM employees LIMIT 20;"></asp:SqlDataSource>

        <h1>基本資料控制項，使用SqlDataSource</h1>
        <p>&lt;%# is a data binding syntax for use in databound controls.</p>
        <br />

        <h3>參考用GridView</h3>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="EmployeeID">
        </asp:GridView>
        <br />

        <h2>DataList控制項，搭配Label控制項</h2>
        <ul>
            <li>跟Repeater類似，相當於可用Auto Format 之 Repeater Control，而且標籤項目豐富很多</li>
            <li>設計編輯功能中的Auto Format產生樣式，能減少hard coding</li>
        </ul>
        <p>DataBinder.Eval(Container.DataItem, "birthdate") 可以簡寫成 Eval("birthdate")</p>
        <p>DataBinder.Eval() 放在Text屬性內的時候，必須用單引號 Text=&#39;&lt;%# Eval(...) %&gt;&#39;</p>
        <br />

        <div id="DataList">
            <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#E3EAEB" />
                <%--注意 <%# 外面必須用單引號 --%>
                <%--  <%# : data binding syntax for use in databound controls. --%>
                <ItemTemplate>
                    <asp:Label runat="server" Text="firstname" />
                    <asp:Label ID="firstname" runat="server" Text='<%# Eval("firstname") %>' />
                    <br />
                    <asp:Label runat="server" Text="birthdate" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("birthdate") %>' />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
        </div>
        <br />

    </form>
</body>
</html>
