// ---------------------------------------------------------------
//
//	json_delete.go
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

	json_filename := os.Args[1]

	key_in := os.Args[2]

	fmt.Printf ("%s\n",key_in)
	buff,_ := ioutil.ReadFile(json_filename)

	json_str := string(buff)

	var dict_aa map[string](map[string]string)

	json.Unmarshal ([]byte(json_str), &dict_aa )

	delete (dict_aa,key_in)
	dict_display_proc (dict_aa)

	output, _ := json.Marshal(dict_aa)

	ioutil.WriteFile (json_filename,[]byte(output),0666)

	fmt.Printf ("*** 終了 ***\n")
}

// ---------------------------------------------------------------
