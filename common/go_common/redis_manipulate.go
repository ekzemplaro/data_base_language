// ----------------------------------------------------------------
//
//	redis_manipulate.go
//
//					Jan/20/2015
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"net"
	"encoding/json"
)

// ----------------------------------------------------------------
func redis_socket_write_proc (conn net.Conn,key_in string,json_str string) {
	fmt.Println (key_in)
	fmt.Println (json_str)

	comm_aa := "set " + key_in + " '" + json_str + "'\r\n"
	conn.Write([]byte(comm_aa))


	buf := make ([]byte,1024)
	conn.Read (buf[:])

	fmt.Println (string(buf[0:10]))
}

// ----------------------------------------------------------------
func dict_to_redis_proc (conn net.Conn,dict_aa map[string](map[string]string)) {
	for key,value := range dict_aa {
//		fmt.Print (key + "\t")
//		fmt.Println (value["name"])
		output, _ := json.Marshal (value)

		json_str := string(output)
		redis_socket_write_proc (conn,key,json_str)
		}
}

// ----------------------------------------------------------------
