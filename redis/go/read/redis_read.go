// ----------------------------------------------------------------
//
//	redis_read.go
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

	conn, err := net.Dial ("tcp", "host_dbase:6379")
	if err != nil {
		fmt.Println(err)
		return
		}

	keys := []string {"t1851","t1852","t1853","t1854","t1855",
			"t1856","t1857","t1858","t1859"}

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
