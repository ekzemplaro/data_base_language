// ----------------------------------------------------------------
//
//	mcached_delete.go
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

	fmt.Println ("*** 開始 ***")

	key_in := os.Args[1]

	fmt.Printf (key_in + "\n")

	hostname := "localhost"
	port := 11211

	mcached_delete_proc (hostname,port,key_in)

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
