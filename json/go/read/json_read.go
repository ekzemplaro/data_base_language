// ---------------------------------------------------------------
//
//	json_read.go
//
//					May/20/2018
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
	fmt.Fprintf (os.Stderr,"*** 開始 ***\n")

	file_json := os.Args[1]
	fmt.Printf ("%s\n",file_json)

	buff,_ := ioutil.ReadFile (file_json)

	json_str := string(buff)

	var dict_aa map[string](map[string]interface{})

	json.Unmarshal ([]byte(json_str), &dict_aa )

	dict_display_proc (dict_aa)

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ---------------------------------------------------------------
