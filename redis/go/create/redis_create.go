// ---------------------------------------------------------------
//
//	redis_create.go
//
//					May/20/2018
// ---------------------------------------------------------------
package main 

import (
	"fmt"
	"net"
)

// ---------------------------------------------------------------
func data_prepare_proc () map[string](map[string]interface{}) {
	dict_aa := make (map[string](map[string]interface{}))

	dict_aa["t1851"] = unit_gen_proc ("福井",63152,"1921-10-12")
	dict_aa["t1852"] = unit_gen_proc ("敦賀",28671,"1921-9-25")
	dict_aa["t1853"] = unit_gen_proc ("小浜",81597,"1921-6-14")
	dict_aa["t1854"] = unit_gen_proc ("大野",42178,"1921-4-31")
	dict_aa["t1855"] = unit_gen_proc ("勝山",17859,"1921-6-24")
	dict_aa["t1856"] = unit_gen_proc ("鯖江",28592,"1921-1-10")
	dict_aa["t1857"] = unit_gen_proc ("あわら",42917,"1921-10-19")
	dict_aa["t1858"] = unit_gen_proc ("越前",76231,"1921-12-28")
	dict_aa["t1859"] = unit_gen_proc ("坂井",21978,"1921-5-14")

	return (dict_aa)
}

// ---------------------------------------------------------------
func main () {
	fmt.Printf ("*** 開始 ***\n")

	dict_aa := data_prepare_proc ()

	hostname := "localhost"
	port := "6379"

	conn, err := net.Dial ("tcp",hostname + ":" + port)
	if err != nil {
		fmt.Println(err)
		return
		}

	dict_to_redis_proc (conn,dict_aa)

	conn.Close ()

	fmt.Printf ("*** 終了 ***\n")
}

// ---------------------------------------------------------------
