package main
import (
	"fmt"
	"log"
	"net/http"
)
func helloHandler(w http.ResponseWriter, r *http.Request) {
	 clientIP := r.RemoteAddr
	 w.Header().Set("Content-Type", "text/plain")
	 fmt.Fprintf(w, "Hello, from jibachh!\n", clientIP)
}
func main() {
	http.HandleFunc("/", helloHandler)
	 port := ":8080"
	 fmt.Printf("Server is running on port %s\n", port)
	 if err := http.ListenAndServe(port, nil); err != nil {
		 log.Fatalf("Failed to start server: %v", err)
	 }
}
