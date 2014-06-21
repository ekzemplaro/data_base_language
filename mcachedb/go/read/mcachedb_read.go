// ----------------------------------------------------------------
//
//	mcachedb_read.go
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

	conn, err := net.Dial ("tcp", "localhost:21201")
	if err != nil {
		fmt.Println(err)
		return
		}

	keys := []string {"t1521","t1522","t1523","t1524","t1525",
			"t1526","t1527","t1528","t1529",
			"t1530","t1531","t1532"}

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
