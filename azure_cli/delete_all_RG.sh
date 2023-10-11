#!/bin/bash

# Get the list of resource group names
rg_names=$(az group list --query "[?!(name == 'blobTutorialGroup' || name == 'sitecore-second_group')].name" -o tsv)

# Iterate through the list of resource group names
for rg_name in $rg_names
do
  echo "Deleting resource group $rg_name..."
  az group delete --name $rg_name --yes --no-wait
done

echo "Deletion commands issued. Use 'az group list' to verify deletion."
