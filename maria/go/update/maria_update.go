// ----------------------------------------------------------------
//
//	maria_update.go
//
//					Dec/04/2017
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	"strconv"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")
	key_in := os.Args[1]
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("key_in = %s\t" , key_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	db, _ := sql.Open ("mysql", "scott:tiger123@/city")
	defer db.Close()

	today := get_current_date_proc ()

	fmt.Println (today)

_, err := db.Exec("UPDATE cities SET population = ?,date_mod = ? WHERE id = ?", population_in,today,key_in)
if err != nil {
	fmt.Println(err)
}


if err != nil {
	fmt.Println(err)
	}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
