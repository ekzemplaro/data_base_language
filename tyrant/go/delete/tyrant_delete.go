// ----------------------------------------------------------------
//
//	tyrant_delete.go
//
//					Feb/11/2015
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"os"
)

// ----------------------------------------------------------------
func main () {

	fmt.Printf ("*** 開始 ***\n")

	key_in := os.Args[1]

	fmt.Printf (key_in + "\n")

	hostname := "host_ubuntu1"
	port := 1978

	mcached_delete_proc (hostname,port,key_in)

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
