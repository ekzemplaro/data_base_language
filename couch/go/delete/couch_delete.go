// ----------------------------------------------------------------
//
//	couch_delete.go
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
	"net/http"
	"log"
//	"strconv"
	"strings"
)

// ----------------------------------------------------------------


// ----------------------------------------------------------------
func deleteRequest(url string, data io.Reader)  {
	client := &http.Client{}
	req, err := http.NewRequest(http.MethodDelete, url, data)
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

	fmt.Printf ("key_in = %d\n" , key_in)


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


	url_target := url + "?rev=" + unit_aa["_rev"].(string)

	deleteRequest(url_target,strings.NewReader(""))

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
