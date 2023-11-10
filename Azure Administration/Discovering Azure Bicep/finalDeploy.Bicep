param location string = resourceGroup().location
param webAppName string

var sku = 'S1'
var linuxFxVersion = 'php|7.4'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'AwesomeAppServicePlan'
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webAppPortal 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      ftpsState: 'FtpsOnly'
    }
    httpsOnly: true
  }
  identity: {
    type: 'SystemAssigned'
  }
}
