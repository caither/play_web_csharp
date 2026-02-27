<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U6_AdvCtrl.aspx.cs" Inherits="WebControls.U6_1_TableCtrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<%--                
    <hr />
    <h2>控制項</h2>
        <p> </p>
    <div id="">

        <br />
    </div><br />
--%>
<body>
    <form id="form1" runat="server">
        <h1>Table Controls</h1>

        <hr />
        <h2>Table控制項</h2>
        <h3>TableRow </h3>
        <ul>
            <li>TableCell</li>
        </ul>
        <div id="Table">
            <asp:Table ID="Table1" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>編號</asp:TableHeaderCell>
                    <asp:TableHeaderCell>說明</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>1001</asp:TableCell>
                    <asp:TableCell>海邊</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>1002</asp:TableCell>
                    <asp:TableCell>模型</asp:TableCell>
                </asp:TableRow>
                <asp:TableFooterRow>
                    <asp:TableCell>fff</asp:TableCell>
                    <asp:TableCell>底</asp:TableCell>
                </asp:TableFooterRow>
            </asp:Table>
            <br />
        </div>
        <br />
        <hr />

        <h1>Validator Controls</h1>
        <h2>ControlToValidate:</h2>
        <asp:TextBox ID="ValidateTB" runat="server" Text="ValidateTB"></asp:TextBox>
        <hr />
        <h2>RequiredFieldValidator控制項</h2>
        <p></p>
        <div id="RequiredFieldValidator">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ValidateTB" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <br />
        </div>
        <br />

        <hr />
        <h2>RangeValidator控制項</h2>
        <p></p>
        <div id="RangeValidator">
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ValidateTB" ErrorMessage="RangeValidator"></asp:RangeValidator>
            <br />
        </div>
        <br />

        <hr />
        <h2>CompareValidator控制項</h2>
        <p></p>
        <div id="CompareValidator">
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ValidateTB" ErrorMessage="CompareValidator"></asp:CompareValidator>
            <br />
        </div>
        <br />

        <hr />
        <h2>RegularExpressionValidator控制項</h2>
        <p></p>
        <div id="RegularExpressionValidator">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ValidateTB" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
            <br />
        </div>
        <br />

        <hr />
        <h2>ValidationSummary控制項</h2>
        <p></p>
        <div id="ValidationSummary">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <br />
        </div>
        <br />
        <hr />

        <h1>Calendar Controls</h1>
        <hr />
        <h2>Calendar控制項</h2>
        <p></p>
        <div id="Calendar">
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
        </div>
        <br />
        <hr />

        <h1>File Upload Controls</h1>
        <hr />
        <h2>FileUpload控制項</h2>
        <p></p>
        <div id="FileUpload">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
        </div>
        <br />

    </form>
</body>
</html>
