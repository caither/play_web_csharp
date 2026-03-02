<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U7_1_SqlData_ListCtrl.aspx.cs" Inherits="P3_DbADO_mysql.U7_1_SqlData_ListCtrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%-- SqlDataSource選用屬性儲存連線字串 --%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Driver={MySQL ODBC 8.0 Unicode Driver};database=northwind;db=northwind;no_schema=1;pwd={P@ssw0rd};port=3306;password={P@ssw0rd};server=localhost;uid=appuser;user=appuser" ProviderName="System.Data.Odbc" SelectCommand="SELECT EmployeeID, FirstName, LastName, Photo, Notes, birthdate FROM employees LIMIT 20;"></asp:SqlDataSource>


        <h1>List系列，使用SqlDataSource</h1>
        <p>都可以啟用AutoPostBack</p>
        <p>都支援OnDataBound</p>
        <h2>DropDownList控制項</h2>
        <ul>
            <li>html select elem + option elem</li>
            <li>利用OnDataBound 設定 html attr selected="selected"</li>
        </ul>
        <div id="DropDownList">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="firstname" DataValueField="lastname" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                AutoPostBack="True" OnDataBound="DropDownList1_DataBound">
            </asp:DropDownList>
            <asp:Label ID="DropDownListlbl" Text="利用SelectedIndexChanged擷取value" runat="server" />
        </div>
        <br />

        <h2>ListBox控制項</h2>
        <ul>
            <li>html select size="?" elem  + option elem</li>
            <li>支援多選 (設定SelectionMode="Multiple"並取消AutoPostBack)</li>
        </ul>
        <div id="ListBox">
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="firstname" DataValueField="EmployeeID" SelectionMode="Multiple"></asp:ListBox>
            <br />
            <asp:Button ID="ListBoxBtn" runat="server" Text="Read ListBox1" OnClick="ListBoxBtn_Click" />
            <asp:Label ID="ListBoxlbl" Text="value..." runat="server" />
        </div>
        <br />

        <h2>CheckBoxList控制項</h2>
        <ul>
            <li>html table + input type="checkbox" elem + label elem</li>
            <li>預設為多選，可用ListItem.Selected取出選擇項目</li>
        </ul>
        <div id="CheckBoxList">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="firstname" DataValueField="EmployeeID" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"></asp:CheckBoxList>
            <asp:Label ID="CheckBoxlbl" Text="value..." runat="server" />
        </div>
        <br />

        <h2>RadioButtonList控制項</h2>
        <ul>
            <li>html table + input type="radio" elem + label elem</li>
        </ul>
        <div id="RadioButtonList">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="firstname" DataValueField="EmployeeID" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"></asp:RadioButtonList>
            <asp:Label ID="RadioButtonlbl" Text="value..." runat="server" />
        </div>
        <br />
    </form>
</body>
</html>
