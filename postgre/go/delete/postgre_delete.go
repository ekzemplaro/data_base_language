// ----------------------------------------------------------------
//
//	postgre_delete.go
//
//					Jun/05/2015
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

	db, _ := sql.Open("postgres","user=scott password=tiger dbname=city sslmode=disable")
	defer db.Close ()


	_, err := db.Exec ("delete from cities WHERE id = $1", key_in)
	if err != nil {
		fmt.Println(err)
		}


	if err != nil {
		fmt.Println (err)
		}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
