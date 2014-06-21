// ----------------------------------------------------------------
//
//	mcached_manipulate.go
//
//					Jan/22/2014
//
// ----------------------------------------------------------------
package main
 
import (
	"fmt"
	"net"
	"strconv"
	"strings"
	"encoding/json"
)

// ----------------------------------------------------------------
func socket_read_proc (conn net.Conn,key_in string) string {
	str_received := ""
	_, err := conn.Write([]byte("get " + key_in + "\r\n"))
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

	return	str_received
}

// ----------------------------------------------------------------
func mcached_socket_read_proc (conn net.Conn,key_in string) string {
	json_str := ""
	str_received := socket_read_proc (conn,key_in)

	lines := strings.Split(str_received,"\n")

	if (! strings.Contains(lines[0],"END")) {
		json_str = lines[1]
		}

	return	json_str
}

// ----------------------------------------------------------------
func json_parser (key string,json_str string) {
//			fmt.Println (json_str)
	var unit_aa map[string]string

	json.Unmarshal ([]byte(json_str), &unit_aa)
	fmt.Printf ("%s\t",key)
	fmt.Printf ("%s\t",unit_aa["name"])
	fmt.Printf ("%s\t",unit_aa["population"])
	fmt.Printf ("%s\n",unit_aa["date_mod"])
}

// ----------------------------------------------------------------
func mcached_socket_write_proc (conn net.Conn,key_in string,json_str string) {
//	fmt.Println ("*** mcached_socket_write_proc ***")

	llx := len (json_str)
//	fmt.Println (llx)

	llx_str  := strconv.Itoa (llx)

	comm_aa := "set " + key_in + " 0 0 " + llx_str + "\r\n"
	conn.Write([]byte(comm_aa))

	comm_bb := json_str + "\r\n"
	conn.Write([]byte(comm_bb))

	buf := make ([]byte,1024)
	conn.Read (buf[:])

//	nn,_ := conn.Read(buf[:])
//	fmt.Println (string(buf[0:nn]))
}

// ----------------------------------------------------------------
func json_update_proc (json_str string,population_in int) string {

	var unit_aa map[string]string
	json.Unmarshal ([]byte(json_str), &unit_aa)
	fmt.Printf ("%s\t",unit_aa["name"])
	fmt.Printf ("%s\t",unit_aa["population"])
	fmt.Printf ("%s\n",unit_aa["date_mod"])

	unit_aa["population"] = strconv.Itoa (population_in)
	unit_aa["date_mod"] = get_current_date_proc ()

	output, _ := json.Marshal(unit_aa)

	json_str = string(output)

	return	json_str
}

// ----------------------------------------------------------------
func dict_to_mcached_proc (conn net.Conn,dict_aa map[string](map[string]string)) {
	for key,value := range dict_aa {
//		fmt.Print (key + "\t")
//		fmt.Println (value["name"])
		output, _ := json.Marshal (value)

		json_str := string(output)
//		fmt.Println (json_str)
		mcached_socket_write_proc (conn,key,json_str)
		}
}

// ----------------------------------------------------------------
