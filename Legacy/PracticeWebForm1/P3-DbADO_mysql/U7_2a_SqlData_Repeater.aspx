<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U7_2a_SqlData_Repeater.aspx.cs" Inherits="P3_DbADO_mysql.U7_2a_SqlData_Repeater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        .context {
            color: rgb(34, 34, 34);
            font-family: &quot;
            Segoe UI&quot;
            , Tahoma, Arial, Helvetica, sans-serif;
            font-size: 19.512px;
            font-style: normal;
            font-variant-ligatures: normal;
            font-variant-caps: normal;
            font-weight: normal;
            letter-spacing: normal;
            orphans: 2;
            text-align: left;
            text-indent: 0px;
            text-transform: none;
            white-space: normal;
            widows: 2;
            word-spacing: 0px;
            -webkit-text-stroke-width: 0px;
            text-decoration-style: initial;
            text-decoration-color: initial;
        }

        span {
            display: inline !important;
            float: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindMySql_ODBC %>" ProviderName="<%$ ConnectionStrings:NorthwindMySql_ODBC.ProviderName %>" SelectCommand="SELECT EmployeeID, FirstName, LastName, Photo, Notes, birthdate FROM employees LIMIT 20;"></asp:SqlDataSource>

        <h1>基本資料控制項，使用SqlDataSource</h1>
        <span class="context">&lt;%# is a data binding syntax for use in databound controls.</span>
        <br />
        <span class="context">&lt;%= is a short cut for Response.Write.</span>
        <br />
        <span class="context">&lt;%@ is a directive to include a namespace, page directives, etc.</span>
        <br />

        <h3>參考用GridView</h3>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" SortExpression="EmployeeID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:BoundField DataField="birthdate" HeaderText="birthdate" SortExpression="birthdate" />
            </Columns>
        </asp:GridView>
        <br />

        <h2>Repeater控制項，搭配html table</h2>
        <ul>
            <li>等同在aspx端做foreach效果</li>
            <li>顯示區域需要handmade。 標籤項目有 HeaderTemplate + ItemTemplate + FooterTemplate +...</li>
            <li>只有ItemTemplate 是必要項</li>
        </ul>
        <p>DataBinder.Eval(Container.DataItem, "birthdate") 可以簡寫成 Eval("birthdate")</p>
        <br />

        <div id="repeater1Html">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <%--開頭tag--%>
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>firstname</th>
                            <th>birthdate</th>
                        </tr>
                </HeaderTemplate>
                <%--重複的區段--%>
                <%--  <%# : data binding syntax for use in databound controls. --%>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "firstname") %>
                        </td>
                        <td>
                            <%# Eval("birthdate") %>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr style="background-color: silver">
                        <td>
                            <%# Eval("firstname") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "birthdate") %>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <%--結尾tag--%>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <br />

        <h2>Repeater控制項，plain text + SeparatorTemplate</h2>
        <ul>
            <li>顯示區域標籤項目 ItemTemplate + SeparatorTemplate</li>
        </ul>

        <div id="repeater2Ctrl">
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                <%--重複的區段--%>
                <%--  <%# : data binding syntax for use in databound controls. --%>
                <ItemTemplate>
                    <asp:Label runat="server" Text="firstname" />
                    <%# DataBinder.Eval(Container.DataItem, "firstname") %>
                    <br />
                    <asp:Label runat="server" Text="birthdate" />
                    <%# Eval("birthdate") %>
                    <br />
                </ItemTemplate>
                <SeparatorTemplate>
                    <hr />
                </SeparatorTemplate>
            </asp:Repeater>
        </div>
        <br />


    </form>
</body>
</html>
