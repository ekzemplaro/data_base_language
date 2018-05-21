// ----------------------------------------------------------------
//
//	redis_read.go
//
//					May/21/2018
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"net"
	"strings"
	"encoding/json"
)

// ----------------------------------------------------------------
func main () {

	fmt.Println ("*** 開始 ***")

	hostname := "localhost"
	port := "6379"

	conn, err := net.Dial ("tcp", hostname + ":" + port)
	if err != nil {
		fmt.Println(err)
		return
		}

	keys := key_get_proc (conn)

	fmt.Println (len(keys))

	dict_aa := make (map[string](map[string]interface{}))

	for _,value := range keys {
		json_str := mcached_socket_read_proc (conn,value)

		if 0 < len (json_str) {
			var unit_aa map[string]interface{}
			json.Unmarshal ([]byte(json_str), &unit_aa)
			dict_aa[value] = unit_aa
			}
	}

	conn.Close ()

	dict_display_proc (dict_aa)

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
func key_get_proc (conn net.Conn) []string {
	var keys []string

	string_received := string_get_proc (conn)

	if 0 < len (string_received) {
		datax := strings.Split (string_received,"\n")
		for _, pp := range datax {
			if (0 < len (pp)) && (pp[:1] == "t") {
				keys = append(keys, pp)
				}
			}
		}

	return keys
}
 
// ----------------------------------------------------------------
func string_get_proc (conn net.Conn) string{
	str_received := ""

	comm_aa := "keys *" + "\r\n"

	_, err := conn.Write([]byte(comm_aa))
	if err != nil {
		fmt.Println(err)
		return str_received
		}

	buf := make([]byte, 1024)
	nn, err := conn.Read(buf[:])
	if err != nil {
		fmt.Println(err)
		return str_received
		}

	str_received = string(buf[0:nn])

	return str_received
}

// ----------------------------------------------------------------
