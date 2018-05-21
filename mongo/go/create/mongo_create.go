

package main

import (
	"fmt"
	"os"
	mgo "gopkg.in/mgo.v2"
//	"gopkg.in/mgo.v2/bson"
	"time"
)

type City struct {
//	ID        bson.ObjectId `bson:"_id,omitempty"`
	Key	string
	Name	string
	Population	string
	Date_mod	time.Time
}

var (
	IsDrop = true
)

func main() {
	fmt.Fprintf (os.Stderr,"*** 開始 ***\n")
	session, err := mgo.Dial("127.0.0.1")
	if err != nil {
		panic(err)
	}

	defer session.Close()

	session.SetMode(mgo.Monotonic, true)

	db_name := "city_db"
	// Drop Database
	if IsDrop {
		err = session.DB(db_name).DropDatabase()
		if err != nil {
			panic(err)
		}
	}


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

	// Insert Datas
	tt,_ := time.Parse("2006/01/02","1921/07/04")
	err = c.Insert(
	&City{Key: "t1161",Name: "さいたま", Population: "54381", Date_mod: tt})

	tt,_ = time.Parse("2006/01/02","1921/09/05")
	err = c.Insert(
	&City{Key: "t1162", Name: "所沢", Population: "96237", Date_mod: tt})
	tt,_ = time.Parse("2006/01/02","1921/12/17")
	err = c.Insert(
	&City{Key: "t1163",Name: "越谷", Population: "81967", Date_mod: tt})
	err = c.Insert(
	&City{Key: "t1164",Name: "久喜", Population: "43258", Date_mod: time.Now()})
	err = c.Insert(
	&City{Key: "t1165",Name: "熊谷", Population: "25361", Date_mod: time.Now()},
	&City{Key: "t1166",Name: "秩父", Population: "84363", Date_mod: time.Now()},
	&City{Key: "t1167",Name: "川越", Population: "62364", Date_mod: time.Now()},
	&City{Key: "t1168",Name: "和光", Population: "61438", Date_mod: time.Now()},
	&City{Key: "t1169",Name: "新座", Population: "4591", Date_mod: time.Now()})

	if err != nil {
		panic(err)
	}


	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

