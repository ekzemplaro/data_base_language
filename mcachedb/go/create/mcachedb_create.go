// ----------------------------------------------------------------
//
//	mcached_create.go
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

	dict_aa["t1521"] = Unit_gen_proc ("新潟","85942","1921-7-14")
	dict_aa["t1522"] = Unit_gen_proc ("長岡","67321","1921-6-27")
	dict_aa["t1523"] = Unit_gen_proc ("新発田","61597","1921-7-5")
	dict_aa["t1524"] = Unit_gen_proc ("上越","72918","1921-10-20")
	dict_aa["t1525"] = Unit_gen_proc ("糸魚川","67419","1921-6-24")
	dict_aa["t1526"] = Unit_gen_proc ("加茂","21542","1921-1-10")
	dict_aa["t1527"] = Unit_gen_proc ("三条","42917","1921-9-19")
	dict_aa["t1528"] = Unit_gen_proc ("佐渡","78231","1921-12-28")
	dict_aa["t1529"] = Unit_gen_proc ("柏崎","25978","1921-5-14")
	dict_aa["t1530"] = Unit_gen_proc ("村上","84691","1921-9-7")
	dict_aa["t1531"] = Unit_gen_proc ("十日町","67291","1921-2-12")
	dict_aa["t1532"] = Unit_gen_proc ("五泉","95381","1921-8-25")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	hostname := "localhost"
	port := "21201"

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
