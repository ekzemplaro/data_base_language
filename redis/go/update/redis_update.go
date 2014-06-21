// ---------------------------------------------------------------
//
//	redis_update.go
//
//					Nov/25/2010
// ---------------------------------------------------------------
package main 

import (
	"os"
	"log"
	"fmt"
	"redis"
	"json"
	"strconv"
	"time"
)

// ---------------------------------------------------------------
type City_tuple struct {
	Name string
	Population int
	Date_mod string
}

// ---------------------------------------------------------------
func read_single_proc (str_key string) {
	spec := redis.DefaultSpec().Host("host_redis")
	client, e := redis.NewSynchClientWithSpec (spec)
	value, e := client.Get(str_key)

	json_str := fmt.Sprintf("%s", value)

	var city = City_tuple{}
	json.Unmarshal([]byte(json_str), &city)
	fmt.Printf( "%s\t%s\t%d\t%s\n",
		str_key, city.Name, city.Population, city.Date_mod)


	if e != nil { log.Stderr ("failed to create the client", e); return }
	client.Quit ()
}
// ---------------------------------------------------------------
func read_proc () {
	for id := 1851; id < 1860; id++ {
		id_str := fmt.Sprintf("%d",id)
		read_single_proc (id_str)
	}
}

// ---------------------------------------------------------------
func update_proc (id_in,population_in int) {
	str_key := strconv.Itoa (id_in)
	spec := redis.DefaultSpec().Host("host_redis")
	client, _ := redis.NewSynchClientWithSpec (spec)

	value, _ := client.Get(str_key)

	json_str := fmt.Sprintf("%s", value)
	fmt.Sprintf("%s\n", json_str)

	var city = City_tuple{}
	json.Unmarshal([]byte(json_str), &city)
	fmt.Printf( "%s\t%s\t%d\t%s\n",
		str_key, city.Name, city.Population, city.Date_mod)

	now := time.LocalTime ()
	today := strconv.Itoa64 (now.Year) + "-" +
		strconv.Itoa (now.Month) + "-" +
		strconv.Itoa (now.Day)

	var maa = City_tuple{city.Name,population_in,today}

	output, _ := json.Marshal(maa)
	out_str := string (output)
	client.Set (str_key, []byte(out_str))

	client.Quit ()
	fmt.Printf ("*** update_proc *** end ***\n")
}
// ---------------------------------------------------------------
func main () {
	fmt.Printf ("*** 開始 ***\n")

	id_in,_ := strconv.Atoi (os.Args[1])
	population_in,_ := strconv.Atoi (os.Args[2])

	fmt.Printf ("%d\t%d\n",id_in,population_in)

	update_proc (id_in,population_in)

	read_proc ()

	fmt.Printf ("*** 終了 ***\n")
}

// ---------------------------------------------------------------
