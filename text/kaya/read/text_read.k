// -----------------------------------------------------------------
/*
	text_read.k

					Jan/28/2011
*/
// -----------------------------------------------------------------
program text_read;


import System;
import IO;

// -----------------------------------------------------------------
Void main() {
    
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	args = getArgs ();

	file_in = args[1];

	putStrLn (file_in);

	fp_in = open (file_in,[Read]);

	while (!eof (fp_in))
		{
		line = get (fp_in);
		putStr (line);
		}

	close (fp_in);

	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
