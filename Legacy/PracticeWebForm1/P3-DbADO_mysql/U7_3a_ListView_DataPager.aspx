<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U7_3a_ListView_DataPager.aspx.cs" Inherits="P3_DbADO_mysql.U7_3a_ListView_DataPager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindMySql_ODBC %>" ProviderName="<%$ ConnectionStrings:NorthwindMySql_ODBC.ProviderName %>" SelectCommand="SELECT EmployeeID, FirstName, LastName, Photo, Notes, birthdate FROM employees LIMIT 20;"></asp:SqlDataSource>

        <h1>ListView控制項，顯示功能</h1>
        <p>清單資料列舉。支援分頁、編輯</p>
        <p>vs2008的時代，ListView是唯一支援 DataPager (實作IPageableItemContainer) 的控制項 </p>
        <h2>ListView控制項，搭配html table</h2>
        <ul>
            <li>跟repeater類似，顯示區可以handmade。</li>
            <li>常用標籤項目有LayoutTemplate、ItemTemplate</li>
            <li>只有ItemTemplate 是必要項</li>
        </ul>
        <div id="ListView1Html">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <table>
                        <tr>
                            <th>firstname</th>
                            <th>birthdate</th>
                        </tr>
                        <%--elem 屬性設 runat="server" ID="itemPlaceholder" 來指定項目預留位置。 用哪種elem似乎無所謂--%>
                        <tr runat="server" id="itemPlaceholder"></tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <%--取代Layout裡的<tr runat="server" id="itemPlaceholder"></tr>--%>
                    <tr>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "firstname") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "birthdate") %>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <br />

        <hr />
        <h2>ListView控制項，plain text + SeparatorTemplate</h2>
        <ul>
            <li>顯示區域標籤項目 LayoutTemplate + ItemTemplate + ItemSeparatorTemplate</li>
        </ul>

        <div id="ListView2Ctrl">
            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <%--指定項目預留位置。用哪種elem似乎無所謂。 實際上頁面不會出現這個div --%>
                    <div runat="server" id="itemPlaceholder"></div>
                </LayoutTemplate>
                <ItemTemplate>
                    <%--這個tr會取代Layout裡的<tr runat="server" id="itemPlaceholder"></tr>--%>
                firstname: 
                    <%# DataBinder.Eval(Container.DataItem, "firstname") %>
                    <br />
                    birthdate: 
                    <%# DataBinder.Eval(Container.DataItem, "birthdate") %>
                    <br />
                </ItemTemplate>
                <ItemSeparatorTemplate>
                    <p>------------</p>
                </ItemSeparatorTemplate>
            </asp:ListView>
        </div>
        <br />

        <hr />
        <h2>ListView控制項+ DataPager 控制項</h2>
        <ul>
            <li>DataPager1設定 PageSize="3"</li>
            <li>DataPager內的 NextPreviousPagerField 要 handmade</li>
        </ul>
        <p>用法1: DataPager 位於 IPageableItemContainer 內部，(放進LayoutTemplate) </p>
        <p>用法2: PagedControlID 設定為 IPageableItemContainer 的控制項 ID 。(待嘗試)</p>

        <div id="ListView3DataPager">
            <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <div runat="server" id="itemPlaceholder"></div>
                    <!--DataPager-->
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button"
                                ShowFirstPageButton="true" ShowLastPageButton="true" />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <%--這個tr會取代Layout裡的<tr runat="server" id="itemPlaceholder"></tr>--%>
                firstname: 
                    <%# DataBinder.Eval(Container.DataItem, "firstname") %>
                    <br />
                    birthdate: 
                    <%# DataBinder.Eval(Container.DataItem, "birthdate") %>
                    <br />
                </ItemTemplate>
                <ItemSeparatorTemplate>
                    <p>------------</p>
                </ItemSeparatorTemplate>
            </asp:ListView>
        </div>
        <br />

        <hr />
        <h2>ListView控制項 啟用自動設定</h2>
        <ul>
            <li>可能要重新整理資料結構描述，才會有ListView設定選項</li>
            <li>設定ListView- 勾選啟用分頁</li>
            <li>勾選啟用動態資料，用DynamicControl控制項</li>
            <li>內建的分頁功能其實也是(自動)設定DataPager</li>
        </ul>

        <div id="ListView4Page">
            <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="EmployeeID">
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">EmployeeID</th>
                                        <th runat="server">firstname</th>
                                        <th runat="server">lastname</th>
                                        <th runat="server">country</th>
                                        <th runat="server">city</th>
                                        <th runat="server">homephone</th>
                                        <th runat="server">birthdate</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("Photo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("Notes") %>' />
                        </td>

                        <td>
                            <asp:Label ID="birthdateLabel" runat="server" Text='<%# Eval("birthdate") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                        <td>
                            <asp:Label ID="EmployeeIDLabel1" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="firstnameTextBox" runat="server" Text='<%# Bind("firstname") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="lastnameTextBox" runat="server" Text='<%# Bind("lastname") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("Photo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                        </td>

                        <td>
                            <asp:TextBox ID="birthdateTextBox" runat="server" Text='<%# Bind("birthdate") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未傳回資料。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                        <td>
                            <asp:TextBox ID="EmployeeIDTextBox" runat="server" Text='<%# Bind("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="firstnameTextBox" runat="server" Text='<%# Bind("firstname") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="lastnameTextBox" runat="server" Text='<%# Bind("lastname") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("Photo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                        </td>

                        <td>
                            <asp:TextBox ID="birthdateTextBox" runat="server" Text='<%# Bind("birthdate") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("Photo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("Notes") %>' />
                        </td>

                        <td>
                            <asp:Label ID="birthdateLabel" runat="server" Text='<%# Eval("birthdate") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("Photo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("Notes") %>' />
                        </td>

                        <td>
                            <asp:Label ID="birthdateLabel" runat="server" Text='<%# Eval("birthdate") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>

        <br />
    </form>
</body>
</html>
