// ----------------------------------------------------------------
//
//	mcached_update.go
//
//					Jun/03/2015
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"os"
	"strconv"
)

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	key_in := os.Args[1]
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("key_in = %s\t" , key_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	hostname := "localhost"
	port := 11211

	mcached_update_proc (hostname,port,key_in,population_in)

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
