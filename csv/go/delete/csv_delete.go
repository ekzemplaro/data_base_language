// ----------------------------------------------------------------
//
//	csv_delete.go
//
//					Jan/22/2014
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
)

// ----------------------------------------------------------------
func main() {
	fmt.Printf ("*** 開始 ***\n")

	text_file := os.Args[1]
	key := os.Args[2]

	fmt.Printf ("key = %s\n" , key)

	var dict_aa = csv_read_proc (text_file)

	delete (dict_aa,key)

	csv_write_proc (text_file,dict_aa)

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
