// ----------------------------------------------------------------
//
//	couch_read.go
//
//					Dec/21/2010
//
// ----------------------------------------------------------------
package main

import (
	"couch-go.googlecode.com/hg"
	"fmt"
	"os"
	"strconv"
)

// ----------------------------------------------------------------
type cities struct {
	id int
	name string
	Population int
	Date_mod string
}

type completerecord struct {
	Rev string "_rev" // useful only for Retrieve and Edit
	Cities [] cities
}

// ----------------------------------------------------------------
func main () {

	fmt.Printf ("*** 開始 ***\n")

	id_in,_ := strconv.Atoi (os.Args[1])
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("id_in = %d\t" , id_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	db, err := couch.NewDatabase ("cdbd026", "5984", "city")
//	db, err := couch.NewDatabase ("localhost", "5984", "city")

	id_doc := "cities"
	rr := new (completerecord)
	rev, err := db.Retrieve (id_doc, rr)

	if err != nil {
		fmt.Printf ("*** error ***\n")
	}

	fmt.Printf ("rev = %s\n",rev)

	rr.Cities[0].Population = population_in
	rr.Cities[0].Date_mod = "2010-12-22"

	for _, pp := range rr.Cities {
		fmt.Printf( "%d\t%v\t%d\t%s\n",
		pp.id, pp.name, pp.Population, pp.Date_mod )
		}

	id_aa, rev_aa, err_aa := db.InsertWith(rr,"cities")

	fmt.Printf ("id_aa = %s\n",id_aa)
	fmt.Printf ("rev_aa = %s\n",rev_aa)

	if err_aa != nil {
		fmt.Printf ("*** error ***\n")
	}


	id_bb := "cities"
	rr_bb := new(completerecord)
	rev_bb, err_bb := db.Retrieve (id_bb, rr_bb)
	if err_bb != nil {
		fmt.Printf ("*** error ***\n")
	}

	fmt.Printf ("rev_bb = %s\n",rev_bb)

	for _, pp := range rr.Cities {
		fmt.Printf( "%d\t%v\t%d\t%s\n",
		pp.id, pp.name, pp.Population, pp.Date_mod )
		}

	fmt.Printf ("*** 終了 ***\n")
}

// ----------------------------------------------------------------
