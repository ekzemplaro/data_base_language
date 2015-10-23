// ----------------------------------------------------------------
//
//	redis_delete.go
//
//					May/21/2013
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

	fmt.Printf ("*** 開始 ***\n")

	key_in := os.Args[1]

	fmt.Printf (key_in + "\n")

	hostname := "host_dbase"
	port := "6379"

	conn, err := net.Dial ("tcp",hostname + ":" + port)
	if err != nil {
		fmt.Println(err)
		return
		}

	_, err = conn.Write ([]byte("del " + key_in + "\r\n"))
	if err != nil {
		fmt.Println(err)
		return
		}

	conn.Close ()

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
