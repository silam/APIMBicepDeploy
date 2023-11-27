

resource service_POSAPIMResource_name_default 'Microsoft.ApiManagement/service/portalconfigs@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'default'
  properties: {
    enableBasicAuth: true
    signin: {
      require: false
    }
    signup: {
      termsOfService: {
        requireConsent: false
      }
    }
    delegation: {
      delegateRegistration: false
      delegateSubscription: false
    }
    cors: {
      allowedOrigins: []
    }
    csp: {
      mode: 'disabled'
      reportUri: []
      allowedSources: []
    }
  }
}


resource service_POSAPIMResource_name_delegation 'Microsoft.ApiManagement/service/portalsettings@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'delegation'
  properties: {
    subscriptions: {
      enabled: false
    }
    userRegistration: {
      enabled: false
    }
  }
}
