/* -------------------------------------------------------------- */
/*	 pythagorean01.aspx.cs

			Apr/01/2015
*/
/* -------------------------------------------------------------- */

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

/* -------------------------------------------------------------- */
namespace	trt
{
/* -------------------------------------------------------------- */
public class pythagorean01 : Page
{
	public TextBox TextBox1;
	public TextBox TextBox2;
	public TextBox TextBox3;
	public TextBox TextBox4;
	public TextBox TextBox5;

	public Label Lb1;
	public Label Lb2;
	public Label Lb3;

/* -------------------------------------------------------------- */
public void Button1_Click	(object sender, EventArgs ev)
{
	int	xx = 20;

	string	str_xx = xx.ToString ();
	Lb2.Text = str_xx;
	TextBox2.Text = str_xx;
}

/* -------------------------------------------------------------- */
int []  get_input ()
{
	int [] vv = new int[2];

	if (TextBox1.Text.Length == 0)
		{
		vv[0] = 0;
		}
	else
		{
		vv[0] = int.Parse (TextBox1.Text);
		}

	if (TextBox2.Text.Length == 0)
		{
		vv[1] = 0;
		}
	else
		{
		vv[1] = int.Parse (TextBox2.Text);
		}

	return	vv;
}

/* -------------------------------------------------------------- */
void show_value (int [] vv)
{

	string[] str_vv = new string[3];

	string str_out = "";
	for (int it=0; it < vv.Length; it++)
		{
		str_vv[it] = vv[it].ToString ();
		str_out = str_out + str_vv[it] + " ";
		}


//	TextBox4.Text = TextBox4.Text + str_out + "¥n";
	TextBox4.Text = TextBox4.Text + str_out + "<br />";
}

/* -------------------------------------------------------------- */
public void Button2_Click	(object sender, EventArgs ev)
{
	int	xx = 40;

	string	str_xx = xx.ToString ();
	Lb2.Text = str_xx;
	TextBox2.Text = str_xx;
}

/* -------------------------------------------------------------- */
public void Button3_Click	(object sender, EventArgs ev)
{
	int	xx = 60;

	string	str_xx = xx.ToString ();
	Lb2.Text = str_xx;
	TextBox2.Text = str_xx;
}

/* -------------------------------------------------------------- */
public void Button4_Click	(object sender, EventArgs ev)
{
	int [] nn_min_max =  get_input ();

	int [] vv = new int[3];

	int	xx_min = 1;

	if (xx_min < nn_min_max[0])
		{
		xx_min = nn_min_max[0];
		}

	for (int it = xx_min ; it< nn_min_max[1]; it++)
		{
		int xx2 = it * it;
		for (int jt=it+1; jt< nn_min_max[1]; jt++)
			{
			int yy2 = jt * jt;
			int xxyy2 = xx2 + yy2;

			double	dz = Math.Sqrt ((double)xxyy2);

			int zz = (int)dz;

			int zz2 = zz * zz;

			if (xxyy2 == zz2)
				{
			vv[0] = it;
			vv[1] = jt;
			vv[2] = zz;
			show_value (vv);
				}
			}
		}
}

/* -------------------------------------------------------------- */
public void Button5_Click	(object sender, EventArgs ev)
{
	TextBox1.Text = "";
	TextBox2.Text = "";
	TextBox3.Text = "";
	TextBox5.Text = TextBox5.Text + " C ABCDEFG *** ";
	Lb1.Text = "";
	Lb2.Text = "";
	Lb3.Text = "";
}
/* -------------------------------------------------------------- */
public void Button6_Click	(object sender, EventArgs ev)
{
	TextBox1.Text = "";
	TextBox2.Text = "";
	TextBox3.Text = "";
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
