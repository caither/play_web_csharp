<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U2_1a_Redirect.aspx.cs" Inherits="Webf2.Rsource" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <h1>發送GET</h1>
    <p>網頁1a發送(Http GET) 1a_naming參數給自己，然後轉發給網頁1b</p>
    <form id="Form_GET" name="Form_GET" method="get" runat="server">
        <input type="text" id="text_id_get" name="1a_naming" /><br />
        <input type="submit" value="go-get" /><br />
    </form>
    <p>aspx檔名不能有兩個(含)以上的運算符號(+、-...)，否則IIS會發出雙重溢出字元錯誤</p>
</body>
</html>
