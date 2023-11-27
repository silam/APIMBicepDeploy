

resource service_POSAPIMResource_name_starter 'Microsoft.ApiManagement/service/products@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'starter'
  properties: {
    displayName: 'Starter'
    description: 'Subscribers will be able to run 5 calls/minute up to a maximum of 100 calls/week.'
    subscriptionRequired: true
    approvalRequired: false
    subscriptionsLimit: 1
    state: 'published'
  }
}

resource service_POSAPIMResource_name_unlimited 'Microsoft.ApiManagement/service/products@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_resource
  name: 'unlimited'
  properties: {
    displayName: 'Unlimited'
    description: 'Subscribers have completely unlimited access to the API. Administrator approval is required.'
    subscriptionRequired: true
    approvalRequired: true
    subscriptionsLimit: 1
    state: 'published'
  }
}
