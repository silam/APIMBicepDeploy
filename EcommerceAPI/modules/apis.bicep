

//apis
resource service_Dev_RWSAPID_MGMT_name_ecommerce_api_1 'Microsoft.ApiManagement/service/apis@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'ecommerce-api-1'
  properties: {
    displayName: 'Ecommerce API'
    apiRevision: '1'
    subscriptionRequired: true
    path: 'ecommerce'
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
    apiVersion: '1'
    apiVersionSetId: Microsoft_ApiManagement_service_apiVersionSets_service_Dev_RWSAPID_MGMT_name_6400cc1b9f2a2e165b526e42.id
  }
}
