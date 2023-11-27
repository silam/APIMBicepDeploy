







m operations_61266e5e0a4fed0aecf381cb_type string

@secure()
param operations_consumertransactiondetails_type string

@secure()
param operations_consumertransactiondetails_type_1 string

@secure()
param operations_consumertransactions_type string

@secure()
param operations_consumertransactions_type_1 string

@secure()
param operations_itemcanbepurchasedfromsupplier_type string

@secure()
param operations_itemcanbepurchasedfromsupplier_type_1 string

@secure()
param operations_itemcanbepurchasedfromsupplier_type_2 string

@secure()
param operations_supplieritems_type string

@secure()
param operations_supplieritems_type_1 string

@secure()
param operations_6467bde5321cdcb3e56faf9a_type string

@secure()
param operations_getdata_type string

@secure()
param operations_mockapi_type string

@secure()
param operations_mockapi_type_1 string

@secure()
param operations_get_item_or_style_type string

@secure()
param operations_getproductbyid_type string

@secure()
param diagnostics_local_loggerId string

@secure()
param operations_get_type string

@secure()
param subscriptions_60de355000c3b20035070001_displayName string

@secure()
param subscriptions_60e8435455c84c178816914e_displayName string

@secure()
param subscriptions_60f6cbbd55c84c152c301648_displayName string

@secure()
param subscriptions_60f6cbff55c84c152c30164b_displayName string

@secure()
param subscriptions_6149089455c84c131890a98d_displayName string

@secure()
param subscriptions_621668da55c84c0f1c839b4d_displayName string

@secure()
param subscriptions_649373fddc0adc194816f813_displayName string

@secure()
param subscriptions_650079b6dc0adc11bc6b53fa_displayName string

@secure()
param subscriptions_6556223ddc0adc19c89ffd31_displayName string

@secure()
param users_1_lastName string
param service_Dev_RWSAPID_MGMT_name string = 'Dev-RWSAPID-MGMT'
param virtualNetworks_Tst_CoreInfr_ERVNet_externalid string = '/subscriptions/df6c110c-f8e0-4aee-8e66-4c26aec385a2/resourceGroups/Tst_CoreInfr/providers/Microsoft.Network/virtualNetworks/Tst_CoreInfr_ERVNet'
param components_Dev_RWSAPI_AppIns_externalid string = '/subscriptions/df6c110c-f8e0-4aee-8e66-4c26aec385a2/resourceGroups/Dev-RWSAPI-RG/providers/microsoft.insights/components/Dev-RWSAPI-AppIns'








//service

resource service_Dev_RWSAPID_MGMT_name_resource 'Microsoft.ApiManagement/service@2023-03-01-preview' = {
  name: service_Dev_RWSAPID_MGMT_name
  location: 'North Central US'
  tags: {
    'Created-On': '2023-05-05T15:55:58.8046006Z'
  }
  sku: {
    name: 'Developer'
    capacity: 1
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publisherEmail: 'sri.suryadevara@redwingshoes.com'
    publisherName: 'Red Wing Shoe Company'
    notificationSenderEmail: 'apimgmt-noreply@mail.windowsazure.com'
    hostnameConfigurations: [
      {
        type: 'Proxy'
        hostName: 'dev-rwsapid-mgmt.azure-api.net'
        negotiateClientCertificate: false
        defaultSslBinding: false
        certificateSource: 'BuiltIn'
      }
      {
        type: 'DeveloperPortal'
        hostName: 'apisd-portal.dev.redwingshoes.com'
        keyVaultId: 'https://prd-cert-kv.vault.azure.net/secrets/star-dev-redwingshoes-com'
        negotiateClientCertificate: false
        certificate: {
          expiry: '2024-10-18T23:59:59+00:00'
          thumbprint: '7A6859EA717FC7B3A7655D40340B5E49FAD43453'
          subject: 'CN=*.dev.redwingshoes.com, O="Red Wing Shoe Company, Inc.", L=Red Wing, S=Minnesota, C=US'
        }
        defaultSslBinding: false
        certificateSource: 'KeyVault'
      }
      {
        type: 'Management'
        hostName: 'apismgmt.dev.redwingshoes.com'
        keyVaultId: 'https://prd-cert-kv.vault.azure.net/secrets/star-dev-redwingshoes-com'
        negotiateClientCertificate: false
        certificate: {
          expiry: '2024-10-18T23:59:59+00:00'
          thumbprint: '7A6859EA717FC7B3A7655D40340B5E49FAD43453'
          subject: 'CN=*.dev.redwingshoes.com, O="Red Wing Shoe Company, Inc.", L=Red Wing, S=Minnesota, C=US'
        }
        defaultSslBinding: false
        certificateSource: 'KeyVault'
      }
      {
        type: 'Proxy'
        hostName: 'apisd.dev.redwingshoes.com'
        keyVaultId: 'https://prd-cert-kv.vault.azure.net/secrets/star-dev-redwingshoes-com'
        negotiateClientCertificate: false
        certificate: {
          expiry: '2024-10-18T23:59:59+00:00'
          thumbprint: '7A6859EA717FC7B3A7655D40340B5E49FAD43453'
          subject: 'CN=*.dev.redwingshoes.com, O="Red Wing Shoe Company, Inc.", L=Red Wing, S=Minnesota, C=US'
        }
        defaultSslBinding: true
        certificateSource: 'KeyVault'
      }
    ]
    virtualNetworkConfiguration: {
      subnetResourceId: '${virtualNetworks_Tst_CoreInfr_ERVNet_externalid}/subnets/Subnet-107-Dev-APIM'
    }
    customProperties: {
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Ssl30': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TripleDes168': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'False'
    }
    virtualNetworkType: 'Internal'
    certificates: [
      {
        storeName: 'Root'
        certificate: {
          expiry: '2025-11-02T19:38:04+00:00'
          thumbprint: '67958A70EC37D9C90929FBEFB84A7CC241479C54'
          subject: 'CN=RWSCA-ROOT'
        }
      }
    ]
    natGatewayState: 'Disabled'
    apiVersionConstraint: {}
    publicNetworkAccess: 'Enabled'
    legacyPortalStatus: 'Enabled'
    developerPortalStatus: 'Enabled'
  }
}


//service/apis
resource service_Dev_RWSAPID_MGMT_name_poc_aggregation_mock_ep_2 'Microsoft.ApiManagement/service/apis@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'poc-aggregation-mock-ep-2'
  properties: {
    displayName: 'PoC Aggregation Mock EP 2'
    apiRevision: '1'
    subscriptionRequired: true
    serviceUrl: 'https://apisd.dev.redwingshoes.com/mockEP1234'
    path: 'silam2'
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

//ervice/api-version-sets
resource service_Dev_RWSAPID_MGMT_name_655623cd025e50c9e0c464a7 'Microsoft.ApiManagement/service/api-version-sets@2018-06-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: '655623cd025e50c9e0c464a7'
  properties: {
    displayName: 'Eva Events'
    versioningScheme: 'Header'
    versionHeaderName: 'X-Api-Version'
  }
}


resource Microsoft_ApiManagement_service_apiVersionSets_service_Dev_RWSAPID_MGMT_name_650b5be3529fe1a081f15c5d 'Microsoft.ApiManagement/service/apiVersionSets@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: '650b5be3529fe1a081f15c5d'
  properties: {
    displayName: 'Rws Store Api'
    versioningScheme: 'Header'
    versionHeaderName: 'X-Api-Version'
  }
}

//service/backends
resource service_Dev_RWSAPID_MGMT_name_WebApp_dev_casetracker_app 'Microsoft.ApiManagement/service/backends@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'WebApp_dev-casetracker-app'
  properties: {
    description: 'Dev-CaseTracker-App'
    url: 'https://dev-casetracker-app.azurewebsites.net'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/df6c110c-f8e0-4aee-8e66-4c26aec385a2/resourceGroups/Dev-SandBox-RG/providers/Microsoft.Web/sites/Dev-CaseTracker-App'
  }
}

//Service/groups

resource service_Dev_RWSAPID_MGMT_name_guests 'Microsoft.ApiManagement/service/groups@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'guests'
  properties: {
    displayName: 'Guests'
    description: 'Guests is a built-in group. Its membership is managed by the system. Unauthenticated users visiting the developer portal fall into this group.'
    type: 'system'
  }
}

//service/loggers

resource service_Dev_RWSAPID_MGMT_name_azuremonitor 'Microsoft.ApiManagement/service/loggers@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'azuremonitor'
  properties: {
    loggerType: 'azureMonitor'
    isBuffered: true
  }
}


resource service_Dev_RWSAPID_MGMT_name_dev_motransactionpot_api_key 'Microsoft.ApiManagement/service/namedValues@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'dev-motransactionpot-api-key'
  properties: {
    displayName: 'dev-motransactionpot-api-key'
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}


resource service_Dev_RWSAPID_MGMT_name_RequestPublisherNotificationMessage 'Microsoft.ApiManagement/service/notifications@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'RequestPublisherNotificationMessage'
}

resource service_Dev_RWSAPID_MGMT_name_default 'Microsoft.ApiManagement/service/portalconfigs@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
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

// product

resource service_Dev_RWSAPID_MGMT_name_automation 'Microsoft.ApiManagement/service/products@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'automation'
  properties: {
    displayName: 'Automation'
    description: 'Automation QA'
    subscriptionRequired: true
    approvalRequired: false
    state: 'published'
  }
}

// portal revision

resource service_Dev_RWSAPID_MGMT_name_20220907180037 'Microsoft.ApiManagement/service/portalRevisions@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: '20220907180037'
  properties: {
    isCurrent: false
  }
}



// portal settings

resource service_Dev_RWSAPID_MGMT_name_signin 'Microsoft.ApiManagement/service/portalsettings@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'signin'
  properties: {
    enabled: false
  }
}


resource service_Dev_RWSAPID_MGMT_name_automation_qa 'Microsoft.ApiManagement/service/products@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'automation-qa'
  properties: {
    displayName: 'Automation QA'
    description: 'Used by QA.'
    subscriptionRequired: true
    approvalRequired: false
    state: 'notPublished'
  }
}



// service properties
resource Microsoft_ApiManagement_service_properties_service_Dev_RWSAPID_MGMT_name_dev_motransactionpot_api_key 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'dev-motransactionpot-api-key'
  properties: {
    displayName: 'dev-motransactionpot-api-key'
    value: 'QnS0Y22mmeBa1MbyO9VtjR6QBB0Aj0jSnp3R/Q7k56mVf3asbs6Qkw=='
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }


// service tag

resource service_Dev_RWSAPID_MGMT_name_pos 'Microsoft.ApiManagement/service/tags@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'pos'
  properties: {
    displayName: 'POs'
  }
}


// service template

resource service_Dev_RWSAPID_MGMT_name_NewIssueNotificationMessage 'Microsoft.ApiManagement/service/templates@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'NewIssueNotificationMessage'
  properties: {
    subject: 'Your request $IssueName was received'
    body: '<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Dear $DevFirstName $DevLastName,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Thank you for contacting us. Our API team will review your issue and get back to you soon.</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">\r\n          Click this <a href="http://$DevPortalUrl/issues/$IssueId">link</a> to view or edit your request.\r\n        </p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">Best,</p>\r\n    <p style="font-size:12pt;font-family:\'Segoe UI\'">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>'
    title: 'New issue received (deprecated)'
    description: 'This email is sent to developers after they create a new topic on the Issues page of the developer portal.'
    parameters: [
      {
        name: 'DevFirstName'
        title: 'Developer first name'
      }
      {
        name: 'DevLastName'
        title: 'Developer last name'
      }
      {
        name: 'IssueId'
        title: 'Issue id'
      }
      {
        name: 'IssueName'
        title: 'Issue name'
      }
      {
        name: 'OrganizationName'
        title: 'Organization name'
      }
      {
        name: 'DevPortalUrl'
        title: 'Developer portal URL'
      }
    ]
  }
} 

// service user


resource service_Dev_RWSAPID_MGMT_name_nathan_noll_redwingshoes_com 'Microsoft.ApiManagement/service/users@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'nathan-noll-redwingshoes-com'
  properties: {
    firstName: 'Nathan'
    lastName: 'Noll'
    email: 'nathan.noll@redwingshoes.com'
    state: 'active'
    identities: [
      {
        provider: 'Basic'
        id: 'nathan.noll@redwingshoes.com'
      }
    ]
  }
}




// api

resource service_Dev_RWSAPID_MGMT_name_servicing_stores_publisher 'Microsoft.ApiManagement/service/apis@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'servicing-stores-publisher'
  properties: {
    displayName: 'Servicing Stores Publisher'
    apiRevision: '1'
    subscriptionRequired: true
    serviceUrl: 'https://dev-servicing-store-publisher.azurewebsites.net/servicingstores'
    path: 'servicingStores'
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
    apiVersionSetId: Microsoft_ApiManagement_service_apiVersionSets_service_Dev_RWSAPID_MGMT_name_6261b07254acacfbf0b5a41e.id
  }
}


// api operations
resource service_Dev_RWSAPID_MGMT_name_waste_management_voucher_waste_management_wrapper 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_waste_management_voucher
  name: 'waste-management-wrapper'
  properties: {
    displayName: 'Waste Management Wrapper'
    method: 'POST'
    urlTemplate: '/create'
    templateParameters: []
    description: 'Waste Management Wrapper'
    responses: [
      {
        statusCode: 200
        description: 'null'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}

// api policy
resource service_Dev_RWSAPID_MGMT_name_persons_policy 'Microsoft.ApiManagement/service/apis/policies@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_persons
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <validate-jwt header-name="Authorization" failed-validation-httpcode="401" failed-validation-error-message="Unauthorized. Access token is invalid.">\r\n      <openid-config url="https://login.microsoftonline.com/9ce83773-ccc5-486d-b7a8-75038586fb71/v2.0/.well-known/openid-configuration" />\r\n      <issuers>\r\n        <issuer>9ce83773-ccc5-486d-b7a8-75038586fb71</issuer>\r\n      </issuers>\r\n    </validate-jwt>\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}

// pai release
resource service_Dev_RWSAPID_MGMT_name_orders_641b4500ff905d62052ab644 'Microsoft.ApiManagement/service/apis/releases@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_orders
  name: '641b4500ff905d62052ab644'
  properties: {}
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}

// api scheme

resource service_Dev_RWSAPID_MGMT_name_m3_events_654ceb8ddc0adc10ec277e49 'Microsoft.ApiManagement/service/apis/schemas@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_m3_events
  name: '654ceb8ddc0adc10ec277e49'
  properties: {
    contentType: 'application/vnd.oai.openapi.components+json'
    document: {}
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}



// api tags

resource service_Dev_RWSAPID_MGMT_name_orders_orders 'Microsoft.ApiManagement/service/apis/tags@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_orders
  name: 'orders'
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}


// api wiki
resource service_Dev_RWSAPID_MGMT_name_shipments_publisher_v1_default 'Microsoft.ApiManagement/service/apis/wikis@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_shipments_publisher_v1
  name: 'default'
  properties: {
    documents: []
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}



//diagnostics
resource Microsoft_ApiManagement_service_diagnostics_service_Dev_RWSAPID_MGMT_name_azuremonitor 'Microsoft.ApiManagement/service/diagnostics@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'azuremonitor'
  properties: {
    logClientIp: true
    loggerId: service_Dev_RWSAPID_MGMT_name_azuremonitor.id
    sampling: {
      samplingType: 'fixed'
      percentage: 100
    }
  }
}

//logger

resource service_Dev_RWSAPID_MGMT_name_applicationinsights_dev_rwsapi_appins 'Microsoft.ApiManagement/service/diagnostics/loggers@2018-01-01' = {
  parent: service_Dev_RWSAPID_MGMT_name_applicationinsights
  name: 'dev-rwsapi-appins'
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}

//Microsoft.ApiManagement/service/groups/users@
resource service_Dev_RWSAPID_MGMT_name_developers_nathan_noll_redwingshoes_com 'Microsoft.ApiManagement/service/groups/users@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_developers
  name: 'nathan-noll-redwingshoes-com'
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}


///Microsoft.ApiManagement/service/products/apis


resource service_Dev_RWSAPID_MGMT_name_automation_qa_waste_management_voucher 'Microsoft.ApiManagement/service/products/apis@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_automation_qa
  name: 'waste-management-voucher'
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}



//ApiManagement/service/products/groups

resource service_Dev_RWSAPID_MGMT_name_starter_guests 'Microsoft.ApiManagement/service/products/groups@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_starter
  name: 'guests'
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}


//Microsoft.ApiManagement/service/products/policies


resource service_Dev_RWSAPID_MGMT_name_starter_policy 'Microsoft.ApiManagement/service/products/policies@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_starter
  name: 'policy'
  properties: {
    value: '<!--\r\n            IMPORTANT:\r\n            - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n            - Only the <forward-request> policy element can appear within the <backend> section element.\r\n            - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n            - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n            - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n            - To remove a policy, delete the corresponding policy statement from the policy document.\r\n            - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n            - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n            - Policies are applied in the order of their appearance, from the top down.\r\n        -->\r\n<policies>\r\n  <inbound>\r\n    <rate-limit calls="5" renewal-period="60" />\r\n    <quota calls="100" renewal-period="604800" />\r\n    <base />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}


// wiki
resource service_Dev_RWSAPID_MGMT_name_vendor_sfcc_default 'Microsoft.ApiManagement/service/products/wikis@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_vendor_sfcc
  name: 'default'
  properties: {
    documents: []
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}


//Microsoft.ApiManagement/service/subscriptions

resource service_Dev_RWSAPID_MGMT_name_RedEdge_Server 'Microsoft.ApiManagement/service/subscriptions@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: 'RedEdge-Server'
  properties: {
    scope: service_Dev_RWSAPID_MGMT_name_communications.id
    displayName: 'RedEdge Server Access'
    state: 'active'
    allowTracing: false
  }
}




//Microsoft.ApiManagement/service/apis/diagnostics

resource service_Dev_RWSAPID_MGMT_name_purchasers_subscriber_sfcc_api_applicationinsights 'Microsoft.ApiManagement/service/apis/diagnostics@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_purchasers_subscriber_sfcc_api
  name: 'applicationinsights'
  properties: {
    alwaysLog: 'allErrors'
    httpCorrelationProtocol: 'Legacy'
    verbosity: 'information'
    logClientIp: true
    loggerId: service_Dev_RWSAPID_MGMT_name_dev_rwsapi_appins.id
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
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource

  ]
}

resource service_Dev_RWSAPID_MGMT_name_purchasers_subscriber_sfcc_api_applicationinsights_dev_rwsapi_appins 'Microsoft.ApiManagement/service/apis/diagnostics/loggers@2018-01-01' = {
  parent: service_Dev_RWSAPID_MGMT_name_purchasers_subscriber_sfcc_api_applicationinsights
  name: 'dev-rwsapi-appins'
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_purchasers_subscriber_sfcc_api
    service_Dev_RWSAPID_MGMT_name_resource
  ]
}

//Microsoft.ApiManagement/service/apis/operations/policies

resource service_Dev_RWSAPID_MGMT_name_waste_management_voucher_waste_management_wrapper_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_waste_management_voucher_waste_management_wrapper
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <xsl-transform>\r\n      <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">\r\n        <xsl:template match="/">\r\n          <xsl:variable name="specialValues" select="\' S07392 , S09291 , S10039 , S09801 , S09800 , S08901 , S08485 , S09008 , S09248 \'" />\r\n          <xsl:variable name="siteNumber" select="cXML/Request/OrderRequest/ItemOut/ItemDetail/Extrinsic[@name=\'Red Wing 3-10-2021\']/Extrinsic[@name=\'WM Site Number (S#)\']" />\r\n          <root>\r\n            <apiKey>\r\n              <xsl:value-of select="cXML/Header/Sender/Credential/SharedSecret" />\r\n            </apiKey>\r\n            <programId>\r\n              <xsl:choose>\r\n                <xsl:when test="contains($specialValues, concat(\' \', $siteNumber, \' \'))">a2Z0U000000G91DUAS</xsl:when>\r\n                <xsl:otherwise>\r\n                  <xsl:value-of select="cXML/Header/To/Credential/Identity" />\r\n                </xsl:otherwise>\r\n              </xsl:choose>\r\n            </programId>\r\n            <payloadId>\r\n              <xsl:value-of select="cXML/@payloadID" />\r\n            </payloadId>\r\n            <timeStamp>\r\n              <xsl:value-of select="cXML/@timestamp" />\r\n            </timeStamp>\r\n            <firstName>\r\n                            <xsl:value-of select="cXML/Request/OrderRequest/ItemOut/ItemDetail//*[contains(@name, \'First\')]" />\r\n                        </firstName>\r\n            <lastName>\r\n                            <xsl:value-of select="cXML/Request/OrderRequest/ItemOut/ItemDetail//*[contains(@name, \'Last\')]" /></lastName>\r\n            <emailAddress>\r\n              <xsl:value-of select="cXML/Request/OrderRequest/OrderRequestHeader/Contact/Email" />\r\n            </emailAddress>\r\n            <effectiveOn>\r\n              <xsl:value-of select="cXML/Request/OrderRequest/ItemOut/ItemDetail/ServiceStartDate" />\r\n            </effectiveOn>\r\n            <attributes>\r\n              <code>District</code>\r\n              <value>\r\n                <xsl:value-of select="cXML/Request/OrderRequest/ItemOut/ItemDetail//*[contains(@name,\'Market\')]" />\r\n              </value>\r\n            </attributes>\r\n            <attributes>\r\n              <code>Site</code>\r\n              <value>\r\n                <xsl:value-of select="cXML/Request/OrderRequest/ItemOut/ItemDetail//*[contains(@name,\'WM\')]" />\r\n              </value>\r\n            </attributes>\r\n            <attributes>\r\n              <code>EmployeeID</code>\r\n              <value>\r\n                <xsl:value-of select="cXML/Request/OrderRequest/ItemOut/ItemDetail//*[contains(@name,\'Employee ID\')]" />\r\n              </value>\r\n            </attributes>\r\n            <attributes>\r\n              <code>Purchaseorder</code>\r\n              <value>\r\n                <xsl:value-of select="cXML/Request/OrderRequest/OrderRequestHeader/@orderID" />\r\n              </value>\r\n            </attributes>\r\n            <voucherAmount>\r\n              <xsl:value-of select="cXML/Request/OrderRequest/OrderRequestHeader/Total/Money" />\r\n            </voucherAmount>\r\n          </root>\r\n        </xsl:template>\r\n      </xsl:stylesheet>\r\n    </xsl-transform>\r\n    <set-header name="Content-Type" exists-action="override">\r\n      <value>application/xml</value>\r\n    </set-header>\r\n    <xml-to-json kind="direct" apply="always" consider-accept-header="false" />\r\n    <find-and-replace from="&quot;true&quot;" to="true" />\r\n    <set-body>@{\r\n            JObject requestBody = (JObject)context.Request.Body.As&lt;JObject&gt;(preserveContent: true)["root"];\r\n            requestBody.Property("emailAddress").AddAfterSelf(new JProperty("sendEmail", true));\r\n            requestBody["voucherAmount"] = (decimal)requestBody["voucherAmount"];\r\n\r\n            requestBody["firstName"] = ((string)requestBody["firstName"]).Trim();\r\n            requestBody["lastName"]  = ((string)requestBody["lastName"]).Trim();\r\n\r\n\r\n\r\n            return requestBody.ToString();\r\n        }</set-body>\r\n    <set-header name="X-Api-Version" exists-action="override">\r\n      <value>1</value>\r\n    </set-header>\r\n    <set-header name="Host" exists-action="override">\r\n      <value>apisd.dev.redwingshoes.com</value>\r\n    </set-header>\r\n    <set-header name="Ocp-Apim-Subscription-Key" exists-action="override">\r\n      <value>@(context.Request.Body.As&lt;JObject&gt;(preserveContent: true)["apiKey"].ToString())</value>\r\n    </set-header>\r\n    <set-variable name="payloadId" value="@(context.Request.Body.As&lt;JObject&gt;(preserveContent: true)[&quot;payloadId&quot;])" />\r\n    <set-variable name="timeStamp" value="@(context.Request.Body.As&lt;JObject&gt;(preserveContent: true)[&quot;timeStamp&quot;])" />\r\n    <set-backend-service base-url="https://127.0.0.1/voucher" />\r\n  </inbound>\r\n  <backend>\r\n    <retry condition="@(context.Response.StatusCode == 500 || context.Response.StatusCode == 502 || context.Response.StatusCode == 503)" count="5" interval="7">\r\n      <forward-request />\r\n    </retry>\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n    <set-variable name="responseBody" value="@(context.Response.Body.As&lt;string&gt;().Replace(&quot;\'&quot;, &quot;&quot;))" />\r\n    <choose>\r\n      <when condition="@(context.Response.StatusCode == 201)">\r\n        <set-body>@{\r\n                    return "&lt;cXML payloadID=\'" + context.Variables["payloadId"] + "\' xml:lang=\'en\' timestamp=\'" + context.Variables["timeStamp"] + "\'&gt;&lt;Response&gt;&lt;Status code=\'200\' text=\'OK\' /&gt;&lt;/Response&gt;&lt;/cXML&gt;";\r\n                }</set-body>\r\n      </when>\r\n      <otherwise>\r\n        <set-body>@{\r\n                    return "&lt;cXML payloadID=\'" + context.Variables["payloadId"] + "\' xml:lang=\'en\' timestamp=\'" + context.Variables["timeStamp"] + "\'&gt;&lt;Response&gt;&lt;Status code=\'" + context.Response.StatusCode + "\' text=\'" + context.Variables["responseBody"] + "\' /&gt;&lt;/Response&gt;&lt;/cXML&gt;";\r\n                }</set-body>\r\n      </otherwise>\r\n    </choose>\r\n    <set-header name="Content-Type" exists-action="override">\r\n      <value>text/xml</value>\r\n    </set-header>\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_waste_management_voucher
    service_Dev_RWSAPID_MGMT_name_resource
  ]
}


//Microsoft.ApiManagement/service/apis/operations/tags


resource service_Dev_RWSAPID_MGMT_name_rws_warehouses_api_GetStyleWarehouses_Warehouses 'Microsoft.ApiManagement/service/apis/operations/tags@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_rws_warehouses_api_GetStyleWarehouses
  name: 'Warehouses'
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_rws_warehouses_api
    service_Dev_RWSAPID_MGMT_name_resource
  ]
}


//Microsoft.ApiManagement/service/products/apiLinks@

resource service_Dev_RWSAPID_MGMT_name_automation_qa_F06AA499_AC4C_448F_BE52_46FBA21D635A 'Microsoft.ApiManagement/service/products/apiLinks@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_automation_qa
  name: 'F06AA499-AC4C-448F-BE52-46FBA21D635A'
  properties: {
    apiId: service_Dev_RWSAPID_MGMT_name_m3_api.id
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource

  ]
}



//Microsoft.ApiManagement/service/products/groupLinks

resource service_Dev_RWSAPID_MGMT_name_starter_E1F0366E_D52A_40A7_A886_4416EECD162D 'Microsoft.ApiManagement/service/products/groupLinks@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_starter
  name: 'E1F0366E-D52A-40A7-A886-4416EECD162D'
  properties: {
    groupId: service_Dev_RWSAPID_MGMT_name_developers.id
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource

  ]
}


//Microsoft.ApiManagement/service/subscriptions
resource service_Dev_RWSAPID_MGMT_name_6556223ddc0adc19c89ffd31 'Microsoft.ApiManagement/service/subscriptions@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_resource
  name: '6556223ddc0adc19c89ffd31'
  properties: {
    ownerId: service_Dev_RWSAPID_MGMT_name_1.id
    scope: service_Dev_RWSAPID_MGMT_name_vendor_eva.id
    state: 'active'
    allowTracing: false
    displayName: subscriptions_6556223ddc0adc19c89ffd31_displayName
  }
}


//Microsoft.ApiManagement/service/tags/apiLinks@2023-03-01-preview

resource service_Dev_RWSAPID_MGMT_name_orders_641b44eedc0adc10840d3c1f 'Microsoft.ApiManagement/service/tags/apiLinks@2023-03-01-preview' = {
  parent: Microsoft_ApiManagement_service_tags_service_Dev_RWSAPID_MGMT_name_orders
  name: '641b44eedc0adc10840d3c1f'
  properties: {
    apiId: service_Dev_RWSAPID_MGMT_name_orders.id
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource

  ]
}


//Microsoft.ApiManagement/service/tags/operationLinks

resource service_Dev_RWSAPID_MGMT_name_Warehouses_F4EEBB94_E16B_4ABF_94F0_8B137BB22E38 'Microsoft.ApiManagement/service/tags/operationLinks@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_Warehouses
  name: 'F4EEBB94-E16B-4ABF-94F0-8B137BB22E38'
  properties: {
    operationId: service_Dev_RWSAPID_MGMT_name_rws_warehouses_api_GetStyleWarehouses.id
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource

  ]
}

