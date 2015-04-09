<!-- triangle01.aspx -->
<%@ Page language="C#" Src="pythagorean01.aspx.cs" Inherits="trt.pythagorean01" %>
<%@ Import Namespace="trt" %>
<html>
<title>
pythagorean01.aspx Apr/01/2015
</title>
<body>
<h2>トライアングル</h2><p>

<form runat="server">
        <p>
<asp:Button id="Btn1" onclick="Button1_Click" runat="server" Text="Max 20">
</asp:Button>
<asp:Button id="Btn2" onclick="Button2_Click" runat="server" Text="Max 40">
</asp:Button>
<asp:Button id="Btn3" onclick="Button3_Click" runat="server" Text="Max 60">
</asp:Button><p>

<asp:Button id="Btn4" onclick="Button4_Click" runat="server" Text="Calc">
</asp:Button>
<asp:Button id="Btn5" onclick="Button5_Click" runat="server" Text="Clear">
</asp:Button>
<asp:Button id="Btn6" onclick="Button6_Click" runat="server" Text="Initialize">
</asp:Button>
<p>
<ol>
<asp:TextBox id="TextBox1" runat="server"></asp:TextBox>
<asp:TextBox id="TextBox2" runat="server"></asp:TextBox><p>
<asp:TextBox id="TextBox3" runat="server"></asp:TextBox><p>
<asp:TextBox id="TextBox4" runat="server" Columns="40" Rows ="15" TextMode = "MultiLine">
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
Apr/01/2015 AM 10:20<p>
</body>
</html>
