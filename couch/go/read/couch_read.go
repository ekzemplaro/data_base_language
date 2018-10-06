// ----------------------------------------------------------------
//
//	couch_read.go
//
//					Oct/04/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	"encoding/json"
)

// ----------------------------------------------------------------
func main () {

	fmt.Fprintf (os.Stderr,"*** 開始 ***\n")

	url := "http://localhost:5984/nagano/_all_docs"

	json_str := url_get_proc (url)

	var data map[string]interface{}
	if err := json.Unmarshal([]byte(json_str), &data); err != nil {
        	panic(err)
		}

	fmt.Printf("total_rows = %f\n" , data["total_rows"])
	xx := data["rows"]
	yy := xx.([]interface{})

	for _,value := range yy {
		pp := value.(map[string]interface {})
		key := pp["id"].(string)
		url := "http://localhost:5984/nagano/" + key
		json_str_unit := url_get_proc (url)
	var unit_aa map[string]interface{}
	if err := json.Unmarshal([]byte(json_str_unit), &unit_aa); err != nil {
        	panic(err)
		}

		name := unit_aa["name"].(string)
		population := unit_aa["population"].(float64)
		date_mod := unit_aa["date_mod"].(string)
		fmt.Printf ("%s\t%s\t%f\t%s\n",key,name,population,date_mod)

		}

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ----------------------------------------------------------------
