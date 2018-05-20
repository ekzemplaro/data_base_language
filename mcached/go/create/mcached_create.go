// ----------------------------------------------------------------
//
//	mcached_create.go
//
//					May/20/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]interface{}) {
	dict_aa := make (map[string](map[string]interface{}))

	dict_aa["t1731"] = unit_gen_proc ("金沢",51852,"1921-2-24")
	dict_aa["t1732"] = unit_gen_proc ("輪島",49671,"1921-8-17")
	dict_aa["t1733"] = unit_gen_proc ("小松",61597,"1921-7-8")
	dict_aa["t1734"] = unit_gen_proc ("七尾",72918,"1921-10-30")
	dict_aa["t1735"] = unit_gen_proc ("珠洲",67429,"1921-6-24")
	dict_aa["t1736"] = unit_gen_proc ("加賀",29481,"1921-1-10")
	dict_aa["t1737"] = unit_gen_proc ("羽咋",48917,"1921-9-19")
	dict_aa["t1738"] = unit_gen_proc ("かほく",78531,"1921-12-28")
	dict_aa["t1739"] = unit_gen_proc ("白山",27948,"1921-5-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	hostname := "localhost"
	port := 11211

	dict_to_mcached_proc (hostname,port,dict_aa)


	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
