// ----------------------------------------------------------------
//
//	sqlite3_update.go
//
//					Jun/03/2015
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	"strconv"
	"database/sql"
	_ "github.com/mattn/go-sqlite3"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")

	key_in := os.Args[1]
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("key_in = %s\t" , key_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	db, err := sql.Open("sqlite3", "/var/tmp/sqlite3/cities.db")
	if err != nil {
		fmt.Println ("*** error ***")
		fmt.Println(err)
		return
		}

	today := get_current_date_proc ()

	fmt.Println (today)

	sql_str := "UPDATE cities SET population = ?,date_mod = ? WHERE id = ?"

	_,err = db.Exec (sql_str,population_in,today,key_in)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
