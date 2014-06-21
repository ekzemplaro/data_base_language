// ----------------------------------------------------------------
//
//	text_create.go
//
//					Jan/22/2014
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]string) {
	dict_aa := make (map[string](map[string]string))

	dict_aa["t2381"] = Unit_gen_proc ("名古屋","37152","1921-10-12")
	dict_aa["t2382"] = Unit_gen_proc ("豊橋","49671","1921-9-25")
	dict_aa["t2383"] = Unit_gen_proc ("岡崎","61597","1921-6-14")
	dict_aa["t2384"] = Unit_gen_proc ("一宮","72178","1921-4-31")
	dict_aa["t2385"] = Unit_gen_proc ("蒲郡","67859","1921-6-24")
	dict_aa["t2386"] = Unit_gen_proc ("常滑","21592","1921-1-10")
	dict_aa["t2387"] = Unit_gen_proc ("大府","48917","1921-10-19")
	dict_aa["t2388"] = Unit_gen_proc ("瀬戸","78231","1921-12-28")
	dict_aa["t2389"] = Unit_gen_proc ("犬山","25978","1921-5-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	file_text := os.Args[1]

	dict_aa := data_prepare_proc ()

	dict_display_proc (dict_aa)

	text_write_proc (file_text,dict_aa)

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
