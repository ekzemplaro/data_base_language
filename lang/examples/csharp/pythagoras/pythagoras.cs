// --------------------------------------------------------------
/*	 pythagoras.cs

			Jan/11/2011
*/
// --------------------------------------------------------------
using System;
using System.Collections.Generic;

// --------------------------------------------------------------
public class pythagoras
{
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	int nn_max = 50;

	List <int []> results = calc_proc (nn_max);

	Console.WriteLine ("Count = " + results.Count);

	for (int it=0; it< results.Count; it++)
		{
		int [] vv = new int[3];
		vv = (int [])results[it];
		Console.WriteLine (vv[0] + "\t" + vv[1] + "\t" + vv[2]);
		}

	Console.WriteLine ("*** 終了 ***");
}

// --------------------------------------------------------------
static List <int []> calc_proc (int nn_max)
{
	List <int []> aax = new List <int []> ();

	List <double> ratios = new List <double> ();

	int	xx_min = 1;

	int	nn=0;


	for (int it = xx_min ; it< nn_max; it++)
		{
		int xx2 = it * it;
		for (int jt=it+1; jt< nn_max; jt++)
			{
			int yy2 = jt * jt;
			int xxyy2 = xx2 + yy2;

			double	dz = Math.Sqrt ((double)xxyy2);

			int zz = (int)dz;

			int zz2 = zz * zz;

			if (xxyy2 == zz2)
				{
				nn = add_proc (nn,it,jt,zz,aax,ratios);
				}
			}
		}

	return	aax;
}

// --------------------------------------------------------------
static int add_proc (int nn,int it,int jt,int zz,
	List <int []> aax,List <double> ratios)
{
	int [] vv = new int[3];
	vv[0] = it;
	vv[1] = jt;
	vv[2] = zz;

	double	ratio = (double)it/ (double)jt;

	if (nn == 0)
		{
		aax.Add (vv);
		ratios.Add (ratio);
		nn++;
		}
	else if (! ratios.Contains (ratio))
		{
		aax.Add (vv);
		ratios.Add (ratio);
		nn++;
		}

	return	nn;
}

// --------------------------------------------------------------

}
// --------------------------------------------------------------
