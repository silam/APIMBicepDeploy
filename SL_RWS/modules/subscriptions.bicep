
resource service_POSAPIMResource_name_6557e586e17c190043070001 'Microsoft.ApiManagement/service/subscriptions@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: '6557e586e17c190043070001'
  properties: {
    ownerId: service_POSAPIMResource_name_1.id
    scope: service_POSAPIMResource_name_starter.id
    state: 'active'
    allowTracing: false
    displayName: subscriptions_6557e586e17c190043070001_displayName
  }
}




resource service_POSAPIMResource_name_6557e586e17c190043070002 'Microsoft.ApiManagement/service/subscriptions@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: '6557e586e17c190043070002'
  properties: {
    ownerId: service_POSAPIMResource_name_1.id
    scope: service_POSAPIMResource_name_unlimited.id
    state: 'active'
    allowTracing: false
    displayName: subscriptions_6557e586e17c190043070002_displayName
  }
}



resource service_POSAPIMResource_name_master 'Microsoft.ApiManagement/service/subscriptions@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'master'
  properties: {
    scope: '${service_POSAPIMResource_name_resource.id}/'
    displayName: 'Built-in all-access subscription'
    state: 'active'
    allowTracing: false
  }
}

