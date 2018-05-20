// ----------------------------------------------------------------
//
//	text_manipulate.go
//
//					May/20/2018
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
	"reflect"
)

// ----------------------------------------------------------------
func display_record_proc (key string, unit_aa map[string]interface{}) {
	fmt.Printf ("%s\t",key)
	fmt.Printf ("%s\t",unit_aa["name"])
	vv := reflect.TypeOf(unit_aa["population"])
//	fmt.Println(v)

	population := 0
	if (vv.Kind() == reflect.Int) {
		population = unit_aa["population"].(int)
		} else {
	pf := unit_aa["population"].(float64)
	population = int(pf)
		}

	str_population := strconv.Itoa(population)
	fmt.Printf ("%s\t",str_population)
	fmt.Printf ("%s\n",unit_aa["date_mod"])
}

// ----------------------------------------------------------------
func dict_display_proc (dict_aa map[string](map[string]interface{})) {
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
func unit_gen_proc (name string,population int,date_mod string) map[string]interface{} {
	unit_aa := make (map[string]interface{})
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
func dict_to_string_proc (dict_aa map[string](map[string]interface{}),delimit string) string {
	str_out := ""
	for key,value := range dict_aa {
	population := value["population"].(int)
	str_population := strconv.Itoa(population)
	str_out += join_proc (key,value["name"].(string),
		str_population,value["date_mod"].(string),delimit)
	}

	return	(str_out)
}

// ----------------------------------------------------------------
// [4]:
func text_write_proc (text_file string,dict_aa map[string](map[string]interface{})){
	delimit := "\t"
	str_out := dict_to_string_proc (dict_aa,delimit)
	ioutil.WriteFile (text_file, []byte(str_out), 0666)
}

// ----------------------------------------------------------------
// [6-4]:
func text_read_proc_exec (text_file,delimit string) map[string](map[string]interface{}){
	dict_aa := make (map[string](map[string]interface{}))


	buff,_ := ioutil.ReadFile(text_file)

//	datax := strings.Split (string (buff),"\n",-1)
	datax := strings.Split (string (buff),"\n")

	fmt.Printf ("%d\n" , len (datax))

	for _, pp := range datax {
//		data_row := strings.Split (pp,delimit,-1)
		data_row := strings.Split (pp,delimit)
		if (1 < (len (data_row))) {
		key := data_row[0]
		str_population := data_row[2]
		population,_ := strconv.Atoi(str_population)
		dict_aa[key] = unit_gen_proc (data_row[1],population,data_row[3])
			}
		}

	fmt.Printf ("%d\n" , len (dict_aa))
	return (dict_aa)
}

// ----------------------------------------------------------------
// [6]:
func text_read_proc (text_file string) map[string](map[string]interface{}){
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
func dict_update_proc (dict_aa map[string](map[string]interface{}),
	key string,population_in int) map[string](map[string]interface{}) {

	fmt.Printf ("key = %s\n", key)

	name_aa := dict_aa[key]["name"].(string)
	unit_aa := make (map[string]interface{})
	unit_aa["name"] = name_aa
	unit_aa["population"] = population_in
	unit_aa["date_mod"] = get_current_date_proc ()

	dict_aa[key] = unit_aa

	return (dict_aa)
}

// ----------------------------------------------------------------
// [8]:
func csv_write_proc (text_file string,dict_aa map[string](map[string]interface{})){
	delimit := ","
	str_out := dict_to_string_proc (dict_aa,delimit)
	ioutil.WriteFile (text_file, []byte(str_out), 0666)
}

// ----------------------------------------------------------------
// [10]:
func csv_read_proc (text_file string) map[string](map[string]interface{}){
	delimit := ","

	dict_aa := text_read_proc_exec (text_file,delimit)
	return (dict_aa)
}

// ----------------------------------------------------------------
