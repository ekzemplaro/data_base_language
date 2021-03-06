// ---------------------------------------------------------------
//
//	mongo_read.go
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
	session, err := mgo.Dial("127.0.0.1")
	if err != nil {
		panic(err)
	}

	defer session.Close()

	session.SetMode(mgo.Monotonic, true)

	db_name := "city_db"

	cc := session.DB(db_name).C("saitama")

	var results []City
	err = cc.Find(bson.M{}).Sort("key").All(&results)

	if err != nil {
		panic(err)
	}

	fmt.Println("len(results): ", len(results))


	for _,value := range results {
		str_out := value.Key + "\t" + value.Name + "\t" + strconv.Itoa(value.Population) + "\t" + value.Date_mod.String()
		fmt.Println(str_out)
		}

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ---------------------------------------------------------------
