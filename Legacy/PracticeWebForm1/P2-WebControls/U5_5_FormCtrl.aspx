<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U5_5_FormCtrl.aspx.cs" Inherits="WebControls.U5_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<%--
    <hr />
    <h2>控制項</h2>
        <ul>
            <li></li>
        </ul>
        <p>html-property </p>
    <div id="">

        <br />
    </div><br />
--%>
<body>
    <form id="form1" runat="server">
        <h1>Form Controls</h1>

        <hr />
        <h2>RadioButton控制項</h2>
        <ul>
            <li></li>
        </ul>
        <p>html-property </p>
        <div id="RadioButton">
            <asp:RadioButton ID="RadioButton1" runat="server" />
            <br />
        </div>
        <br />

        <hr />
        <h2>CheckBox控制項</h2>
        <p></p>
        <div id="CheckBox">
            <asp:CheckBox ID="CheckBox1" runat="server" />
            <br />
        </div>
        <br />

        <hr />
        <h2>RadioButtonList控制項</h2>
        <p></p>
        <div id="RadioButtonList">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server"></asp:RadioButtonList>
            <br />
        </div>
        <br />

        <hr />
        <h2>CheckBoxList控制項</h2>
        <p></p>
        <div id="CheckBoxList">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
            <br />
        </div>
        <br />

        <hr />
        <h2>DropDownList控制項</h2>
        <p></p>
        <div id="DropDownList">
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <br />
        </div>
        <br />

        <hr />
        <h2>ListBox控制項</h2>
        <p></p>
        <div id="ListBox">
            <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
            <br />
        </div>
        <br />

    </form>
</body>
</html>
