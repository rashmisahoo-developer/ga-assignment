param location string = resourceGroup().location
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'webAppDeploy'
  location: location
  dependsOn: [
    appServicePlan
  ]
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
}
}

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'appservice'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}
