// ----------------------------------------------------------------
//
//	redis_update.go
//
//					May/19/2018
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"net"
	"os"
	"strconv"
)

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	key_in := os.Args[1]
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("id_in = %s\t" , key_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	hostname := "localhost"
	port := "6379"

	conn, err := net.Dial ("tcp",hostname + ":" + port)
	if err != nil {
		fmt.Println(err)
		return
		}

	json_str := mcached_socket_read_proc (conn,key_in)

	if 0 < len (json_str) {
		json_str_new := json_update_proc (json_str,population_in)
		fmt.Println (json_str_new)
		redis_socket_write_proc (conn,key_in,json_str_new)
		}

	conn.Close ()

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
