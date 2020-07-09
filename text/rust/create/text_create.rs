// --------------------------------------------------------------------
/*
	text_create.rs

						Jun/09/2020
*/
// --------------------------------------------------------------------
use std::env;
use std::fs::File;
use std::collections::HashMap;
use std::io::{Write};
// --------------------------------------------------------------------
fn unit_prepare_proc (name:&'static str,population:&'static str,date_mod:&'static str)
  -> HashMap<&'static str, &'static str>
{

	let mut unit_aa:HashMap<&str, &str> = HashMap::new();
	unit_aa.insert("name",name);
	unit_aa.insert("population",population);
	unit_aa.insert("date_mod",date_mod);

	return	unit_aa;
}

// --------------------------------------------------------------------
fn unit_to_string_proc (key:&'static str,unit_aa:HashMap <&str, &str>)
  ->  String {
	let str_out = key.to_string () + "\t" + unit_aa["name"]
	+ "\t" + unit_aa["population"] + "\t" + unit_aa["date_mod"] + "\n";

	return	str_out;
}

// --------------------------------------------------------------------
fn main() -> std::io::Result<()>  {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_out = args[1];

	let mut file = File::create(fname_out)?;


	let mut unit_aa = unit_prepare_proc ("名古屋","39815","1956-3-25");
	let mut str_out = unit_to_string_proc ("t2381",unit_aa);
	file.write_all (String::from(str_out).as_bytes())?;

	unit_aa = unit_prepare_proc ("豊橋","19268","1956-7-10");
	str_out = unit_to_string_proc ("t2382",unit_aa);
	file.write_all (String::from(str_out).as_bytes())?;

	unit_aa = unit_prepare_proc ("岡崎","42853","1956-9-21");
	str_out = unit_to_string_proc ("t2383",unit_aa);
	file.write_all (String::from(str_out).as_bytes())?;


	file.write_all(String::from("t2384\t一宮\t31864\t1950-6-22\n").as_bytes())?;
	file.write_all(String::from("t2385\t蒲郡\t49158\t1950-8-14\n").as_bytes())?;

	file.write_all(String::from("t2386\t常滑\t21789\t1956-8-7\n").as_bytes())?;
	file.write_all(String::from("t2387\t大府\t42193\t1956-4-21\n").as_bytes())?;
	file.write_all(String::from("t2388\t瀬戸\t54287\t1956-8-12\n").as_bytes())?;
	file.write_all(String::from("t2389\t犬山\t79526\t1956-10-28\n").as_bytes())?;

	println!("*** 終了 ***");

	Ok(())
}

// --------------------------------------------------------------------
