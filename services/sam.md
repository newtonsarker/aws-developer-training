# SAM (Serverless Application Model)
Read https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html

# Working with SAM
```shell

# Install SAM CLI
brew tap aws/tap
brew install aws-sam-cli

# Verify installation
sam --version

# Create a new SAM application in interactive mode
sam init
cd lambda-hello-world

# Build the application
sam validate
sam build

# Invoke the function locally
sam local invoke HelloWorldFunction --event events/event.json

# Run the application locally
sam local start-api

# Create pipeline
sam pipeline init --bootstrap
```
Commands you can use next
=========================
[*] Create pipeline: cd lambda-hello-world && sam pipeline init --bootstrap
[*] Validate SAM template: cd lambda-hello-world && sam validate
[*] Test Function in the Cloud: cd lambda-hello-world && sam sync --stack-name {stack-name} --watch

