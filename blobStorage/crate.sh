az group create \
    --name $RESOURCE_GROUP \
    --location $LOCATION 

# create a storage account
az storage account create \
    --name $STORAGE_ACCOUNT_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Standard_ZRS \
    --encryption-services blob


az account list --output table

az ad signed-in-user show --query id -o tsv | az role assignment create \
    --role "Storage Blob Data Contributor" \
    --assignee @- \
    --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Storage/storageAccounts/$STORAGE_ACCOUNT_NAME"

az storage container create \
    --account-name $STORAGE_ACCOUNT_NAME \
    --name $STORAGE_CONTAINER_NAME \
    --auth-mode login

az storage blob upload \
    --account-name  $STORAGE_ACCOUNT_NAME\
    --container-name $STORAGE_CONTAINER_NAME \
    --name helloworld \
    --file ./helloworld \
    --auth-mode login

az storage blob list \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container-name $STORAGE_CONTAINER_NAME \
    --output table \
    --auth-mode login

az storage blob download \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container-name $STORAGE_CONTAINER_NAME \
    --name helloworld \
    --file ./downloaded\
    --auth-mode login

azcopy login
azcopy copy './testfile/*' '$CONTAINER_URL'


