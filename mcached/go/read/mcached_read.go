// ----------------------------------------------------------------
//
//	mcached_read.go
//
//					Jan/22/2014
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"net"
//	"strings"
//	"encoding/json"
)

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	hostname := "localhost"
	port := "11211"

	conn, err := net.Dial ("tcp",hostname + ":" + port)
	if err != nil {
		fmt.Println(err)
		return
		}

	keys := []string {"t1731","t1732","t1733","t1734","t1735",
			"t1736","t1737","t1738","t1739"}

	for _,value := range keys {
		json_str := mcached_socket_read_proc (conn,value)

		if 0 < len (json_str) {
			json_parser (value,json_str)
			}
	}

	conn.Close ()

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
