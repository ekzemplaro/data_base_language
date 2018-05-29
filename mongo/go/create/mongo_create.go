// ---------------------------------------------------------------
//
//	mongo_create.go
//
//					May/22/2018
// ---------------------------------------------------------------
package main

import (
	"fmt"
	"os"
	mgo "gopkg.in/mgo.v2"
	"time"
)

type City struct {
	Key	string
	Name	string
	Population	int
	Date_mod	time.Time
}

var (
	IsDrop = true
)

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
	if IsDrop {
		err = session.DB(db_name).DropDatabase()
		if err != nil {
			panic(err)
		}
	}


	cc := session.DB(db_name).C("saitama")

	dict_aa := data_prepare_proc ()
	for key,value := range dict_aa {
		name := value["name"].(string)
		population := value["population"].(int)
		date_mod := value["date_mod"].(string)
		tt,_ := time.Parse("2006-1-2",date_mod)
		err = cc.Insert(
		&City{Key: key,Name: name, Population: population, Date_mod: tt})
		if err != nil {
			panic(err)
		}
	}

	fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ---------------------------------------------------------------
func data_prepare_proc () map[string](map[string]interface{}) {
	dict_aa := make (map[string](map[string]interface{}))

	dict_aa["t1161"] = unit_gen_proc ("さいたま",91854,"1921-5-19")
	dict_aa["t1162"] = unit_gen_proc ("所沢",36578,"1921-6-20")
	dict_aa["t1163"] = unit_gen_proc ("越谷",18394,"1921-4-14")
	dict_aa["t1164"] = unit_gen_proc ("久喜",76512,"1921-7-31")
	dict_aa["t1165"] = unit_gen_proc ("熊谷",61459,"1921-3-28")
	dict_aa["t1166"] = unit_gen_proc ("秩父",85623,"1921-1-10")
	dict_aa["t1167"] = unit_gen_proc ("川越",15947,"1921-4-19")
	dict_aa["t1168"] = unit_gen_proc ("和光",68231,"1921-7-28")
	dict_aa["t1169"] = unit_gen_proc ("新座",71948,"1921-6-8")

	return (dict_aa)
}

// ---------------------------------------------------------------
