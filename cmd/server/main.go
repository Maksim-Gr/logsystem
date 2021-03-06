package main

import (
	"log"

	"github.com/Maksim-Gr/logsystem/internal/server"
)

func main() {
	srv := server.NewHTTPServer(":8080")
	log.Fatal(srv.ListenAndServe())
}
