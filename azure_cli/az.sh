az deployment group create \
  --name MyDeployment \
  --resource-group $RG_NAME \
  --template-file tempazuredeploy.json \
  --parameters adminUsername=$USERNAME \
  --parameters adminPassword=$PASSWORD \
  --parameters dnsLabelPrefix=$DNS_LABEL_PREFIX


az deployment group create \
  --name MyDeployment \
  --resource-group $RG_NAME \
  --template-file tempazuredeploy.json \
  --parameters adminUsername=$USERNAME \
  --parameters adminPassword=$PASSWORD \
  --parameters dnsLabelPrefix=$DNS_LABEL_PREFIX

az deployment group delete \
  --name MyDeployment \
  --resource-group $RG_NAME \

  --parameters adminUsername=$USERNAME \
  --parameters adminPassword=$PASSWORD \
  --parameters dnsLabelPrefix=$DNS_LABEL_PREFIX

az vm show \
    --name SimpleWinVM \
    --resource-group $RG_NAME \
    --show-details \
    --query "[publicIps]" \
    --output tsv

IPADDRESS=$(az vm show \
    --name SimpleWinVM \
    --resource-group $RG_NAME \
    --show-details \
    --query "[publicIps]" \
    --output tsv)
