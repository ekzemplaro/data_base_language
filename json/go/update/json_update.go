// ---------------------------------------------------------------
//
//	json_update.go
//
//					Jan/22/2014
// ---------------------------------------------------------------
package main 

import (
	"os"
	"strconv"
	"fmt"
	"encoding/json"
	"io/ioutil"
)

// ---------------------------------------------------------------
func main () {
	fmt.Printf ("*** 開始 ***\n")

	json_filename := os.Args[1]

	key_in := os.Args[2]
	population_in,_ := strconv.Atoi (os.Args[3])

	fmt.Printf ("%s\n",key_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	buff,_ := ioutil.ReadFile(json_filename)

	json_str := string(buff)

	var dict_aa map[string](map[string]string);

	json.Unmarshal ([]byte(json_str), &dict_aa )


	var dict_bb map[string](map[string]string);
	dict_bb = dict_update_proc (dict_aa,key_in,population_in)

	dict_display_proc (dict_aa)

	output, _ := json.Marshal (dict_bb)

	ioutil.WriteFile (json_filename,[]byte(output),0666)

	fmt.Printf ("*** 終了 ***\n")
}

// ---------------------------------------------------------------
