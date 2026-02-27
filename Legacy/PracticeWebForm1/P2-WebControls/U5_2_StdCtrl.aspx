<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U5_2_StdCtrl.aspx.cs" Inherits="ControlProp1.StdControl1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <h2>Image控制項</h2>
        <ul>
            <li>預設ImageAlign="Button"</li>
            <li>html: img id="Image1" src="....jpg" align="middle"</li>
        </ul>
        <div id="Image">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/http_status_cat/200.jpg" ImageAlign="Middle" />
            文字原本在圖片之後<br />
        </div>
        <br />

        <hr />
        <h2>HyperLink控制項</h2>

        <div id="HyperLink">
            <p>就是產生 html a 元素</p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://services.daf10pas.local/" Target="_blank">連結文字在這裡1</asp:HyperLink><br />
            <br />
            <p>可以有 ImageUrl屬性</p>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://services.daf10pas.local/" ImageUrl="~/Content/http_status_cat/201.jpg">自動變成alt文字</asp:HyperLink><br />
        </div>
        <br />

        <hr />
        <h2>LinkButton控制項</h2>
        <ul>
            <li>html: &lt;a id="LinkButton1" href="javascript:__doPostBack('LinkButton1','')"&gt; ... &lt;/a&gt; </li>
            <li>用法跟Button完全一樣</li>
        </ul>
        <div id="LinkButton">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton只是文字型態的Button</asp:LinkButton><br />
        </div>
        <br />

        <hr />
        <h2>ImageButton控制項</h2>
        <ul>
            <li>html: input name="ImageButton1" id="ImageButton1" src="Content/http_status_cat/202.jpg" type="image"</li>
        </ul>
        <br />
        <div id="ImageButton">
            <asp:Label runat="server" ID="LabelImageButton" Text="點擊圖片顯示座標"></asp:Label>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Content/http_status_cat/202.jpg" OnClick="ImageButton1_Click" />
            <br />
        </div>
        <br />

    </form>
</body>
</html>
