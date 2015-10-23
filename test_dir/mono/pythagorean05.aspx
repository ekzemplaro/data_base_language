<!-- pythagorean05.aspx -->
<%@ Page Language="C#" CodeFile="pythagorean05.aspx.cs" 
    Inherits="trt.pythagorean05" AutoEventWireup="true" %>
<html>
<title>
pythagorean05.aspx Apr/13/2009
</title>
<body>
<h2>ピタゴラス数</h2>

pythagorean05<p>
<form runat="server">
        <p>
<asp:Button id="Btn1" onclick="Button1_Click" runat="server" Text="40">
</asp:Button>
<asp:Button id="Btn2" onclick="Button2_Click" runat="server" Text="60">
</asp:Button>
<asp:Button id="Btn3" onclick="Button3_Click" runat="server" Text="80">
</asp:Button>
<asp:Button id="Btn4" onclick="Button4_Click" runat="server" Text="100">
</asp:Button>
<asp:Button id="Btn5" onclick="Button5_Click" runat="server" Text="120">
</asp:Button>
<asp:Button id="Btn6" onclick="Button6_Click" runat="server" Text="160">
</asp:Button><p>

<asp:Button id="Btn7" onclick="Button7_Click" runat="server" Text="Initialize">
</asp:Button>
<p>
<ol>
<asp:TextBox id="TextBox1" runat="server"></asp:TextBox>
<asp:TextBox id="TextBox2" runat="server"></asp:TextBox><p>
<asp:TextBox id="TextBox4" runat="server" Columns="60" Rows ="15" TextMode = "MultiLine">
</asp:TextBox><p>
<asp:TextBox id="TextBox5" runat="server" Columns="40" Rows ="5" TextMode = "MultiLine">
</asp:TextBox><p>
</ol>

<ol>
<asp:Label id="Lb1" runat="server">Label_A</asp:Label>
<asp:Label id="Lb2" runat="server">Label_B</asp:Label>
<asp:Label id="Lb3" runat="server">Label_C</asp:Label>
</ol>

</form>
<hr>
<a href="../asp.html">Return</a><p>
<hr>
Apr/13/2009 AM 09:15<p>
</body>
</html>
