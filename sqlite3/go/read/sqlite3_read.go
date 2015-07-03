// ----------------------------------------------------------------
//
//	sqlite3_read.go
//
//					Jun/03/2015
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

	db, err := sql.Open("sqlite3", "/var/tmp/sqlite3/cities.db")
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
	fmt.Printf ("%s\t%s\t%d\t%s\n",id, name,population,date_mod)
	}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
