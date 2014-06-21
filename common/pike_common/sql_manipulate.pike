// ----------------------------------------------------------------
//	sql_manipulate.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
void show_rows_proc (object res)
{
	while (1)
		{
		array row_aa = res.fetch_row ();

		if (row_aa == 0)
			break;

		write (row_aa[0] + "\t");
		write (string_to_utf8 (row_aa[1]) + "\t");
		write (row_aa[2] + "\t");
		write (row_aa[3] + "\n");
 		} 
}

// ----------------------------------------------------------------
void show_rows_proc_mysql (object res)
{
	int nnx = res.num_rows ();

	for (int it=0; it < nnx; it=it+1)
		{
		array row_aa = res.fetch_row ();
		write (row_aa[0] + "\t");
		write (row_aa[1] + "\t");
		write (row_aa[2] + "\t");
		write (row_aa[3] + "\n");
 		} 
}

// ----------------------------------------------------------------
