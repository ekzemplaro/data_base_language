// ----------------------------------------------------------------
//
//	text_manipulate.go
//
//					Jan/20/2015
//
// ----------------------------------------------------------------
// package text_manipulate
package main

import (
	"fmt"
	"io/ioutil"
	"strings"
	"strconv"
	"time"
	"sort"
)

// ----------------------------------------------------------------
func display_record_proc (key string, unit_aa map[string]string) {
	fmt.Printf ("%s\t",key)
	fmt.Printf ("%s\t",unit_aa["name"])
	fmt.Printf ("%s\t",unit_aa["population"])
	fmt.Printf ("%s\n",unit_aa["date_mod"])
}

// ----------------------------------------------------------------
func dict_display_proc (dict_aa map[string](map[string]string)) {
	var keys []string
	for key,_ := range dict_aa {
	keys = append (keys,key)
	}

	sort.Strings (keys)

	for _, key := range keys {
	display_record_proc (key, dict_aa[key])
	}

}

// ----------------------------------------------------------------
func unit_gen_proc (name,population,date_mod string) map[string]string {
	unit_aa := make (map[string]string)
	unit_aa["name"] = name
	unit_aa["population"] = population
	unit_aa["date_mod"] = date_mod

	return (unit_aa)
}

// ----------------------------------------------------------------
// [4-4-6]:
func join_proc (id,name,population,date_mod,delimit string) string {
	arry := []string {id,name,population,date_mod}

	datax := strings.Join (arry,delimit)
	datax += "\n"

	return (datax)
}

// ----------------------------------------------------------------
// [4-4]:
func dict_to_string_proc (dict_aa map[string](map[string]string),delimit string) string {
	str_out := ""
	for key,value := range dict_aa {
	str_out += join_proc (key,value["name"],
		value["population"],value["date_mod"],delimit)
	}

	return	(str_out)
}

// ----------------------------------------------------------------
// [4]:
func text_write_proc (text_file string,dict_aa map[string](map[string]string)){
	delimit := "\t"
	str_out := dict_to_string_proc (dict_aa,delimit)
	ioutil.WriteFile (text_file, []byte(str_out), 0666)
}

// ----------------------------------------------------------------
// [6-4]:
func text_read_proc_exec (text_file,delimit string) map[string](map[string]string){
	dict_aa := make (map[string](map[string]string))


	buff,_ := ioutil.ReadFile(text_file)

//	datax := strings.Split (string (buff),"\n",-1)
	datax := strings.Split (string (buff),"\n")

	fmt.Printf ("%d\n" , len (datax))

	for _, pp := range datax {
//		data_row := strings.Split (pp,delimit,-1)
		data_row := strings.Split (pp,delimit)
		if (1 < (len (data_row))) {
		key := data_row[0]
		dict_aa[key] = unit_gen_proc (data_row[1],data_row[2],data_row[3])
			}
		}

	fmt.Printf ("%d\n" , len (dict_aa))
	return (dict_aa)
}

// ----------------------------------------------------------------
// [6]:
func text_read_proc (text_file string) map[string](map[string]string){
	delimit := "\t"
	dict_aa := text_read_proc_exec (text_file,delimit)

	return (dict_aa)
}

// ----------------------------------------------------------------
func get_current_date_proc () string {
	now := time.Now ()
	fmt.Printf ("%s\t" ,now)
	fmt.Printf ("%d-%d-%d\n" ,now.Year (),now.Month(),now.Day())
	today := strconv.Itoa (now.Year()) + "-" +
		fmt.Sprintf ("%d",now.Month()) + "-" +
		strconv.Itoa (now.Day())

	return	today
}

// ----------------------------------------------------------------
func dict_update_proc (dict_aa map[string](map[string]string),
	key string,population_in int) map[string](map[string]string) {

	fmt.Printf ("key = %s\n", key)

	name_aa := dict_aa[key]["name"]
	unit_aa := make (map[string]string)
	unit_aa["name"] = name_aa
	unit_aa["population"] = strconv.Itoa (population_in)
	unit_aa["date_mod"] = get_current_date_proc ()

	dict_aa[key] = unit_aa

	return (dict_aa)
}

// ----------------------------------------------------------------
// [8]:
func csv_write_proc (text_file string,dict_aa map[string](map[string]string)){
	delimit := ","
	str_out := dict_to_string_proc (dict_aa,delimit)
	ioutil.WriteFile (text_file, []byte(str_out), 0666)
}

// ----------------------------------------------------------------
// [10]:
func csv_read_proc (text_file string) map[string](map[string]string){
	delimit := ","

	dict_aa := text_read_proc_exec (text_file,delimit)
	return (dict_aa)
}

// ----------------------------------------------------------------
