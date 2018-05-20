// ----------------------------------------------------------------
//
//	go_common/url_manipulate.go
//
//					Mar/20/2018
//
// ----------------------------------------------------------------
package main

import (
	"io/ioutil"
	"log"
	"io"
	"net/http"
	"os"
	"fmt"
//	"encoding/json"
//	"reflect"
)

// ----------------------------------------------------------------
func url_get_proc (url string) string {
	resp, err := http.Get (url)

	json_str := ""

	if err != nil {
		log.Fatalln(err)
		fmt.Printf("%s", err)
		os.Exit(1) 
	} else {
		defer resp.Body.Close()
		 contents, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			fmt.Printf("%s", err)
			os.Exit(1)
			}
		json_str := string(contents)
//		fmt.Printf("%s\n", json_str)
	return (json_str)

		}

	return (json_str)
}

// ----------------------------------------------------------------
func putRequest(url string, data io.Reader)  {
	client := &http.Client{}
	req, err := http.NewRequest(http.MethodPut, url, data)
	if err != nil {
		// handle error
		log.Fatal(err)
	}
	_, err = client.Do(req)
	if err != nil {
		// handle error
		log.Fatal(err)
	}


}

// ----------------------------------------------------------------
func deleteRequest(url string, data io.Reader)  {
	client := &http.Client{}
	req, err := http.NewRequest(http.MethodDelete, url, data)
	if err != nil {
		// handle error
		log.Fatal(err)
	}
	_, err = client.Do(req)
	if err != nil {
		// handle error
		log.Fatal(err)
	}


}

// ----------------------------------------------------------------
