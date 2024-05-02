param location string=resourceGroup().location
param sqlServerName string ='sql${uniqueString(resourceGroup().id)}'
param sqlDBName string='sqldatabase${uniqueString(resourceGroup().id)}'

param administratorLogin string= 'rashmi'

@secure()
param administratorPassword string= newGuid()


resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorPassword
  }
}

resource sqlDB 'Microsoft.Sql/servers/databases@2022-05-01-preview'  = {
  parent: sqlServer
  name: sqlDBName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}
