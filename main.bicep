param location string=resourceGroup().location
param sqlServerName string ='sqlServer463421461'
param sqlDBName string='sqlDatabase463421461'

@description('Username for administrator login')
param administratorLogin string

@secure()
param administratorPassword string= newGuid()


module sqldbAndserver 'sqlModule/SqlDatabase.bicep'={
  name: 'sqldbMain'
  params: {
    administratorLogin: administratorLogin
    administratorPassword: administratorPassword
    location: location
    sqlDBName: sqlDBName
    sqlServerName: sqlServerName
  }
}
