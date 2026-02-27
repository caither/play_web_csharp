<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U5_1_Styling.aspx.cs" Inherits="ControlProp1.Properties" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <h1>控制項共通屬性</h1>

        <h2>AccessKey屬性</h2>
        <p>設定鍵盤快速鍵(Alt+key)，可用於IE、Edge、Chrome。FireFox不支援。</p>
        <p>html-property accesskey="1"</p>
        <div id="AccessKey">
            <asp:CheckBox ID="CheckBox1" runat="server" Text="請按 Alt+1" AccessKey="1" /><br />
            <asp:CheckBox ID="CheckBox2" runat="server" Text="請按 Alt+a" AccessKey="a" /><br />
            <asp:Button ID="AccessKeyButton" runat="server" Text="請按 Alt+3" AccessKey="3" OnClick="AccessKeyButton_Click" /><br />
        </div>
        <br />

        <h2>BackColor、ForeColor屬性</h2>
        <p>html-property style="color:BlueViolet;background-color:LawnGreen;"</p>
        <div id="BackColor">
            <asp:TextBox ID="TextBoxBG" runat="server" BackColor="#ff9999" Text="背景#ff9999"></asp:TextBox><br />
            <asp:TextBox ID="TextBoxFBG" runat="server" ForeColor="BlueViolet" BackColor="LawnGreen" Text="前景紫藍、背景草綠"></asp:TextBox><br />
        </div>
        <br />


        <h2>Enable屬性</h2>
        <p>html-property disabled="disabled"</p>
        <div id="Enable">
            <asp:Button ID="Button1" Enabled="true" runat="server" Text="Disabled Button" AccessKey="4" OnClick="AccessKeyButton_Click" /><br />
        </div>
        <br />

        <h2>Visable屬性</h2>
        <p>設成false時，該html tag 會消失</p>
        <div id="Visable">
            <asp:TextBox ID="TextBox1" Visible="false" runat="server" BackColor="#66ffcc" Text="背景#66ffcc"></asp:TextBox><br />
        </div>
        <br />

        <h2>TabIndex屬性</h2>
        <p>預設tabindex="0" </p>
        <p>html-property tabindex="1"</p>
        <div id="TabIndex">
            <asp:Button ID="Button2" runat="server" Text="試試Tab3" TabIndex="3" /><br />
            <asp:TextBox ID="TextBox2" runat="server" Text="試試Tab2" TabIndex="2"></asp:TextBox><br />
            <asp:TextBox ID="TextBox3" runat="server" Text="試試Tab1" TabIndex="1"></asp:TextBox><br />
        </div>
        <br />
        <hr />

        <h2>Font系列屬性</h2>
        <div id="">
            <p>html-property style="font-family:標楷體;font-style:italic;"</p>
            <p>
                <asp:Label ID="LabelItalic" runat="server" Text="－＞　Font-Italic + 標楷體" Font-Names="標楷體" Font-Italic="true"></asp:Label>
            </p>
            <p>html-property style="font-size:24pt;"</p>
            <p>
                <asp:Label ID="LabelSize" runat="server" Text="－＞　Font-Size 24" Font-Size="24"></asp:Label>
            </p>
            <p>html-property style="font-size:Larger;text-decoration: overline;"</p>
            <p>
                <asp:Label ID="LabelOverline" runat="server" Text="－＞　Font-Size Larger + Font-Overline" Font-Overline="true" Font-Size="Larger"></asp:Label>
            </p>
            <p>html-property style="font-size:Large;text-decoration: line-through;"</p>
            <p>
                <asp:Label ID="LabelStrikeout" runat="server" Text="－＞　Font-Size Large + Font-Strikeout" Font-Strikeout="true" Font-Size="Large"></asp:Label>
            </p>
            <p>html-property style="font-weight:bold;text-decoration:underline;"</p>
            <p>
                <asp:Label ID="LabelBold" runat="server" Text="－＞　Font-Bold + Font-Underline" Font-Bold="true" Font-Underline="true"></asp:Label>
            </p>
        </div>
        <br />
        <hr />

        <h2>BorderColor屬性</h2>
        <p>html-property style="border-color:Blue;"</p>
        <div id="BorderColor">
            <asp:TextBox ID="TBBorderColor" runat="server" Text="邊框大小為 8" BorderColor="Blue"></asp:TextBox><br />
            <br />
        </div>
        <br />

        <h2>BorderWidth屬性</h2>
        <p>html-property style="background-color:Wheat;border-width:8px;border-style:solid;"</p>
        <div id="BorderWidth">
            <asp:TextBox ID="TBBorderWidth" runat="server" BackColor="Wheat" Text="邊框大小為 8" BorderWidth="8"></asp:TextBox><br />
            <br />
        </div>
        <br />

        <hr />
        <h2>BorderStyle系列屬性</h2>
        <p>html-property style="display:inline-block;border-style:Double;"</p>
        <div id="BorderStyle">
            <p>
                <asp:Label ID="BSDouble" runat="server" Text="－＞　BorderStyle Double" BorderStyle="Double"></asp:Label>
            </p>
            <p>
                <asp:Label ID="BSGroove" runat="server" Text="－＞　BorderStyle Groove" BorderStyle="Groove"></asp:Label>
            </p>
            <p>
                <asp:Label ID="BSRidge" runat="server" Text="－＞　BorderStyle Ridge" BorderStyle="Ridge"></asp:Label>
            </p>
            <p>
                <asp:Label ID="BSOutset" runat="server" Text="－＞　BorderStyle Outset" BorderStyle="Outset"></asp:Label>
            </p>
            <p>
                <asp:Label ID="BSInset" runat="server" Text="－＞　BorderStyle Inset" BorderStyle="Inset"></asp:Label>
            </p>
        </div>
        <br />

        <hr />
        <h2>Width、Heigh屬性</h2>
        <p>html-property style="height:400px;width:500px;"</p>
        <div id="Heigh">
            <asp:Calendar ID="Calendar1" runat="server" Width="500" Height="400"></asp:Calendar>
            <br />
        </div>
        <br />

    </form>

    <div id="result">
        <asp:Label ID="Label1" runat="server" Text="Show Test Result"></asp:Label>
    </div>

</body>
</html>
