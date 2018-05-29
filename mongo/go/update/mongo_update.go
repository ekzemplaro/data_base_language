// ---------------------------------------------------------------
//
//	mongo_update.go
//
//					May/22/2018
// ---------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	mgo "gopkg.in/mgo.v2"
	"gopkg.in/mgo.v2/bson"
	"time"
	"strconv"
)

type City struct {
	ID        bson.ObjectId `bson:"_id,omitempty"`
	Key      string
	Name      string
	Population     int
	Date_mod time.Time
}

// ---------------------------------------------------------------
func main() {
	fmt.Fprintf (os.Stderr,"*** 開始 ***\n")
	key_in := os.Args[1]
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("key_in = %s\t" , key_in)
	fmt.Printf ("population_in = %d\n" , population_in)

	session, err := mgo.Dial("127.0.0.1")
	if err != nil {
		panic(err)
	}

	defer session.Close()

	session.SetMode(mgo.Monotonic, true)

	db_name := "city_db"


	cc := session.DB(db_name).C("saitama")

	colQuerier := bson.M{"key": key_in}
	change := bson.M{"$set": bson.M{"population": population_in, "date_mod": time.Now()}}
	err = cc.Update(colQuerier, change)
	if err != nil {
		panic(err)
	}

	var results []City
	err = cc.Find(bson.M{"key": key_in}).Sort("key").All(&results)

	if err != nil {
		panic(err)
	}
	fmt.Println("Results All: ", results)

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ---------------------------------------------------------------
