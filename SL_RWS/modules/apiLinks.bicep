

resource service_POSAPIMResource_name_unlimited_501546B9_E3B8_411F_AEE3_8711909A9EFA 'Microsoft.ApiManagement/service/products/apiLinks@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: '501546B9-E3B8-411F-AEE3-8711909A9EFA'
  properties: {
    apiId: service_POSAPIMResource_name_echo_api.id
  }
  dependsOn: [

    service_POSAPIMResource_name_resource

  ]
}

resource service_POSAPIMResource_name_starter_A1EB9257_3922_406D_BA58_7A51B93704BC 'Microsoft.ApiManagement/service/products/apiLinks@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: 'A1EB9257-3922-406D-BA58-7A51B93704BC'
  properties: {
    apiId: service_POSAPIMResource_name_echo_api.id
  }
  dependsOn: [

    service_POSAPIMResource_name_resource

  ]
}
