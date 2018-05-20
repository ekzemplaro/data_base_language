// ----------------------------------------------------------------
//
//	maria_create.go
//
//					Mar/20/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]interface{}) {
	dict_aa := make (map[string](map[string]interface{}))

	dict_aa["t3321"] = unit_gen_proc ("岡山",397152,"1921-10-12")
	dict_aa["t3322"] = unit_gen_proc ("倉敷",459671,"1921-9-25")
	dict_aa["t3323"] = unit_gen_proc ("津山",621597,"1921-6-14")
	dict_aa["t3324"] = unit_gen_proc ("玉野",952178,"1921-4-30")
	dict_aa["t3325"] = unit_gen_proc ("笠岡",417859,"1921-6-24")
	dict_aa["t3326"] = unit_gen_proc ("井原",213592,"1921-1-10")
	dict_aa["t3327"] = unit_gen_proc ("総社",482967,"1921-10-19")
	dict_aa["t3328"] = unit_gen_proc ("高梁",785231,"1921-12-28")
	dict_aa["t3329"] = unit_gen_proc ("新見",259718,"1921-5-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	db, _ := sql.Open ("mysql","scott:tiger123@/city")
	defer db.Close ()

	_, err := db.Exec ("drop table cities")
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
		name := dict_aa[key]["name"]
		population := dict_aa[key]["population"]
		date_mod := dict_aa[key]["date_mod"]
		sql_str :="insert into cities (id,name,population,date_mod) values (?,?,?,?)"
		_, err = db.Exec (sql_str,key,name,population,date_mod)
		if err != nil {
			fmt.Println (err)
			}
		}

	fmt.Println ("*** 終了 ***")
}


// ----------------------------------------------------------------
