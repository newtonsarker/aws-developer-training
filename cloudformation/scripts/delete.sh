#!/usr/bin/env bash

REGION="eu-north-1"
STACK_NAME="trainingstack"
BUCKET_NAME="cf.$REGION.$STACK_NAME"


# Delete the CloudFormation stack
aws cloudformation delete-stack --stack-name lambda-hello-world --region "$REGION"
aws cloudformation delete-stack --stack-name "$STACK_NAME" --region "$REGION"


# Check if the S3 bucket exists and delete it if it does
if aws s3 ls "s3://$BUCKET_NAME" 2>&1 | grep -q 'NoSuchBucket'; then
  echo "S3 bucket $BUCKET_NAME does not exist"
else
  echo "Deleting S3 bucket: $BUCKET_NAME"
  aws s3 rb s3://$BUCKET_NAME --force
fi