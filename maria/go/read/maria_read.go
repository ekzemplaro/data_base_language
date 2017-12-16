// ----------------------------------------------------------------
//
//	maria_read.go
//
//					Dec/04/2017
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")
	// Create the database handle, confirm driver is present
	db, _ := sql.Open ("mysql", "scott:tiger123@/city")
	defer db.Close()

	sql_str := "select id,name,population,date_mod from cities order by id"


rows, err := db.Query(sql_str)
if err != nil {
	fmt.Println(err)
}
defer rows.Close()

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

if err := rows.Err(); err != nil {
	fmt.Println(err)
	}

	fmt.Println ("*** 終了 ***")
}

// ----------------------------------------------------------------
