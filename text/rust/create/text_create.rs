// --------------------------------------------------------------------
/*
	text_create.rs

						Jul/11/2020
*/
// --------------------------------------------------------------------
use std::env;
use std::fs::File;
use std::collections::HashMap;
use std::io::{Write};
// --------------------------------------------------------------------
fn unit_prepare_proc (name:&'static str,population:&'static str,date_mod:&'static str)
  -> HashMap<String, String>
{

	let mut unit_aa:HashMap<String, String> = HashMap::new();
	unit_aa.insert("name".to_string(),name.to_string());
	unit_aa.insert("population".to_string(),population.to_string());
	unit_aa.insert("date_mod".to_string(),date_mod.to_string());

	return	unit_aa;
}

// --------------------------------------------------------------------
fn main() -> std::io::Result<()>  {
	println!("*** 開始 ***");

	let args: Vec<_> = env::args().collect();

	let ref fname_out = args[1];

	let mut file = File::create(fname_out)?;

	let mut dict_aa:HashMap<String,&HashMap<String,String>> = HashMap::new();

	let unit_aa = unit_prepare_proc ("名古屋","37819","1956-10-21");
	dict_aa.insert("t2381".to_string(),&unit_aa);

	let unit_bb = unit_prepare_proc ("豊橋","19268","1956-7-10");
	dict_aa.insert("t2382".to_string(),&unit_bb);

	let unit_cc = unit_prepare_proc ("岡崎","42853","1956-9-21");
	dict_aa.insert("t2383".to_string(),&unit_cc);

	let unit_dd = unit_prepare_proc ("一宮","37621","1956-6-14");
	dict_aa.insert("t2384".to_string(),&unit_dd);

	let unit_ee = unit_prepare_proc ("蒲郡","69258","1956-3-7");
	dict_aa.insert("t2385".to_string(),&unit_ee);

	let unit_ff = unit_prepare_proc ("常滑","27518","1956-11-4");
	dict_aa.insert("t2386".to_string(),&unit_ff);

	let unit_gg = unit_prepare_proc ("大府","42193","1956-4-22");
	dict_aa.insert("t2387".to_string(),&unit_gg);

	let unit_hh = unit_prepare_proc ("瀬戸","72985","1956-6-28");
	dict_aa.insert("t2388".to_string(),&unit_hh);

	let unit_ii = unit_prepare_proc ("犬山","25168","1956-5-7");
	dict_aa.insert("t2389".to_string(),&unit_ii);

	for (key,value) in &dict_aa {
		let str_out = key.to_string () + "\t" + &value["name"]
			+ "\t" + &value["population"]
			+ "\t" + &value["date_mod"] + "\n";
		print!("{}", str_out);
		file.write_all (String::from(str_out).as_bytes())?;
	}

	println!("*** 終了 ***");

	Ok(())
}

// --------------------------------------------------------------------
