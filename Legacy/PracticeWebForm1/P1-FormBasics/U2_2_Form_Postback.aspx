<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U2_2_Form_Postback.aspx.cs" Inherits="Webevent1.UWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>

<body>
    表單預設使用POST method 
    <br />
    因為有POSTBACK機制，會自動保留輸入欄位
    <br />
    <form id="form1" runat="server">
        <div>
            <input id="Text1" type="text" placeholder="試試看輸入空值與重新整理" runat="server" />
            <input id="BtnSubmit1" type="submit" value="submit" runat="server" />
        </div>
        <div>
            <input id="Message" type="text" style="width: 500px" runat="server" />
        </div>
    </form>
</body>
</html>
