


resource apiManagement 'Microsoft.ApiManagement/service@2020-12-01' = {
  name: '${apimServiceName}-${env}'
  location: resourceGroup().location
  tags:tagValues
  sku: {
    name: sku
    capacity: skuCount
  }
  properties: {
    publisherName: publisherName
    publisherEmail: publisherEmail
  }
  identity: {
    type: 'SystemAssigned'
  }
}

// create Application Insigts for logger

resource workspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' = {
  name: '${workspaceName}-${env}'
  location: location
  tags:tagValues
  properties: {
    sku: {
      name: 'Free'
    }
  }
}
resource applicationInsights 'Microsoft.Insights/components@2020-02-02-preview' = {
  name: '${appInsightsName}-${env}'
  location: location
  tags:tagValues
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspace.id
  }
}

// if you already have appInsights, refer to it

// resource appInsights 'Microsoft.Insights/components@2020-02-02-preview' existing = {
//   name: '${appInsightsName}-${env}'
// }

// Create Logger

resource apiManagementLogger 'Microsoft.ApiManagement/service/loggers@2020-12-01' = {
  name: '${appInsightsName}-${env}'
  parent: apiManagement
  properties: {
    loggerType: 'applicationInsights'
    description: 'Logger resources to APIM'
    credentials: {
      instrumentationKey: appInsights.properties.InstrumentationKey
    }
  }
}


//enable API Management instance diagnostics

resource apimInstanceDiagnostics 'diagnostics@2020-12-01' = {
  name: 'applicationinsights'
  parent: apiManagement
  properties: {
    loggerId: apiManagementLogger.id
    alwaysLog: 'allErrors'
    logClientIp: true
    sampling: {
      percentage: 100
      samplingType: 'fixed'
    }
  }
}

// create a product

resource product 'products@2021-01-01-preview' = {
  name: 'pospoc'
  properties: {
    displayName: 'pos poc product'
    description: 'for a collection of API request needed for POS management'
    subscriptionRequired: true
    approvalRequired: false
    state: 'notPublished'
  }
  resource api1 'apis@2021-01-01-preview' = {
    name: 'api-v1'
  }
  resource api2 'apis@2021-01-01-preview' = {
    name: 'search-v1'      
  }
  resource product_group_administrators 'groups@2021-01-01-preview' = {
    name: 'administrators'
  }
}

// Custom policy on a product

resource apimProductPolicy 'policies@2019-12-01' = {
  name: '${apimProduct.name}/policy'
  properties: {
    format: 'rawxml'
    value: '<policies><inbound><base /></inbound><backend><base /></backend><outbound><set-header name="Server" exists-action="delete" /><set-header name="X-Powered-By" exists-action="delete" /><set-header name="X-AspNet-Version" exists-action="delete" /><base /></outbound><on-error><base /></on-error></policies>'
  }
}

// Subscription

resource apimSubscription 'subscriptions@2021-01-01-preview' = {
  name: 'Management'
  properties: {
    displayName: 'Management'
    primaryKey: 'custom-primary-key-${uniqueString(resourceGroup().id)}'
    secondaryKey: 'custom-secondary-key-${uniqueString(resourceGroup().id)}'
    state: 'active'
    scope: '/products/${product_pospoc.id}'
  }
}


// Add a user
resource apimUser 'users@2019-12-01' = {
  name: 'rws-user'
  properties: {
    firstName: 'Si'
    lastName: 'Lam'
    state: 'active'
    email: 'si.lam@redwingshoes.com'
  }
}

// add a group

resource rwsGroup 'groups@2020-06-01-preview' = {
  name: 'rwsGroup'
  properties: {
    displayName: 'rws Group Name'
    description: 'rws group description'
  }
}

//API version set
resource apiVersionset 'apiVersionSets@2019-01-01' = {
  name: 'api'
  properties: {
    displayName: 'APIVersionSet'
    versioningScheme: 'Segment'
  }
}

resource api 'apis@2021-01-01-preview' = {
  name: 'api-v1'
  properties: {
    displayName: 'Profile API'      
    subscriptionRequired: true
    path: 'api'
    protocols: [
      'https'
    ]
    isCurrent: true
    apiVersion: 'v1'
    apiVersionSetId: apiVersionset.id
  }


  resource logger_api 'diagnostics@2021-01-01-preview' = {
    name: 'applicationinsights'
    properties: {
      alwaysLog: 'allErrors'
      httpCorrelationProtocol: 'Legacy'
      verbosity: 'information'
      logClientIp: true
      loggerId: apiManagementLogger.id
      sampling: {
        samplingType: 'fixed'
        percentage: 100
      }
      frontend: {
        request: {
          headers: []
          body: {
            bytes: 0
          }
        }
        response: {
          headers: []
          body: {
            bytes: 0
          }
        }
      }
      backend: {
        request: {
          headers: []
          body: {
            bytes: 0
          }
        }
        response: {
          headers: []
          body: {
            bytes: 0
          }
        }
      }
    }
    resource applicationinsights 'loggers@2018-01-01' = {
      name: '${appInsightsName}-${env}'
    }
  }


  //API Operation with policy:

  resource operation 'operations@2021-01-01-preview' = {
    name: 'search'
    properties: {
      displayName: 'Search'
      method: 'GET'
      urlTemplate: '/something'
      templateParameters: []
      request: {
        queryParameters: [
          {
            name: 'id'
            type: 'String'
            values: [
              '1052'
            ]
          }
        ]
        headers: []
        representations: []
      }
      responses: []
    }
    resource policy 'policies@2021-01-01-preview' = {
      name: 'policy'
      properties: {
        value: '<policies>\r\n  <inbound>\r\n    <rewrite-uri template="/NZBSearch" copy-unmatched-params="true" />\r\n    <base />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
        format: 'xml'
      }
    }
  }

  //Policy for all operations:

  resource policy_all_operations 'policies@2021-01-01-preview' = {
    name: 'policy'
    properties: {
      value: concat('<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="', BaseUrl, '" />\r\n    <set-header name="Subscription-Key" exists-action="override">\r\n      <value>{{ApiKey}}</value>\r\n    </set-header>\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>')
      format: 'xml'
    }
  }

