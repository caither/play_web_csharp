<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U5_4_TextBox.aspx.cs" Inherits="WebControls.U5_4_TableCtrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>表單控制項</h1>
        <hr />
        <h2>TextBox控制項</h2>
        <ul>
            <li>都支援AutoPostBack + OnTexChanged</li>
        </ul>
        <div id="TextBox">
            <h4>預設(SingleLine)</h4>
            <p>input type="text"</p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />

            <h4>MultiLine</h4>
            <p>textarea rows="2" cols="20"</p>
            <p>可搭配設定Wrap、Rows、Columns</p>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />

            <h4>Email</h4>
            <p>input type="email"</p>
            <asp:TextBox ID="TextBox7" runat="server" TextMode="Email"></asp:TextBox>
            <br />

            <h4>Password</h4>
            <p>input type="password"</p>
            <asp:TextBox ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox>
            <br />

            <h4>Number</h4>
            <p>input type="number"</p>
            <asp:TextBox ID="TextBox9" runat="server" TextMode="Number"></asp:TextBox>
            <br />

            <h4>Range</h4>
            <p>input type="range"</p>
            <asp:TextBox ID="TextBox11" runat="server" TextMode="Range"></asp:TextBox>
            <br />

            <h3>以下IE11 desktop看不出效果</h3>
            <h4>Color</h4>
            <p>input type="color"</p>
            <asp:TextBox ID="TextBoxColor" runat="server" TextMode="Color"></asp:TextBox>
            <br />

            <h4>Url</h4>
            <p>input type="url"</p>
            <asp:TextBox ID="TextBox13" runat="server" TextMode="Url"></asp:TextBox>
            <br />

            <h4>Search</h4>
            <p>input type="search"</p>
            <p>處控式鍵盤Enter變成Search</p>
            <p>Chrome desktop比預設textbox多一個清除的按鈕</p>
            <asp:TextBox ID="TextBox12" runat="server" TextMode="Search"></asp:TextBox>
            <br />

            <h3>---以下在Firefox看不出效果---</h3>
            <h4>Phone</h4>
            <p>input type="tel"</p>
            <asp:TextBox ID="TextBoxPhone" runat="server" TextMode="Phone"></asp:TextBox>
            <br />

            <h4>Date</h4>
            <p>input type="date"</p>
            <asp:TextBox ID="TBDate" runat="server" TextMode="Date"></asp:TextBox>
            <br />

            <p>DateTime (Chrome不支援)</p>
            <asp:TextBox ID="TBDateTime" runat="server" TextMode="DateTime"></asp:TextBox>
            <br />

            <h4>DateTimeLocal</h4>
            <p>input type="datetime-local"</p>
            <asp:TextBox ID="TBDateTimeLocal" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <br />

            <h4>Time</h4>
            <p>input type="time"</p>
            <asp:TextBox ID="TBTime" runat="server" TextMode="Time"></asp:TextBox>
            <br />

            <h4>Week</h4>
            <asp:TextBox ID="TBWeek" runat="server" TextMode="Week"></asp:TextBox>
            <br />

            <h4>Month</h4>
            <asp:TextBox ID="TBMonth" runat="server" TextMode="Month"></asp:TextBox>
            <br />

        </div>
        <br />


    </form>
</body>
</html>
