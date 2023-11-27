
resource service_POSAPIMResource_name_administrators 'Microsoft.ApiManagement/service/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'administrators'
  properties: {
    displayName: 'Administrators'
    description: 'Administrators is a built-in group containing the admin email account provided at the time of service creation. Its membership is managed by the system.'
    type: 'system'
  }
}

resource service_POSAPIMResource_name_developers 'Microsoft.ApiManagement/service/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'developers'
  properties: {
    displayName: 'Developers'
    description: 'Developers is a built-in group. Its membership is managed by the system. Signed-in users fall into this group.'
    type: 'system'
  }
}


resource service_POSAPIMResource_name_guests 'Microsoft.ApiManagement/service/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'guests'
  properties: {
    displayName: 'Guests'
    description: 'Guests is a built-in group. Its membership is managed by the system. Unauthenticated users visiting the developer portal fall into this group.'
    type: 'system'
  }
}



resource service_POSAPIMResource_name_starter_administrators 'Microsoft.ApiManagement/service/products/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: 'administrators'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_unlimited_administrators 'Microsoft.ApiManagement/service/products/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: 'administrators'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}


resource service_POSAPIMResource_name_starter_developers 'Microsoft.ApiManagement/service/products/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: 'developers'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_unlimited_developers 'Microsoft.ApiManagement/service/products/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: 'developers'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_starter_guests 'Microsoft.ApiManagement/service/products/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: 'guests'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}




resource service_POSAPIMResource_name_unlimited_guests 'Microsoft.ApiManagement/service/products/groups@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: 'guests'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}



