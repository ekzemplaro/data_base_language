// ---------------------------------------------------------------
//
//	xml_read.go
//
//					May/21/2013
// ---------------------------------------------------------------
package main 

import (
	"os"
	"fmt"
	"encoding/xml"
	"io/ioutil"
)

// ---------------------------------------------------------------
type City struct {
//        Id int
        Name string
        Population int
        Date_mod string
}

type Xml_data struct {
        Cities []City;
}


// ---------------------------------------------------------------
func main () {
	fmt.Printf ("*** 開始 ***\n")

	input_filename := os.Args[1]

	fp_in, err := os.Open(input_filename)

	buff,_ := ioutil.ReadFile(input_filename)
	xml_str := string(buff)
//	fmt.Printf ("%s\n", xml_str)

	if err != nil {
		fp_in.Close()
		fmt.Printf( "target file read Error!\n" )
	}

//	var result Xml_data;
//	xml.Unmarshal (fp_in, &result )
	var dict_aa map[string](map[string]string);
//	xml.Unmarshal (fp_in, &dict_aa )
	xml.Unmarshal ([]byte(xml_str), &dict_aa )

	fmt.Printf ("%s\n",dict_aa["t2261"]["name"])
	fmt.Printf ("%s\n",dict_aa["t2261"]["population"])
	fmt.Printf ("%s\n",dict_aa["t3262"]["name"])

	Dict_display_proc (dict_aa)

//	for key, pp := range result.Cities {
//		fmt.Printf( "%s\t%s\t%d\t%s\n",
//		key, pp.Name, pp.Population, pp.Date_mod )
//
//	for _, pp := range result.Cities {
//		fmt.Printf( "%d\t%v\t%d\t%s\n",
//		pp.Id, pp.Name, pp.Population, pp.Date_mod )
//	}

	fp_in.Close()
	fmt.Printf ("*** 終了 ***\n")
}

// ---------------------------------------------------------------
