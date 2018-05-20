// ----------------------------------------------------------------
//
//	sqlite3_read.go
//
//					May/20/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"database/sql"
	_ "github.com/mattn/go-sqlite3"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")

	dict_aa := make (map[string](map[string]interface{}))

	db_file := "/var/tmp/sqlite3/cities.db"
	db, err := sql.Open("sqlite3", db_file)
	if err != nil {
		fmt.Println ("*** error ***")
		fmt.Println(err)
		return
		}

	sql_str := "select id,name,population,date_mod from cities"

	rows, err := db.Query (sql_str)
	if err != nil {
		fmt.Println(err)
	}
	defer rows.Close ()

	for rows.Next() {
	var id string
	var name string 
	var population int
	var date_mod string 
	if err := rows.Scan(&id,&name,&population,&date_mod); err != nil {
		fmt.Println(err)
		}

	dict_aa[id] = unit_gen_proc (name,population,date_mod)
	}

	dict_display_proc (dict_aa)

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
