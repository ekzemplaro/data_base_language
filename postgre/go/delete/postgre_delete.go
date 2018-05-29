// ----------------------------------------------------------------
//
//	postgre_delete.go
//
//					May/23/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	"database/sql"
	_ "github.com/lib/pq"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")
	key_in := os.Args[1]

	fmt.Printf ("key_in = %s\n" , key_in)

	str_connect := "user=scott dbname=city password=tiger123 sslmode=disable"

	db, err := sql.Open ("postgres", str_connect)
	defer db.Close ()

	sql_str := "delete from cities WHERE id = '" + key_in + "'"
	fmt.Println (sql_str)
	_, err = db.Exec (sql_str)

	if err != nil {
		fmt.Println(err)
		}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
