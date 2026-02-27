<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U0_FirstPage.aspx.cs" Inherits="WebFormBasics.U0_FirstPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Welcome to VS</h1>
    <br />
    <p>使用UI.WebControls控制項處裡Form Post</p>
    <br />
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:TextBox ID="TextBox1" runat="server">請輸入名字:</asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="顯示名字" OnClick="Button1_Click" />
            </div>
        </div>
        <p>
            <asp:Label ForeColor="Navy" ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
    </form>

</body>
</html>
