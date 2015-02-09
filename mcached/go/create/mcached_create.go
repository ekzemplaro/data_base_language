// ----------------------------------------------------------------
//
//	mcached_create.go
//
//					Jan/20/2015
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"net"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]string) {
	dict_aa := make (map[string](map[string]string))

	dict_aa["t1731"] = unit_gen_proc ("金沢","31852","1921-2-24")
	dict_aa["t1732"] = unit_gen_proc ("輪島","49671","1921-8-17")
	dict_aa["t1733"] = unit_gen_proc ("小松","61597","1921-7-8")
	dict_aa["t1734"] = unit_gen_proc ("七尾","72978","1921-10-30")
	dict_aa["t1735"] = unit_gen_proc ("珠洲","67419","1921-6-24")
	dict_aa["t1736"] = unit_gen_proc ("加賀","21592","1921-1-10")
	dict_aa["t1737"] = unit_gen_proc ("羽咋","48917","1921-9-19")
	dict_aa["t1738"] = unit_gen_proc ("かほく","78231","1921-12-28")
	dict_aa["t1739"] = unit_gen_proc ("白山","25978","1921-5-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	hostname := "localhost"
	port := "11211"

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
