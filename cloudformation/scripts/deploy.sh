#!/usr/bin/env bash

REGION="eu-north-1"
STACK_NAME="trainingstack"
BUCKET_NAME="cf.$REGION.$STACK_NAME"

TEMPLATE_FILE="templates/main.yaml"
PARAMETERS_FILE="parameters/dev.json"
ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)

# Create the S3 bucket if it doesn't exist
if aws s3api head-bucket --bucket "$BUCKET_NAME" 2>/dev/null; then
  echo "S3 bucket $BUCKET_NAME already exists"
else
  aws s3api create-bucket \
      --bucket $BUCKET_NAME \
      --region $REGION \
      --create-bucket-configuration LocationConstraint=$REGION
  echo "S3 bucket $BUCKET_NAME created"
fi

# Upload CloudFormation templates to the S3 bucket
echo "Uploading CloudFormation templates to S3 bucket: $BUCKET_NAME"
aws s3 cp parameters/ "s3://$BUCKET_NAME/parameters/" --recursive --region $REGION
aws s3 cp scripts/ "s3://$BUCKET_NAME/scripts/" --recursive --region $REGION
aws s3 cp templates/ "s3://$BUCKET_NAME/templates/" --recursive --region $REGION

# Deploy the CloudFormation stack
aws cloudformation deploy \
  --template-file $TEMPLATE_FILE \
  --stack-name $STACK_NAME \
  --region $REGION \
  --parameter-overrides file://$PARAMETERS_FILE \
  --capabilities CAPABILITY_NAMED_IAM