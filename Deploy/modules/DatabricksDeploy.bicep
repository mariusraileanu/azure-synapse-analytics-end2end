param resourceLocation string
param databricksWorkspaceName string 
param databricksManagedResourceGroupName string 
param databricksPricingTier string

//RBAC Role IDs
var azureRBACReaderRoleID = 'acdd72a7-3385-48ef-bd42-f606fba81ae7' //Reader Role

//Databricks workspace
resource r_databricksWorkspaceName 'Microsoft.Databricks/workspaces@2021-04-01-preview' = {
  name: databricksWorkspaceName
  location: resourceLocation
  sku: {
    name: databricksPricingTier
  }
  properties:{
    managedResourceGroupId: subscriptionResourceId('Microsoft.Resources/resourceGroups', databricksManagedResourceGroupName)
    authorizations: []
  }
}

output databricksWorkspaceName string = databricksWorkspaceName
output workspaceUrl string = r_databricksWorkspaceName.properties.workspaceUrl
