// ----------------------------------------------------------------
//
//	tyrant_create.go
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

	dict_aa["t4761"] = unit_gen_proc ("那覇","83152","1921-4-18")
	dict_aa["t4762"] = unit_gen_proc ("宜野湾","62871","1921-7-22")
	dict_aa["t4763"] = unit_gen_proc ("石垣","59147","1921-6-12")
	dict_aa["t4764"] = unit_gen_proc ("浦添","72978","1921-10-25")
	dict_aa["t4765"] = unit_gen_proc ("名護","67419","1921-6-24")
	dict_aa["t4766"] = unit_gen_proc ("糸満","51692","1921-1-10")
	dict_aa["t4767"] = unit_gen_proc ("沖縄","48917","1921-9-19")
	dict_aa["t4768"] = unit_gen_proc ("豊見城","79231","1921-12-28")
	dict_aa["t4769"] = unit_gen_proc ("うるま","21978","1921-5-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	hostname := "host_ubuntu1"
	port := 1978

	dict_to_mcached_proc (hostname,port,dict_aa)

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
