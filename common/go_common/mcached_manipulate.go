// ----------------------------------------------------------------
//
//	mcached_manipulate.go
//
//					May/20/2018
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
	var unit_aa map[string]interface{}

	json.Unmarshal ([]byte(json_str), &unit_aa)
	fmt.Printf ("%s\t",key)
	fmt.Printf ("%s\t",unit_aa["name"])
	fmt.Printf ("%f\t",unit_aa["population"])
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

	var unit_aa map[string]interface{}
	json.Unmarshal ([]byte(json_str), &unit_aa)
	fmt.Printf ("%s\t",unit_aa["name"])
	fmt.Printf ("%f\t",unit_aa["population"])
	fmt.Printf ("%s\n",unit_aa["date_mod"])

	unit_aa["population"] = population_in
	unit_aa["date_mod"] = get_current_date_proc ()

	output, _ := json.Marshal(unit_aa)

	json_str = string(output)

	return	json_str
}

// ----------------------------------------------------------------
func dict_to_mcached_proc (hostname string,port int,dict_aa map[string](map[string]interface{})) {
	str_port := strconv.Itoa (port)
	conn, err := net.Dial ("tcp",hostname + ":" + str_port)
	if err != nil {
		fmt.Println(err)
		return
		}

	for key,value := range dict_aa {
//		fmt.Print (key + "\t")
//		fmt.Println (value["name"])
		output, _ := json.Marshal (value)

		json_str := string(output)
//		fmt.Println (json_str)
		mcached_socket_write_proc (conn,key,json_str)
		}

	conn.Close ()
}

// ----------------------------------------------------------------
func mcached_to_dict_proc (hostname string,port int,keys []string) map[string](map[string]interface{}){
	dict_aa := make (map[string](map[string]interface{}))

	str_port := strconv.Itoa (port)
	conn, err := net.Dial ("tcp",hostname + ":" + str_port)
	if err != nil {
		fmt.Println(err)
		return dict_aa
		}

	for _,key := range keys {
		json_str := mcached_socket_read_proc (conn,key)

		if 0 < len (json_str) {
			var unit_aa map[string]interface{}
			json.Unmarshal ([]byte(json_str), &unit_aa)
			dict_aa[key] = unit_aa
			}
	}
	conn.Close ()

	return (dict_aa)
}

// ----------------------------------------------------------------
func mcached_update_proc (hostname string,port int,key_in string,population_in int) {
	str_port := strconv.Itoa (port)
	conn, err := net.Dial ("tcp",hostname + ":" + str_port)
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
}

// ----------------------------------------------------------------
func mcached_delete_proc (hostname string,port int,key_in string) {
	str_port := strconv.Itoa (port)
	conn, err := net.Dial ("tcp",hostname + ":" + str_port)
	if err != nil {
		fmt.Println(err)
		return
		}

	_, err = conn.Write([]byte("delete " + key_in + "\r\n"))
	if err != nil {
		fmt.Println(err)
		return
		}

	conn.Close ()
}

// ----------------------------------------------------------------
