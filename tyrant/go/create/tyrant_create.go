// ----------------------------------------------------------------
//
//	tyrant_create.go
//
//					Jan/22/2014
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"net"
//	"encoding/json"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]string) {
	dict_aa := make (map[string](map[string]string))

	dict_aa["t4761"] = Unit_gen_proc ("那覇","83952","1921-5-18")
	dict_aa["t4762"] = Unit_gen_proc ("宜野湾","62571","1921-7-22")
	dict_aa["t4763"] = Unit_gen_proc ("石垣","59147","1921-6-12")
	dict_aa["t4764"] = Unit_gen_proc ("浦添","72978","1921-10-25")
	dict_aa["t4765"] = Unit_gen_proc ("名護","67419","1921-6-24")
	dict_aa["t4766"] = Unit_gen_proc ("糸満","21592","1921-1-10")
	dict_aa["t4767"] = Unit_gen_proc ("沖縄","48917","1921-9-19")
	dict_aa["t4768"] = Unit_gen_proc ("豊見城","78231","1921-12-28")
	dict_aa["t4769"] = Unit_gen_proc ("うるま","25978","1921-5-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	hostname := "localhost"
	port := "1978"

	conn, err := net.Dial ("tcp",hostname + ":" + port)
	if err != nil {
		fmt.Println(err)
		return
		}

	dict_to_mcached_proc (conn,dict_aa)

	conn.Close ()

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
