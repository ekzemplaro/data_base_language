// --------------------------------------------------------------------
/*
	text_create.rs

						Mar/06/2015
*/
// --------------------------------------------------------------------
use std::env;
use std::old_io::File;

// --------------------------------------------------------------------
fn main() {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_out = args[1];

	let mut file = File::create(&Path::new(fname_out));

	file.write_line("t2381\t名古屋\t51349\t1956-3-25");
	file.write_line("t2382\t豊橋\t49217\t1956-7-27");
	file.write_line("t2383	岡崎	91674	1956-2-8");
	file.write_line("t2384	一宮	17845	1956-1-15");
	file.write_line("t2385	蒲郡	87463	1956-5-24");
	file.write_line("t2386	常滑	21789	1956-8-7");
	file.write_line("t2387	大府	42193	1956-4-21");
	file.write_line("t2388	瀬戸	54287	1956-8-12");
	file.write_line("t2389	犬山	79526	1956-10-28");

	println!("*** 終了 ***");
}

// --------------------------------------------------------------------
