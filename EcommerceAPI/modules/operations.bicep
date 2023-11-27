//operations

resource service_Dev_RWSAPID_MGMT_name_ecommerce_api_1_6400d1889f935a45f46ac5af 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_ecommerce_api_1
  name: '6400d1889f935a45f46ac5af'
  properties: {
    displayName: 'Account By Location'
    method: 'GET'
    urlTemplate: '/persons/purchasers/accounts'
    templateParameters: []
    description: 'Gets account by locationId, and customerGroup or customerFirstFive.'
    request: {
      queryParameters: [
        {
          name: 'customerFirstFive'
          description: 'First 5 digits of M3 customer number.'
          type: 'string'
          values: [
            '50111'
          ]
        }
        {
          name: 'customerGroup'
          description: 'Customer Group'
          type: 'string'
          values: [
            '112'
          ]
        }
        {
          name: 'locationId'
          description: 'Location Id.'
          type: 'string'
          defaultValue: '1039'
          required: true
          values: [
            '1039'
          ]
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}


resource service_Dev_RWSAPID_MGMT_name_purchaser_accounts_api_accountbylocation 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_purchaser_accounts_api
  name: 'accountbylocation'
  properties: {
    displayName: 'AccountByLocation'
    method: 'GET'
    urlTemplate: '/AccountByLocation'
    templateParameters: []
    description: 'Get Account By Location'
    request: {
      queryParameters: [
        {
          name: 'customerFirstFive'
          description: '50111'
          type: 'string'
          defaultValue: '50111'
          values: [
            '50111'
          ]
        }
        {
          name: 'locationId'
          description: '1039'
          type: 'string'
          defaultValue: '1039'
          required: true
          values: [
            '1039'
          ]
        }
        {
          name: 'customerGroup'
          description: '112'
          type: 'string'
          values: [
            '112'
          ]
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}




resource service_Dev_RWSAPID_MGMT_name_ecommerce_api_1_6400d1889f935a45f46ac5af 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_Dev_RWSAPID_MGMT_name_ecommerce_api_1
  name: '6400d1889f935a45f46ac5af'
  properties: {
    displayName: 'Account By Location'
    method: 'GET'
    urlTemplate: '/persons/purchasers/accounts'
    templateParameters: []
    description: 'Gets account by locationId, and customerGroup or customerFirstFive.'
    request: {
      queryParameters: [
        {
          name: 'customerFirstFive'
          description: 'First 5 digits of M3 customer number.'
          type: 'string'
          values: [
            '50111'
          ]
        }
        {
          name: 'customerGroup'
          description: 'Customer Group'
          type: 'string'
          values: [
            '112'
          ]
        }
        {
          name: 'locationId'
          description: 'Location Id.'
          type: 'string'
          defaultValue: '1039'
          required: true
          values: [
            '1039'
          ]
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
          }
        ]
        headers: []
      }
    ]
  }
  dependsOn: [

    service_Dev_RWSAPID_MGMT_name_resource
  ]
}



