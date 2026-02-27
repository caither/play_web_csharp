<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U3_EventSender.aspx.cs" Inherits="Webf3.SenderTest" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>

<body>
    <p>ASP.NET WebForms 的按鈕控制項在按下時會引發 Postback，將頁面送回伺服器。伺服器會在控制項及頁面生命週期中，觸發按鈕的 Click 事件給開發者處理。同時按鈕也可以定義客戶端（JavaScript）事件來在提交前做額外處理。</p>
    <br />
    <form id="form1" runat="server">
        <div>
            <asp:Button runat="server" ID="ButtonA" Text="按鈕 A" OnClick="BtnCom_Click" />
            <asp:Button runat="server" ID="ButtonB" Text="按鈕 B" OnClick="BtnCom_Click" />
            <br />
        </div>
    </form>
</body>
</html>
