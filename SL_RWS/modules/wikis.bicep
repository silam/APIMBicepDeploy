
resource service_POSAPIMResource_name_echo_api_default 'Microsoft.ApiManagement/service/apis/wikis@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_echo_api
  name: 'default'
  properties: {
    documents: []
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_pospoc_default 'Microsoft.ApiManagement/service/apis/wikis@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_pospoc
  name: 'default'
  properties: {
    documents: []
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}





resource service_POSAPIMResource_name_unlimited_default 'Microsoft.ApiManagement/service/products/wikis@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: 'default'
  properties: {
    documents: []
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}


resource service_POSAPIMResource_name_starter_default 'Microsoft.ApiManagement/service/products/wikis@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: 'default'
  properties: {
    documents: []
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}
