echo "Validate that you are in default account"
echo "Run command: az account show"
echo "`n"
echo "OUTPUT"
az account show
Write-Output "--------------------------------------------------------------------"
echo "`n"
echo "Creating resource group"
echo "Run command: az group create --name demoRG --location eastus"
echo "`n"
echo "OUTPUT"
az group create --name demoRGCoream --location eastus
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Create Container Registry under the new resource group created"
echo "Run command: az acr create --resource-group demoRG --name DemoAcr --sku Basic"
echo "`n"
echo "OUTPUT"
az acr create --resource-group demoRGCoream --name DemoAcrCoream --sku Basic
Write-Output "--------------------------------------------------------------------"
echo "`n"

echo "Login to Container Registry created"
echo "Run command: az acr login --name DemoAcram"
echo "`n"
echo "OUTPUT"
az acr login --name DemoAcrCoream
Write-Output "--------------------------------------------------------------------"
echo "`n"
echo "Login to Container Registry created"
echo "az ad sp create-for-rbac --skip-assignment -n demoClusterAM"
echo "`n"
echo "OUTPUT"
az ad sp create-for-rbac --skip-assignment -n demoClusterCoreAM
Write-Output "--------------------------------------------------------------------"
echo "`n"