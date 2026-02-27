<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U4_PageTrace.aspx.cs" Inherits="Webf3.PageTrace" Trace="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="The description of my page" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>頁首宣告加入 Trace="true" 在exception時輸出追蹤資訊</h2>
            <p>輸入true或false才不會發生錯誤</p>
            <asp:TextBox ID="BoolBox" runat="server" Text="raiser~"></asp:TextBox><br />
            <asp:Button ID="BoolButton" runat="server" Text="raise" OnClick="BoolButton_Click" /><br />
            <hr />
            <br />

        </div>
    </form>
</body>
</html>
