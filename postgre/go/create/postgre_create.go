// ----------------------------------------------------------------
//
//	postgre_create.go
//
//					May/23/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"database/sql"
	_ "github.com/lib/pq"
	"strconv"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]interface{}) {
	dict_aa := make (map[string](map[string]interface{}))

	dict_aa["t3461"] = unit_gen_proc ("広島",97452,"1921-11-12")
	dict_aa["t3462"] = unit_gen_proc ("福山",49271,"1921-8-25")
	dict_aa["t3463"] = unit_gen_proc ("東広島",63597,"1921-4-14")
	dict_aa["t3464"] = unit_gen_proc ("呉",95178,"1921-2-30")
	dict_aa["t3465"] = unit_gen_proc ("尾道",41749,"1921-6-24")
	dict_aa["t3466"] = unit_gen_proc ("竹原",21582,"1921-1-10")
	dict_aa["t3467"] = unit_gen_proc ("三次",48297,"1921-10-19")
	dict_aa["t3468"] = unit_gen_proc ("大竹",78531,"1921-12-28")
	dict_aa["t3469"] = unit_gen_proc ("府中",25978,"1921-5-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	str_connect := "user=scott dbname=city password=tiger123 sslmode=disable"
	db, err := sql.Open("postgres", str_connect)
	defer db.Close ()

	_, err = db.Exec ("drop table cities")
	if err != nil {
		fmt.Println (err)
		}

	sql_str := "create table cities (id varchar(10),name varchar(20),population int,date_mod date)"
	fmt.Println (sql_str)

	_, err = db.Exec (sql_str)
	if err != nil {
		fmt.Println (err)
		}

	for key,_ := range dict_aa {
		name := dict_aa[key]["name"].(string)
		population := dict_aa[key]["population"].(int)
		date_mod := dict_aa[key]["date_mod"].(string)
		sql_str :="insert into cities values ('" + key + "','" + name + "','" + strconv.Itoa(population) + "','" + date_mod + "')"
		fmt.Println (sql_str)
		_, err = db.Exec (sql_str)
		if err != nil {
			fmt.Println (err)
			}
		}

	fmt.Println ("*** 終了 ***")
}


// ----------------------------------------------------------------
