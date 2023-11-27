
resource service_POSAPIMResource_name_signin 'Microsoft.ApiManagement/service/portalsettings@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'signin'
  properties: {
    enabled: false
  }
}

resource service_POSAPIMResource_name_signup 'Microsoft.ApiManagement/service/portalsettings@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'signup'
  properties: {
    enabled: true
    termsOfService: {
      enabled: false
      consentRequired: false
    }
  }
}
