#!/usr/bin/env bash

REGION="eu-north-1"

# Validate main CloudFormation template
aws cloudformation validate-template --template-body file://templates/main.yaml --region $REGION

# Validate nested CloudFormation templates
#for template in templates/*.yaml; do
#  aws cloudformation validate-template --template-body file://$template --region $REGION
#done
