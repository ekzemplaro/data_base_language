// ----------------------------------------------------------------
//
//	couch_update.go
//
//					May/20/2018
//
// ----------------------------------------------------------------
package main

import (
	"io"
	"fmt"
	"encoding/json"
	"os"
	"strconv"
	"net/http"
	"log"
	"strings"
)

// ----------------------------------------------------------------
/*
type city struct {
	_id string
	_rev string
	name string
	population int
	date_mod string
}
*/
// ----------------------------------------------------------------
func putRequest(url string, data io.Reader)  {
	client := &http.Client{}
	req, err := http.NewRequest(http.MethodPut, url, data)
	if err != nil {
		// handle error
		log.Fatal(err)
	}
	_, err = client.Do(req)
	if err != nil {
		// handle error
		log.Fatal(err)
	}


}
// ----------------------------------------------------------------
func main () {

	fmt.Printf ("*** 開始 ***\n")

	key_in := os.Args[1]
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("key_in = %d\t" , key_in)
	fmt.Printf ("population_in = %d\n" , population_in)


	url := "http://localhost:5984/nagano/" + key_in

	json_str := url_get_proc (url)
	fmt.Printf (json_str + "\n")

	var unit_aa map[string]interface{}
	if err := json.Unmarshal([]byte(json_str), &unit_aa); err != nil {
        	panic(err)
		}

	name := unit_aa["name"].(string)
	population := unit_aa["population"].(float64)
	date_mod := unit_aa["date_mod"].(string)
	fmt.Printf ("%s\t%s\t%f\t%s\n",key_in,name,population,date_mod)

	unit_out := make(map[string]interface{})
	unit_out["_rev"] = unit_aa["_rev"].(string)
	unit_out["name"] = name
	unit_out["population"] = population_in
	today := get_current_date_proc ()
	unit_out["date_mod"] = today
	output, _ := json.Marshal(unit_out)
	json_str = string(output)

	fmt.Printf (json_str + "\n")

	putRequest(url, strings.NewReader(json_str))

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
