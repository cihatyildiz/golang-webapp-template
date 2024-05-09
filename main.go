package main

import (
	"net/http"

	"github.com/cihatyildiz/golang-webapp-template/internal/models"
	"github.com/cihatyildiz/golang-webapp-template/internal/routes"
	"github.com/cihatyildiz/golang-webapp-template/internal/utils"
)

func main() {
	models.Init()
	utils.LoadTemplates("templates/*.html")
	r := routes.NewRouter()
	http.Handle("/", r)
	http.ListenAndServe(":8080", nil)
}
