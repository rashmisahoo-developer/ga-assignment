param location string=resourceGroup().location
param sqlServerName string ='sqlServer46342146'
param sqlDBName string='sqlDatabase46342146'

@description('Username for administrator login')
param administratorLogin string

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
