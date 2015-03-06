// --------------------------------------------------------------------
/*
	text_read.rs

						Mar/04/2015
*/
// --------------------------------------------------------------------
use std::env;
use std::old_io::File;
use std::old_io::BufferedReader;
// --------------------------------------------------------------------
fn main () {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_in = args[1];

	println! ("{}",fname_in);

	let path = Path::new(fname_in);
	let mut file = BufferedReader::new(File::open(&path));
	for line in file.lines() {
		print!("{}", line.unwrap());
	}

	println!("*** 終了 ***");
}

// --------------------------------------------------------------------
