//apiVersionSets
resource Microsoft_ApiManagement_service_apiVersionSets_service_Dev_RWSAPID_MGMT_name_6400cc1b9f2a2e165b526e42 'Microsoft.ApiManagement/service/apiVersionSets@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: '6400cc1b9f2a2e165b526e42'
  properties: {
    displayName: 'Ecommerce API'
    versioningScheme: 'Header'
    versionHeaderName: 'X-Api-Version'
  }
}
