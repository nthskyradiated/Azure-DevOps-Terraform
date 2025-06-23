#!/bin/bash

RESOURCE_GROUP_NAME=tfstate-rg
STAGE_SA_ACCOUNT=tfstagebackendpumpfactory
DEV_SA_ACCOUNT=tfdevbackendpumpfactory
CONTAINER_NAME=tfstate
AZURE_REGION=eastus2

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $AZURE_REGION

# Create storage account for staging environment
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STAGE_SA_ACCOUNT --sku Standard_LRS --encryption-services blob

# Create storage account for dev environment
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $DEV_SA_ACCOUNT --sku Standard_LRS --encryption-services blob

# Create blob container for staging environment
az storage container create --name $CONTAINER_NAME --account-name $STAGE_SA_ACCOUNT

# Create blob container for dev environment
az storage container create --name $CONTAINER_NAME --account-name $DEV_SA_ACCOUNT