// ----------------------------------------------------------------
//
//	couch_create.go
//
//					May/20/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"encoding/json"
	"strings"
)

// ----------------------------------------------------------------
func main () {

	fmt.Printf ("*** 開始 ***\n")

	url := "http://localhost:5984/nagano"

	deleteRequest(url,strings.NewReader(""))
	putRequest(url,strings.NewReader(""))

	dict_aa := data_prepare_proc ()

	for key,value := range dict_aa {
		output, _ := json.Marshal (value)
		json_str := string(output)
		url_target := url + "/" + key
		putRequest(url_target,strings.NewReader(json_str))
	}

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]interface{}) {
	dict_aa := make (map[string](map[string]interface{}))

	dict_aa["t2021"] = unit_gen_proc ("長野",71862,"1921-4-9")
	dict_aa["t2022"] = unit_gen_proc ("松本",36571,"1921-8-25")
	dict_aa["t2023"] = unit_gen_proc ("上田",18397,"1921-2-18")
	dict_aa["t2024"] = unit_gen_proc ("小諸",76518,"1921-1-30")
	dict_aa["t2025"] = unit_gen_proc ("岡谷",61459,"1921-6-24")
	dict_aa["t2026"] = unit_gen_proc ("塩尻",85623,"1921-1-10")
	dict_aa["t2027"] = unit_gen_proc ("茅野",15947,"1921-4-19")
	dict_aa["t2028"] = unit_gen_proc ("飯田",78231,"1921-7-28")
	dict_aa["t2029"] = unit_gen_proc ("中野",25948,"1921-6-8")
	dict_aa["t2030"] = unit_gen_proc ("諏訪",57832,"1921-4-11")
	dict_aa["t2031"] = unit_gen_proc ("駒ヶ根",46182,"1921-3-16")
	dict_aa["t2032"] = unit_gen_proc ("佐久",82396,"1921-5-12")
	dict_aa["t2033"] = unit_gen_proc ("伊那",21858,"1921-9-18")
	dict_aa["t2034"] = unit_gen_proc ("千曲",43172,"1921-5-21")

	return (dict_aa)
}

// ----------------------------------------------------------------
