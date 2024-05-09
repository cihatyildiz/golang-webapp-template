package main

import (
	"net/http"

	"github.com/cihatyildiz/golang-webapp-template/models"
	"github.com/cihatyildiz/golang-webapp-template/routes"
	"github.com/cihatyildiz/golang-webapp-template/utils"
)

func main() {
	models.Init()
	utils.LoadTemplates("templates/*.html")
	r := routes.NewRouter()
	http.Handle("/", r)
	http.ListenAndServe(":8080", nil)
}
