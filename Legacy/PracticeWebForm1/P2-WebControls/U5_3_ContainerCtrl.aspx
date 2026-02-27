<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U5_3_ContainerCtrl.aspx.cs" Inherits="PracticeForm.ContainerCtrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <h1>Panel控制項與PlaceHolder控制項</h1>
        <p>兩者的功能完全相同，用於從code behind動態產生控制項</p>
        <!--PlaceHolder ID="ExplanPh"-->
        <asp:PlaceHolder ID="ExplanPh" runat="server">
            <p>差別主要在於：</p>
            <p>
                <asp:Label runat="server" Text="PlaceHolder在前端不會產生任何tag"></asp:Label>
            </p>
        </asp:PlaceHolder>

        <p>而Panel會產生一個div。請對照檢視本頁原始碼。</p>
        <!--Panel ID="EmptyPanel"-->
        <asp:Panel ID="EmptyPanel" runat="server"></asp:Panel>

        <h2>控制tag開關</h2>

        <!--Panel ID="InfoPanel"-->
        <asp:Panel ID="InfoPanel" runat="server">
            <!--RadioButtonList-->
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                <%--啟用AutoPostBack 不須submit--%>
                <asp:ListItem Text="顯示按鈕" Value="1" />
                <asp:ListItem Text="隱藏控制" Value="0" />
            </asp:RadioButtonList>

            <!--PlaceHolder ID="Ph1"-->
            <asp:PlaceHolder ID="Ph1" runat="server"></asp:PlaceHolder>
        </asp:Panel>
        <br />

        <!--Panel ID="CmdPanel"-->
        <asp:Panel ID="CmdPanel" runat="server">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="AddButton1" runat="server" Text="Add Text" OnClick="AddButton1_Click" />
        </asp:Panel>

    </form>
</body>
</html>
