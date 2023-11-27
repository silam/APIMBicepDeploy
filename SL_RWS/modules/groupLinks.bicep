
resource service_POSAPIMResource_name_unlimited_EB8293E8_4F14_4B70_97E9_55ACF0852B4C 'Microsoft.ApiManagement/service/products/groupLinks@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: 'EB8293E8-4F14-4B70-97E9-55ACF0852B4C'
  properties: {
    groupId: service_POSAPIMResource_name_guests.id
  }
  dependsOn: [

    service_POSAPIMResource_name_resource

  ]
}

resource service_POSAPIMResource_name_starter_52FC784E_12E4_4358_895D_FC700EA548E5 'Microsoft.ApiManagement/service/products/groupLinks@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: '52FC784E-12E4-4358-895D-FC700EA548E5'
  properties: {
    groupId: service_POSAPIMResource_name_administrators.id
  }
  dependsOn: [

    service_POSAPIMResource_name_resource

  ]
}

resource service_POSAPIMResource_name_unlimited_61C6181D_D806_4114_9DF8_C9FA20F6D952 'Microsoft.ApiManagement/service/products/groupLinks@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: '61C6181D-D806-4114-9DF8-C9FA20F6D952'
  properties: {
    groupId: service_POSAPIMResource_name_administrators.id
  }
  dependsOn: [

    service_POSAPIMResource_name_resource

  ]
}

resource service_POSAPIMResource_name_starter_CF0729CA_3A01_4363_A9E6_231D10E83479 'Microsoft.ApiManagement/service/products/groupLinks@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: 'CF0729CA-3A01-4363-A9E6-231D10E83479'
  properties: {
    groupId: service_POSAPIMResource_name_guests.id
  }
  dependsOn: [

    service_POSAPIMResource_name_resource

  ]
}


resource service_POSAPIMResource_name_starter_45ABCAE0_A8AB_42F5_9949_B2B73C6ECFF8 'Microsoft.ApiManagement/service/products/groupLinks@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: '45ABCAE0-A8AB-42F5-9949-B2B73C6ECFF8'
  properties: {
    groupId: service_POSAPIMResource_name_developers.id
  }
  dependsOn: [

    service_POSAPIMResource_name_resource

  ]
}


resource service_POSAPIMResource_name_unlimited_51D3C418_17E3_4E00_A323_E103189226C6 'Microsoft.ApiManagement/service/products/groupLinks@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: '51D3C418-17E3-4E00-A323-E103189226C6'
  properties: {
    groupId: service_POSAPIMResource_name_developers.id
  }
  dependsOn: [

    service_POSAPIMResource_name_resource

  ]
}
