// ----------------------------------------------------------------
//
//	text_delete.go
//
//					Feb/24/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
)

// ----------------------------------------------------------------
func main() {
	fmt.Fprintln (os.Stderr,"*** 開始 ***")

	text_file := os.Args[1]
	key := os.Args[2]

	fmt.Printf ("key = %s\n" , key)

	var dict_aa = text_read_proc (text_file)

	delete (dict_aa,key)

	text_write_proc (text_file,dict_aa)

	fmt.Fprintln (os.Stderr,"*** 終了 ***")
}

// ----------------------------------------------------------------
