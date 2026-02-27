<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U1_POST.aspx.cs" Inherits="Webf1.Hello" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <%--Label內的Text屬性會被code behind訊息覆蓋--%>
    <asp:Label ID="Label1" runat="server" Text="Hello"></asp:Label><br />
    <span id="span_norm">一般的span</span><br />
    <%--由於控制項(runat server)會加入aspx.design.cs，ID請按照cs變數命名規則(e.g.不能用-號)--%>
    <span id="span_serv" runat="server"></span>
    <br />

    <%--一網頁中只可以有一個伺服器端 Form 標記， 以下兩個form請擇一反註解測試 --%>
    <form id="Form_POST" name="Form_POST" method="post" runat="server">
        <input type="text" id="text_id_post" name="text_name" /><br />
        <input type="submit" value="go-post" /><br />
    </form>
    <br />
    <%-- 
    <form id="Form_GET" name="Form_GET" method="get" runat="server">
        <input type="text" id="text_id_get" name="text_name" /><br />
        <input type="submit" value="go-get" /><br />
    </form>
    --%>
</body>
</html>
