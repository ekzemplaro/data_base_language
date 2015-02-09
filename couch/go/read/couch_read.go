// ----------------------------------------------------------------
//
//	couch_read.go
//
//					Jan/20/2015
//
// ----------------------------------------------------------------
package main

import (
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"fmt"
//	"io"
	"encoding/json"
)

// ----------------------------------------------------------------
func main () {

	fmt.Printf ("*** 開始 ***\n")

	url := "http://localhost:5984/nagano/_all_docs"

	resp, err := http.Get (url)

	if err != nil {
		log.Fatalln(err)
		fmt.Printf("%s", err)
		os.Exit(1) 
		} else {
		defer resp.Body.Close()
		 contents, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			fmt.Printf("%s", err)
			os.Exit(1)
			}
		json_str := string(contents)
		fmt.Printf("%s\n", json_str)
		var data map[string]interface{}
		if err := json.Unmarshal([]byte(json_str), &data); err != nil {
        panic(err)
    }
//    fmt.Println(data)
    fmt.Println(data["rows"])
} 
		


//	io.Copy(os.Stdout, resp.Body)
	json_str := resp.Body
	print (json_str)
// body, err := ioutil.ReadAll(resp.Body)

//	print (body)
//	print (db.Body)

//	json_str := string (db.Body)
//	fmt.Printf (json_str)
/*
	id := "cities"
	rr := new(CompleteRecord)
	rev, err := db.Retrieve (id, rr)
	if err != nil {
		fmt.Printf ("*** error ***\n")
	}

	fmt.Printf ("id = %s\n",id)
	fmt.Printf ("rev = %s\n",rev)
//	fmt.Printf ("rr = %s\n",rr)
	fmt.Printf ("rr = %s\n",rr.Cities)

	for k := range rr.Cities {
		fmt.Printf( "%s\n",k)
		}
//	for key, pp := range rr.Cities {
	for key, _ := range rr.Cities {
		fmt.Printf( "%s\n",key)
//		fmt.Printf( "%s\t%v\t%d\t%s\n",
//		key, pp.Name, pp.Population, pp.Date_mod )
		}
*/

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
