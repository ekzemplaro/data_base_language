// ----------------------------------------------------------------
//
//	csv_create.go
//
//					May/20/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]interface{}) {
	dict_aa := make (map[string](map[string]interface{}))

	dict_aa["t1271"] = unit_gen_proc ("千葉",81236,"1921-7-19")
	dict_aa["t1272"] = unit_gen_proc ("勝浦",49561,"1921-9-20")
	dict_aa["t1273"] = unit_gen_proc ("市原",62397,"1921-3-14")
	dict_aa["t1274"] = unit_gen_proc ("流山",76128,"1921-2-31")
	dict_aa["t1275"] = unit_gen_proc ("八千代",61459,"1921-6-24")
	dict_aa["t1276"] = unit_gen_proc ("我孫子",86123,"1921-1-10")
	dict_aa["t1277"] = unit_gen_proc ("鴨川",42937,"1921-4-19")
	dict_aa["t1278"] = unit_gen_proc ("銚子",78231,"1921-9-28")
	dict_aa["t1279"] = unit_gen_proc ("市川",25978,"1921-5-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main () {

	fmt.Printf ("*** 開始 ***\n")

	file_csv := os.Args[1]

	dict_aa := data_prepare_proc ()

	csv_write_proc (file_csv,dict_aa)

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
