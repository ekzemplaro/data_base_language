// ---------------------------------------------------------------
//
//	mongo_delete.go
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

	fmt.Printf ("key_in = %s\n" , key_in)

	session, err := mgo.Dial("127.0.0.1")
	if err != nil {
		panic(err)
	}

	defer session.Close()

	session.SetMode(mgo.Monotonic, true)

	db_name := "city_db"

	cc := session.DB(db_name).C("saitama")

	colQuerier := bson.M{"key": key_in}
	err = cc.Remove(colQuerier)
	if err != nil {
		panic(err)
	}

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ---------------------------------------------------------------
