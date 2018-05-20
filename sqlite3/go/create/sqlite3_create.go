// ----------------------------------------------------------------
//
//	sqlite3_create.go
//
//					May/19/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"database/sql"
	_ "github.com/mattn/go-sqlite3"
)

// ----------------------------------------------------------------
func data_prepare_proc () map[string](map[string]string) {
	dict_aa := make (map[string](map[string]string))

	dict_aa["t0711"] = unit_gen_proc ("郡山","71853","1921-5-12")
	dict_aa["t0712"] = unit_gen_proc ("会津若松","45281","1921-2-25")
	dict_aa["t0713"] = unit_gen_proc ("白河","62397","1921-9-14")
	dict_aa["t0714"] = unit_gen_proc ("福島","59178","1921-4-30")
	dict_aa["t0715"] = unit_gen_proc ("喜多方","43819","1921-3-24")
	dict_aa["t0716"] = unit_gen_proc ("二本松","27593","1921-1-10")
	dict_aa["t0717"] = unit_gen_proc ("いわき","48917","1921-11-19")
	dict_aa["t0718"] = unit_gen_proc ("相馬","78231","1921-12-28")
	dict_aa["t0719"] = unit_gen_proc ("須賀川","25978","1921-8-14")

	return (dict_aa)
}

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")

	dict_aa := data_prepare_proc ()

	db_file := "/var/tmp/sqlite3/cities.db"
	db, err := sql.Open("sqlite3", db_file)
	defer db.Close ()

	_, err = db.Exec ("drop table cities")
	if err != nil {
		fmt.Println (err)
		}

//	sql_str := "create table cities (id varchar(10),name varchar(20),population int,date_mod date)"
	sql_str := "create table cities (id varchar(10),name varchar(20),population int,date_mod string)"
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
