// ----------------------------------------------------------------
//
//	mcached_delete.go
//
//					Jan/22/2014
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"net"
	"os"
)

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	key_in := os.Args[1]

	fmt.Printf (key_in + "\n")

	hostname := "localhost"
	port := "11211"

	conn, err := net.Dial ("tcp",hostname + ":" + port)
	if err != nil {
		fmt.Println(err)
		return
		}

	_, err = conn.Write([]byte("delete " + key_in + "\r\n"))
	if err != nil {
		fmt.Println(err)
		return
		}

	conn.Close ()

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
