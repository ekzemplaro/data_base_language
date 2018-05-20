// ----------------------------------------------------------------
//
//	webdav_read.go
//
//					Jan/29/2013
//
// ----------------------------------------------------------------
package main

import (
	"net/http"
	"fmt"
	"encoding/json"
	"io/ioutil"
)

// ----------------------------------------------------------------
func main () {

	fmt.Printf ("*** 開始 ***\n")

//	resp, err := http.Get ("http://host_dbase:3004/city/tokyo.json")
	resp, err := http.Get ("http://cddn007:3004/city/tokyo.json")

	if err != nil {
		fmt.Printf ("*** error *** http.Get ***\n")
	}


	defer resp.Body.Close ()
	body, err := ioutil.ReadAll (resp.Body)

	json_str := string (body)

	fmt.Printf ("json_str = %s\n",json_str)
	fmt.Printf ("*** ppp ***\n")

	var dict_aa map[string](map[string]string)

	fmt.Printf ("*** qqq ***\n")
	json.Unmarshal ([]byte(json_str), &dict_aa )

	fmt.Printf ("*** rrr ***\n")
	dict_display_proc (dict_aa)

	for key := range dict_aa {
	fmt.Printf ("%s\n",key)
	}

	fmt.Printf ("*** sss ***\n")


	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
