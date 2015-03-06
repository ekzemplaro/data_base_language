// ----------------------------------------------------------------
//
//	mcached_create.go
//
//					Feb/11/2015
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]string) {
	dict_aa := make (map[string](map[string]string))

	dict_aa["t1521"] = unit_gen_proc ("新潟","83942","1921-7-14")
	dict_aa["t1522"] = unit_gen_proc ("長岡","67321","1921-6-27")
	dict_aa["t1523"] = unit_gen_proc ("新発田","61597","1921-7-5")
	dict_aa["t1524"] = unit_gen_proc ("上越","72918","1921-10-20")
	dict_aa["t1525"] = unit_gen_proc ("糸魚川","67419","1921-6-24")
	dict_aa["t1526"] = unit_gen_proc ("加茂","31542","1921-1-10")
	dict_aa["t1527"] = unit_gen_proc ("三条","42817","1921-9-19")
	dict_aa["t1528"] = unit_gen_proc ("佐渡","75231","1921-12-28")
	dict_aa["t1529"] = unit_gen_proc ("柏崎","26978","1921-5-14")
	dict_aa["t1530"] = unit_gen_proc ("村上","82691","1921-9-7")
	dict_aa["t1531"] = unit_gen_proc ("十日町","67291","1921-2-12")
	dict_aa["t1532"] = unit_gen_proc ("五泉","95381","1921-8-25")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	hostname := "host_ubuntu1"
	port := 21201

	dict_to_mcached_proc (hostname,port,dict_aa)

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
