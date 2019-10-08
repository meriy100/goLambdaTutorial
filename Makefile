.PHONY: deps clean build

deps:
	go get -u ./...

clean: 
	rm -rf ./hello-world/hello-world
	
build:
	GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world

package:
    sam package --template-file goLambdaTutorial/template.yaml --output-template-file goLambdaTutorial/output-template.yaml --s3-bucket template-store --profile meriy100

deploy:
    sam deploy --template-file goLambdaTutorial/output-template.yaml --stack-name go-lambda --capabilities CAPABILITY_IAM --profile meriy100