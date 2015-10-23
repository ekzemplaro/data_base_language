// ----------------------------------------------------------------
//
//	postgre_update.go
//
//					Jun/05/2015
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	"strconv"
	"database/sql"
	_ "github.com/lib/pq"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")
	key_in := os.Args[1]
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("key_in = %s\t" , key_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	db, _ := sql.Open("postgres","user=scott password=tiger dbname=city sslmode=disable")
	defer db.Close()

	today := get_current_date_proc ()

	fmt.Println (today)

// _, err := db.Exec("UPDATE cities SET population = ?,date_mod = ? WHERE id = ?", population_in,today,key_in)
_, err := db.Exec("UPDATE cities SET population = $1,date_mod = $2 WHERE id = $3", population_in,today,key_in)
if err != nil {
	fmt.Println(err)
}


if err != nil {
	fmt.Println(err)
	}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
