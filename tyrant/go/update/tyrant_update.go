// ----------------------------------------------------------------
//
//	tyrant_update.go
//
//					Jan/22/2014
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"net"
	"os"
	"strconv"
//	"strings"
//	"encoding/json"
)

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	key_in := os.Args[1]
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("id_in = %s\t" , key_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	hostname := "localhost"
	port := "1978"

	conn, err := net.Dial ("tcp",hostname + ":" + port)
	if err != nil {
		fmt.Println(err)
		return
		}

	json_str := mcached_socket_read_proc (conn,key_in)

	if 0 < len (json_str) {
		json_str_new := json_update_proc (json_str,population_in)
		fmt.Println (json_str_new)
		mcached_socket_write_proc (conn,key_in,json_str_new)
		}

	conn.Close ()

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
