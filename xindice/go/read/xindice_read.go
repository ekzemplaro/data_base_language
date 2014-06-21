// ----------------------------------------------------------------
//
//	xindice_read.go
//
//					Sep/23/2010
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"http"
	"xml"
)

// -----------------------------------------------------------------
type Cities struct {
        Id int
        Name string
        Population int
        Date_mod string
}

type Xml_data struct {
        Cities []Cities
}


// -----------------------------------------------------------------
func main() {

	print ("*** 開始 ***\n")

	url_in := "http://cdbd026:8888/xindice/db/cities/cities"
	rr,_,_ := http.Get (url_in)

	var result Xml_data
	xml.Unmarshal (rr.Body, &result )

	for _, pp := range result.Cities {
		fmt.Printf( "%d\t%v\t%d\t%s\n",
		pp.Id, pp.Name, pp.Population, pp.Date_mod )
	}

	print ("*** 終了 ***\n")
}


// -----------------------------------------------------------------
