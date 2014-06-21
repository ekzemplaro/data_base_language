// ---------------------------------------------------------------
//
//	json_read.go
//
//					Jan/22/2014
// ---------------------------------------------------------------
package main 

import (
	"os"
	"fmt"
	"encoding/json"
	"io/ioutil"
)

// ---------------------------------------------------------------
func main () {
	fmt.Printf ("*** 開始 ***\n")

	file_json := os.Args[1]
	fmt.Printf ("%s\n",file_json)

	buff,_ := ioutil.ReadFile (file_json)

	json_str := string(buff)

	var dict_aa map[string](map[string]string)

	json.Unmarshal ([]byte(json_str), &dict_aa )

	dict_display_proc (dict_aa)

	fmt.Printf ("*** 終了 ***\n")
}

// ---------------------------------------------------------------
