// ---------------------------------------------------------------
//
//	mongo_read.go
//
//					May/21/2018
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
	Population     string
	Date_mod time.Time
}


// ---------------------------------------------------------------
func main() {
	fmt.Fprintf (os.Stderr,"*** 開始 ***\n")
	session, err := mgo.Dial("127.0.0.1")
	if err != nil {
		panic(err)
	}

	defer session.Close()

	session.SetMode(mgo.Monotonic, true)

	db_name := "city_db"

	c := session.DB(db_name).C("saitama")

	// Index
	index := mgo.Index{
		Key:        []string{"name", "population"},
		Unique:     true,
		DropDups:   true,
		Background: true,
		Sparse:     true,
	}

	err = c.EnsureIndex(index)
	if err != nil {
		panic(err)
	}

	// Query All
	var results []City
	err = c.Find(bson.M{}).Sort("key").All(&results)

	if err != nil {
		panic(err)
	}

	fmt.Println("len(results): ", len(results))

//	fmt.Println("Results All: ", results)

	for _,value := range results {
//		fmt.Println(value)
		str_out := value.Key + "\t" + value.Name + "\t" + value.Population + "\t" + value.Date_mod.String()
		fmt.Println(str_out)
		}

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ---------------------------------------------------------------
