// ----------------------------------------------------------------
//
//	text_delete.go
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
	fmt.Println ("*** 開始 ***")

	text_file := os.Args[1]
	key := os.Args[2]

	fmt.Printf ("key = %s\n" , key)

	var dict_aa = text_read_proc (text_file)

	delete (dict_aa,key)

	text_write_proc (text_file,dict_aa)

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
