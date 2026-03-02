<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U7_1_SqlData_ListCtrl.aspx.cs" Inherits="P3_DbADO_mysql.U7_1_SqlData_ListCtrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Sticky note styles for movies index notes */
        .rect-container {
            display: flex;
            gap: 16px;
            flex-wrap: wrap;
            margin-top: 1rem;
        }

        .rect-note {
            width: 45%;
            height: 50%;
            padding: 16px;
            background: ivory;
            border: 1px solid #f0e68c;
            box-shadow: 4px 6px 10px rgba(0,0,0,0.12);
            border-radius: 6px;
            font-size: 0.95rem;
            line-height: 1.4;
            color: #222;
            overflow: auto;
            display: inline-flex;
            align-items: flex-start;
            justify-content: center;
            text-align: left;
        }

            .rect-note p {
                margin: 0;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%-- SqlDataSource選用屬性儲存連線字串 --%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Driver={MySQL ODBC 8.0 Unicode Driver};database=northwind;db=northwind;no_schema=1;pwd={P@ssw0rd};port=3306;password={P@ssw0rd};server=localhost;uid=appuser;user=appuser" ProviderName="System.Data.Odbc" SelectCommand="SELECT EmployeeID, FirstName, LastName, Photo, Notes, birthdate FROM employees LIMIT 20;"></asp:SqlDataSource>


        <h1>List系列，使用SqlDataSource</h1>
        <p>都可以啟用AutoPostBack</p>
        <p>都支援OnDataBound</p>

        <div class="rect-container">

            <div id="DropDownList" class="rect-note">
                <h3>DropDownList控制項</h3>
                <ul>
                    <li>html select elem + option elem</li>
                    <li>利用OnDataBound 設定 html attr selected="selected"</li>
                </ul>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="firstname" DataValueField="lastname" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    AutoPostBack="True" OnDataBound="DropDownList1_DataBound">
                </asp:DropDownList>
                <asp:Label ID="DropDownListlbl" Text="利用SelectedIndexChanged擷取value" runat="server" />
            </div>


            <div id="ListBox" class="rect-note">
                <h3>ListBox控制項</h3>
                <ul>
                    <li>html select size="?" elem  + option elem</li>
                    <li>支援多選 (設定SelectionMode="Multiple"並取消AutoPostBack)</li>
                </ul>
                <br />
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="firstname" DataValueField="EmployeeID" SelectionMode="Multiple"></asp:ListBox>
                <br />
                <asp:Button ID="ListBoxBtn" runat="server" Text="Read ListBox1" OnClick="ListBoxBtn_Click" />
                <asp:Label ID="ListBoxlbl" Text="value..." runat="server" />
            </div>


            <div id="CheckBoxList" class="rect-note">
                <h3>CheckBoxList控制項</h3>
                <ul>
                    <li>html table + input type="checkbox" elem + label elem</li>
                    <li>預設為多選，可用ListItem.Selected取出選擇項目</li>
                </ul>
                <br />
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="firstname" DataValueField="EmployeeID" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"></asp:CheckBoxList>
                <asp:Label ID="CheckBoxlbl" Text="value..." runat="server" />
            </div>


            <div id="RadioButtonList" class="rect-note">
                <h3>RadioButtonList控制項</h3>
                <ul>
                    <li>html table + input type="radio" elem + label elem</li>
                </ul>
                <br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="firstname" DataValueField="EmployeeID" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"></asp:RadioButtonList>
                <asp:Label ID="RadioButtonlbl" Text="value..." runat="server" />
            </div>
        </div>

    </form>
</body>
</html>
