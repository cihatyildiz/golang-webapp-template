# Go parameters
GOCMD = go
GOBUILD = $(GOCMD) build
GOCLEAN = $(GOCMD) clean
GOTEST = $(GOCMD) test
GOGET = $(GOCMD) get

# Main package name
MAIN_PACKAGE = cihatyildiz/golang-webapp-template

# Output binary name
BINARY_NAME = myapp

# Build targets
all: clean build
build:
	$(GOBUILD) -o $(BINARY_NAME) -v $(MAIN_PACKAGE)
clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
test:
	$(GOTEST) -v ./...
run:
	$(GOBUILD) -o $(BINARY_NAME) -v $(MAIN_PACKAGE)
	./$(BINARY_NAME)
deps:
	$(GOGET) -v $(MAIN_PACKAGE)

docker-build:
	docker build -t myapp-image .

docker-run:
	docker run -p 8080:8080 myapp-image

push:
	docker tag myapp-image <artifactory-url>/<repository>/<image-name>:<tag>
	docker push <artifactory-url>/<repository>/<image-name>:<tag>

.PHONY: all build clean test run deps