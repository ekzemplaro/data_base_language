// ---------------------------------------------------------------
//
//	json_delete.go
//
//					Feb/24/2018
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

	json_filename := os.Args[1]

	key_in := os.Args[2]

	fmt.Printf ("%s\n",key_in)
	buff,_ := ioutil.ReadFile(json_filename)

	json_str := string(buff)

	var dict_aa map[string](map[string]string)

	json.Unmarshal ([]byte(json_str), &dict_aa )

	delete (dict_aa,key_in)

	output, _ := json.Marshal(dict_aa)

	ioutil.WriteFile (json_filename,[]byte(output),0666)

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ---------------------------------------------------------------
