// ---------------------------------------------------------------
//
//	redis_create.go
//
//					Dec/01/2010
// ---------------------------------------------------------------
package main 

import (
	"json"
	"log";
	"fmt";
	"redis"
)

// ---------------------------------------------------------------
type city_tuple struct {
	name string
	population int
	date_mod string
}

// ---------------------------------------------------------------
func read_single_proc (str_key string) {
//	spec := redis.DefaultSpec().Db(0).Password("");
	spec := redis.DefaultSpec().Host("host_redis")
	client, e := redis.NewSynchClientWithSpec (spec)
	value, e := client.Get(str_key)

	fmt.Printf ("%s\t%s\n",str_key, fmt.Sprintf("%s", value))

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
func create_single_proc (str_key string,maa city_tuple) {
	spec := redis.DefaultSpec().Host("host_redis");
	client, e := redis.NewSynchClientWithSpec (spec);

	output, _ := json.Marshal(maa)
	out_str := string (output)
	client.Set (str_key, []byte(out_str))
	if e != nil { log.Stderr ("failed to create the client", e); return }
}
// ---------------------------------------------------------------
func create_proc () {

	var m00 = city_tuple{"福井",41613,"1985-7-21"}
	var m01 = city_tuple{"敦賀",32425,"1985-10-9"}
	var m02 = city_tuple{"小浜",75184,"1985-9-15"}
	var m03 = city_tuple{"大野",24773,"1985-8-4"}
	var m04 = city_tuple{"勝山",51632,"1985-2-12"}
	var m05 = city_tuple{"鯖江",18468,"1985-1-21"}
	var m06 = city_tuple{"あわら",99715,"1985-3-18"}
	var m07 = city_tuple{"越前",85154,"1985-7-27"}
	var m08 = city_tuple{"坂井",33737,"1985-10-15"}

	create_single_proc ("1851",m00);
	create_single_proc ("1852",m01);
	create_single_proc ("1853",m02);
	create_single_proc ("1854",m03);
	create_single_proc ("1855",m04);
	create_single_proc ("1856",m05);
	create_single_proc ("1857",m06);
	create_single_proc ("1858",m07);
	create_single_proc ("1859",m08);
}

// ---------------------------------------------------------------
func main () {
	fmt.Printf ("*** 開始 ***\n")

	create_proc ();

	read_proc ();

	fmt.Printf ("*** 終了 ***\n")
}

// ---------------------------------------------------------------
