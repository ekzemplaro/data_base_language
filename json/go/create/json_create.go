// ----------------------------------------------------------------
//	json_create.go
//
//					May/20/2018
//
// ----------------------------------------------------------------
package main

// ----------------------------------------------------------------
import (
	"os"
	"encoding/json"
	"fmt"
	"io/ioutil"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]interface{}) {
	dict_aa := make (map[string](map[string]interface{}))

	dict_aa["t0921"] = unit_gen_proc ("宇都宮",41852,"1921-7-19")
	dict_aa["t0922"] = unit_gen_proc ("小山",96571,"1921-9-20")
	dict_aa["t0923"] = unit_gen_proc ("佐野",18397,"1921-7-14")
	dict_aa["t0924"] = unit_gen_proc ("足利",76518,"1921-7-31")
	dict_aa["t0925"] = unit_gen_proc ("日光",61459,"1921-6-24")
	dict_aa["t0926"] = unit_gen_proc ("下野",85623,"1921-1-10")
	dict_aa["t0927"] = unit_gen_proc ("さくら",15947,"1921-4-19")
	dict_aa["t0928"] = unit_gen_proc ("矢板",78231,"1921-7-28")
	dict_aa["t0929"] = unit_gen_proc ("真岡",25948,"1921-6-8")
	dict_aa["t0930"] = unit_gen_proc ("栃木",57832,"1921-4-11")
	dict_aa["t0931"] = unit_gen_proc ("大田原",46182,"1921-3-16")
	dict_aa["t0932"] = unit_gen_proc ("鹿沼",82396,"1921-5-12")
	dict_aa["t0933"] = unit_gen_proc ("那須塩原",91858,"1921-9-18")
	dict_aa["t0934"] = unit_gen_proc ("那須烏山",69172,"1921-2-21")

	return (dict_aa)
}
// ----------------------------------------------------------------
func main() {
	fmt.Fprintf (os.Stderr,"*** 開始 ***\n")

	out_filename := os.Args[1]

	dict_aa := data_prepare_proc ()

        output, _ := json.Marshal(dict_aa)

        ioutil.WriteFile (out_filename,[]byte(output),0666)

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}
 
// ----------------------------------------------------------------
