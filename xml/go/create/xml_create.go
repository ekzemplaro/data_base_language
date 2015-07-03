// ----------------------------------------------------------------
//
//	xml_create.go
//
//					Jun/05/2015
//
// ----------------------------------------------------------------
package main

import (
	"fmt";
	"os";
	"io/ioutil"; 
//	"strings";
)
// ----------------------------------------------------------------
func join_proc (id,name,population,date_mod string) string {
//	arry := &[...]string {id,name,population,date_mod}

	datax := "<"
	datax += id
	datax += ">"

	datax += "<name>"
	datax += name
	datax += "</name>"

	datax += "<population>"
	datax += population
	datax += "</population>"

	datax += "<date_mod>"
	datax += date_mod
	datax += "</date_mod>"

	datax += "</"
	datax += id
	datax += ">"


	return (datax)
}

// ----------------------------------------------------------------
func main() {
	fmt.Printf ("*** 開始 ***\n")

	out_filename := os.Args[1]

	data := "<?xml version=\"1.0\" encoding=\"utf-8\"?><root>\n"


	data += join_proc ("t2261","静岡","87164","1921-9-12")
	data += join_proc ("t2262","浜松","54973","1921-5-19")
	data += join_proc ("t2263","沼津","36815","1921-8-17")
	data += join_proc ("t2264","三島","75297","1921-3-18")
	data += join_proc ("t2265","富士","51784","1921-2-27")
	data += join_proc ("t2266","熱海","46273","1921-7-20")
	data += join_proc ("t2267","富士宮","38541","1921-10-21")
	data += join_proc ("t2268","藤枝","62586","1921-4-29")
	data += join_proc ("t2269","御殿場","79164","1921-3-28")
	data += join_proc ("t2270","島田","49827","1921-11-15")

	data += "</root>"

	println (string (data))

	ioutil.WriteFile (out_filename, []byte(data), 0666)

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
