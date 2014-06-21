// ----------------------------------------------------------------
//
//	couch_read.go
//
//					May/21/2013
//
// ----------------------------------------------------------------
package main

import (
//	"io"
	"log"
	"net/http"
//	"os"
	"fmt"
)

// ----------------------------------------------------------------
func main () {

	fmt.Printf ("*** 開始 ***\n")

	db, err := http.Get("http://host_dbase:5984/city/cities")

	if err != nil {
        log.Fatalln(err)
    	}
//    io.Copy(os.Stdout, db.Body)

	print (db.Body)

	// json_str := string (db.Body)
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
