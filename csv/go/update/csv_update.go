// ----------------------------------------------------------------
//
//	csv_update.go
//
//					May/20/2018
//
// ----------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	"strconv"
)

// ----------------------------------------------------------------
func main() {
	fmt.Printf ("*** 開始 ***\n")

	csv_file := os.Args[1]
	id_in := os.Args[2]
	population_in,_ := strconv.Atoi (os.Args[3])

	fmt.Printf ("id_in = %s\t" , id_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	var dict_aa = csv_read_proc (csv_file)

	dict_aa = dict_update_proc (dict_aa,id_in,population_in )

	csv_write_proc (csv_file,dict_aa)

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
