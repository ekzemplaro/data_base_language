// ----------------------------------------------------------------
//
//	postgre_update.go
//
//					May/23/2018
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

	str_connect := "user=scott dbname=city password=tiger123 sslmode=disable"
	db, err := sql.Open("postgres",str_connect)
	defer db.Close()

	today := get_current_date_proc ()

	fmt.Println (today)

	sql_str := "update cities set population ='"
	sql_str += strconv.Itoa(population_in) + "',date_mod = '"
	sql_str += today + "' where id = '" + key_in + "'"
	fmt.Println(sql_str)

	_, err = db.Exec(sql_str)

	if err != nil {
		fmt.Println(err)
		}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
