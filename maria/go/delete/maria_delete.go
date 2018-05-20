// ----------------------------------------------------------------
//
//	maria_delete.go
//
//					Dec/04/2017
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")
	key_in := os.Args[1]

	fmt.Printf ("key_in = %s\n" , key_in)

	db, _ := sql.Open ("mysql", "scott:tiger123@/city")
	defer db.Close ()


	_, err := db.Exec ("delete from cities WHERE id = ?", key_in)
	if err != nil {
		fmt.Println(err)
		}


	if err != nil {
		fmt.Println (err)
		}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
