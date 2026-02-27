<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U4_TryCatch.aspx.cs" Inherits="Webf3.TryCatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>輸入範圍是正負號的 16 位元整數 (-32,768 到 32,767)</h3>
            <asp:TextBox ID="TextBoxA" runat="server" Text="32767"></asp:TextBox>
            +
            <asp:TextBox ID="TextBoxB" runat="server"></asp:TextBox>
            <asp:Button ID="ButtonAdd" runat="server" Text="相加" OnClick="ButtonAdd_Click" />
            <br />
        </div>
        <p>
            結果： 
            <asp:Label ID="ResultLabel" runat="server" Text="Result..."></asp:Label>
        </p>
    </form>
</body>
</html>
