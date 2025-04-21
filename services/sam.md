# SAM (Serverless Application Model)
Read https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html

# Working with SAM
```shell

# Install SAM CLI
brew tap aws/tap
brew install aws-sam-cli

# Verify installation
sam --version

# Create a new SAM application in interactive mode and validate it
sam init
cd lambda-hello-world
sam validate

# Build the application
sam build --use-container

# Invoke the function locally
sam local invoke HelloWorldFunction --event events/event.json

# Run the application locally
sam local start-api

```

```shell
# Deploy the application to AWS without a pipeline and authentication
sam deploy --guided
#Configuring SAM deploy
#======================
#
#        Looking for config file [samconfig.toml] :  Found
#        Reading default arguments  :  Success
#
#        Setting default arguments for 'sam deploy'
#        =========================================
#        Stack Name [lambda-hello-world]: 
#        AWS Region [eu-north-1]: 
#        #Shows you resources changes to be deployed and require a 'Y' to initiate deploy
#        Confirm changes before deploy [Y/n]: 
#        #SAM needs permission to be able to create roles to connect to the resources in your template
#        Allow SAM CLI IAM role creation [Y/n]: 
#        #Preserves the state of previously provisioned resources when an operation fails
#        Disable rollback [y/N]: 
#        HelloWorldFunction has no authentication. Is this okay? [y/N]: y
#        Save arguments to configuration file [Y/n]: 
#        SAM configuration file [samconfig.toml]: 
#        SAM configuration environment [default]: 

```
Commands you can use next
=========================
[*] Create pipeline: cd lambda-hello-world && sam pipeline init --bootstrap
[*] Validate SAM template: cd lambda-hello-world && sam validate
[*] Test Function in the Cloud: cd lambda-hello-world && sam sync --stack-name {stack-name} --watch

