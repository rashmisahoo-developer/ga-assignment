resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'webAppDeploy'
  location: resourceGroup().id
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: 'webServerFarms.id'
  }
}
