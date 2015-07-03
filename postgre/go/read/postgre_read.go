// ----------------------------------------------------------------
//
//	postgre_read.go
//
//					Jun/05/2015
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"database/sql"
	_ "github.com/lib/pq"
)

// ----------------------------------------------------------------
func main() {
	fmt.Println ("*** 開始 ***")

	db, _ := sql.Open("postgres","user=scott password=tiger dbname=city sslmode=disable")
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
