// ----------------------------------------------------------------
//
//	tyrant_read.go
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

	conn, err := net.Dial ("tcp", "localhost:1978")
	if err != nil {
		fmt.Println(err)
		return
		}

	keys := []string {"t4761","t4762","t4763","t4764","t4765",
			"t4766","t4767","t4768","t4769"}

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
