/* -------------------------------------------------------------- */
/*	 pythagorean05.aspx.cs

			Apr/13/2009
*/
/* -------------------------------------------------------------- */
using System;
using System.IO;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace	trt
{
/* -------------------------------------------------------------- */
public partial class pythagorean05 : Page
{
/* -------------------------------------------------------------- */
public void Button1_Click	(object sender, EventArgs ev)
{
	proc01	(Btn1.Text);
}

/* -------------------------------------------------------------- */
public void Button2_Click	(object sender, EventArgs ev)
{
	proc01	(Btn2.Text);
}

/* -------------------------------------------------------------- */
public void Button3_Click	(object sender, EventArgs ev)
{
	proc01	(Btn3.Text);
}

/* -------------------------------------------------------------- */
public void Button4_Click	(object sender, EventArgs ev)
{
	proc01	(Btn4.Text);
}

/* -------------------------------------------------------------- */
public void Button5_Click	(object sender, EventArgs ev)
{
	proc01	(Btn5.Text);
}

/* -------------------------------------------------------------- */
public void Button6_Click	(object sender, EventArgs ev)
{
	proc01	(Btn6.Text);
}

/* -------------------------------------------------------------- */
void proc01 (string str_xx)
{
	StreamWriter	writer_log = 
		new StreamWriter (@"c:¥Temp¥asp_test¥tmp01.txt");

	writer_log.WriteLine ("*** Button_Click ***");
	writer_log.WriteLine ("str_xx = " + str_xx);

	int	xx = int.Parse (str_xx);

	Lb2.Text = str_xx;
	TextBox2.Text = str_xx;

	TextBox4.Text = calc_show.calc_show_proc (xx,writer_log);

	writer_log.WriteLine ("*** Button_Click *** end ***");
	writer_log.Close ();
}

/* -------------------------------------------------------------- */
public void Button7_Click	(object sender, EventArgs ev)
{
	TextBox1.Text = "";
	TextBox2.Text = "";
	TextBox4.Text = "";
	TextBox5.Text = "";
	Lb1.Text = "";
	Lb2.Text = "";
	Lb3.Text = "";
}

/* -------------------------------------------------------------- */
}
/* -------------------------------------------------------------- */
}
/* -------------------------------------------------------------- */
