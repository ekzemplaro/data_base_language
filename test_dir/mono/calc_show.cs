/* -------------------------------------------------------------- */
/*	 asp/triangle/calc_show.cs

			Apr/13/2009
*/
/* -------------------------------------------------------------- */
using System;
using System.IO;
using System.Text;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

/* -------------------------------------------------------------- */
namespace	trt
{
/* -------------------------------------------------------------- */
public	class	calc_show
{
/* -------------------------------------------------------------- */
/* [8]: */
public	static string calc_show_proc (int xx_in,StreamWriter writer_log)
{
	int []nn_min_max = {1,xx_in};

	string	text_out = "";

	StringBuilder text_aa = new StringBuilder ("");
	ArrayList aax = calc04.calc_proc (nn_min_max);

	for (int it=0; it < aax.Count; it++)
		{
		Object oox = aax[it];
		int []vv = (int [])oox;	
		text_out = show_value (it,vv);

		writer_log.WriteLine (text_out);

		text_aa.Append (text_out);
		text_aa.Append ("¥n");
		}

	return	text_aa.ToString ();
}

/* -------------------------------------------------------------- */
/* [8-4]: */
static string show_value (int ikey,int [] vv)
{
	StringBuilder text_bb = new StringBuilder ("");

	string	str_out = ikey.ToString () + "¥t";

	text_bb.Append (str_out);

	for (int it=0; it < vv.Length; it++)
		{
		string	str_tmp = vv[it].ToString ();
		text_bb.Append (str_tmp);
		text_bb.Append (" ");
		}

	text_bb.Append ("¥t: ");

	double ratio = (double)vv[0] / (double)vv[1];

	text_bb.Append (ratio.ToString ());


	return	text_bb.ToString ();
}

/* -------------------------------------------------------------- */
}
/* -------------------------------------------------------------- */
}
/* -------------------------------------------------------------- */
