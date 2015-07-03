// ----------------------------------------------------------------
//
//	postgre_create.go
//
//					Jun/05/2015
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
//	"os"
	"database/sql"
	_ "github.com/lib/pq"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]string) {
	dict_aa := make (map[string](map[string]string))

	dict_aa["t3461"] = unit_gen_proc ("広島","39612","1921-5-12")
	dict_aa["t3462"] = unit_gen_proc ("福山","45271","1921-9-25")
	dict_aa["t3463"] = unit_gen_proc ("東広島","16597","1921-6-14")
	dict_aa["t3464"] = unit_gen_proc ("呉","35278","1921-4-28")
	dict_aa["t3465"] = unit_gen_proc ("尾道","81759","1921-6-24")
	dict_aa["t3466"] = unit_gen_proc ("竹原","26392","1921-1-10")
	dict_aa["t3467"] = unit_gen_proc ("三次","45267","1921-10-19")
	dict_aa["t3468"] = unit_gen_proc ("大竹","78231","1921-12-21")
	dict_aa["t3469"] = unit_gen_proc ("府中","27918","1921-5-7")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	db, _ := sql.Open("postgres","user=scott password=tiger dbname=city sslmode=disable")
	defer db.Close ()

	_, err := db.Exec ("drop table cities")
	if err != nil {
		fmt.Println (err)
		}

//	sql_str := "create table cities (id varchar(10),name varchar(20),population int,date_mod date)"
	sql_str := "create table cities (id varchar(10),name varchar(20),population int,date_mod varchar(20))"
	fmt.Println (sql_str)

	_, err = db.Exec (sql_str)
	if err != nil {
		fmt.Println (err)
		}

	for key,_ := range dict_aa {
		name := dict_aa[key]["name"]
		population := dict_aa[key]["population"]
		date_mod := dict_aa[key]["date_mod"]
		sql_str :="insert into cities (id,name,population,date_mod) values ($1,$2,$3,$4)"
		_, err = db.Exec (sql_str,key,name,population,date_mod)
		if err != nil {
			fmt.Println (err)
			}
		}

	fmt.Println ("*** 終了 ***")
}


// ----------------------------------------------------------------
