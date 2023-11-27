
resource service_POSAPIMResource_name_echo_api 'Microsoft.ApiManagement/service/apis@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'echo-api'
  properties: {
    displayName: 'Echo API'
    apiRevision: '1'
    subscriptionRequired: true
    serviceUrl: 'http://echoapi.cloudapp.net/api'
    path: 'echo'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}


resource service_POSAPIMResource_name_pospoc 'Microsoft.ApiManagement/service/apis@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'pospoc'
  properties: {
    displayName: 'POSPOC'
    apiRevision: '1'
    subscriptionRequired: true
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
    path: apis_pospoc_path
  }
}

resource service_POSAPIMResource_name_starter_echo_api 'Microsoft.ApiManagement/service/products/apis@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_starter
  name: 'echo-api'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_unlimited_echo_api 'Microsoft.ApiManagement/service/products/apis@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_unlimited
  name: 'echo-api'
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}


