

resource service_POSAPIMResource_name_1 'Microsoft.ApiManagement/service/users@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: '1'
  properties: {
    firstName: 'Administrator'
    email: 'si.lam@redwingshoes.com'
    state: 'active'
    identities: [
      {
        provider: 'Azure'
        id: 'si.lam@redwingshoes.com'
      }
    ]
    lastName: users_1_lastName
  }
}



resource service_POSAPIMResource_name_administrators_1 'Microsoft.ApiManagement/service/groups/users@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_administrators
  name: '1'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_developers_1 'Microsoft.ApiManagement/service/groups/users@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_developers
  name: '1'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}


