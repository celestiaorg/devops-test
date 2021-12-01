package main

import (
	"log"
	"net/http"
)

func MyHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello World"))
}

func main() {
	port := "8080"

	http.HandleFunc("/", MyHandler)

	done := make(chan bool)
	go http.ListenAndServe(":"+port, nil)
	log.Printf("Server started at port %v", port)
	<-done
}
