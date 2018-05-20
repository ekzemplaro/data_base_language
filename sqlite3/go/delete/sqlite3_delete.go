// ----------------------------------------------------------------
//
//	sqlite3_delete.go
//
//					May/19/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	"database/sql"
	_ "github.com/mattn/go-sqlite3"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")

	key_in := os.Args[1]

	fmt.Printf ("key_in = %s\n" , key_in)

	db_file := "/var/tmp/sqlite3/cities.db"
	db, err := sql.Open("sqlite3", db_file)
	if err != nil {
		fmt.Println ("*** error ***")
		fmt.Println(err)
		return
		}


	sql_str := "delete from cities WHERE id = ?"

	_,err = db.Exec (sql_str,key_in)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
