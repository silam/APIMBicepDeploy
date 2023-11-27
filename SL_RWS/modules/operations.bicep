
resource service_POSAPIMResource_name_echo_api_create_resource 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_echo_api
  name: 'create-resource'
  properties: {
    displayName: 'Create resource'
    method: 'POST'
    urlTemplate: '/resource'
    templateParameters: []
    description: 'A demonstration of a POST call based on the echo backend above. The request body is expected to contain JSON-formatted data (see example below). A policy is used to automatically transform any request sent in JSON directly to XML. In a real-world scenario this could be used to enable modern clients to speak to a legacy backend.'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: '{\r\n\t"vehicleType": "train",\r\n\t"maxSpeed": 125,\r\n\t"avgSpeed": 90,\r\n\t"speedUnit": "mph"\r\n}'
            }
          }
        }
      ]
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

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_echo_api_modify_resource 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_echo_api
  name: 'modify-resource'
  properties: {
    displayName: 'Modify Resource'
    method: 'PUT'
    urlTemplate: '/resource'
    templateParameters: []
    description: 'A demonstration of a PUT call handled by the same "echo" backend as above. You can now specify a request body in addition to headers and it will be returned as well.'
    responses: [
      {
        statusCode: 200
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_pospoc_profileget 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_pospoc
  name: 'profileget'
  properties: {
    displayName: 'ProfileGet'
    method: 'GET'
    urlTemplate: '/profile'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_pospoc_profilepost 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_pospoc
  name: 'profilepost'
  properties: {
    displayName: 'ProfilePost'
    method: 'POST'
    urlTemplate: '/profile'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_echo_api_remove_resource 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_echo_api
  name: 'remove-resource'
  properties: {
    displayName: 'Remove resource'
    method: 'DELETE'
    urlTemplate: '/resource'
    templateParameters: []
    description: 'A demonstration of a DELETE call which traditionally deletes the resource. It is based on the same "echo" backend as in all other operations so nothing is actually deleted.'
    responses: [
      {
        statusCode: 200
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_echo_api_retrieve_header_only 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_echo_api
  name: 'retrieve-header-only'
  properties: {
    displayName: 'Retrieve header only'
    method: 'HEAD'
    urlTemplate: '/resource'
    templateParameters: []
    description: 'The HEAD operation returns only headers. In this demonstration a policy is used to set additional headers when the response is returned and to enable JSONP.'
    responses: [
      {
        statusCode: 200
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_echo_api_retrieve_resource 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_echo_api
  name: 'retrieve-resource'
  properties: {
    displayName: 'Retrieve resource'
    method: 'GET'
    urlTemplate: '/resource'
    templateParameters: []
    description: 'A demonstration of a GET call on a sample resource. It is handled by an "echo" backend which returns a response equal to the request (the supplied headers and body are being returned as received).'
    request: {
      queryParameters: [
        {
          name: 'param1'
          description: 'A sample parameter that is required and has a default value of "sample".'
          type: 'string'
          defaultValue: 'sample'
          required: true
          values: [
            'sample'
          ]
        }
        {
          name: 'param2'
          description: 'Another sample parameter, set to not required.'
          type: 'number'
          values: []
        }
      ]
      headers: []
      representations: []
    }
    responses: [
      {
        statusCode: 200
        description: 'Returned in all cases.'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [

    service_POSAPIMResource_name_resource
  ]
}

resource service_POSAPIMResource_name_echo_api_retrieve_resource_cached 'Microsoft.ApiManagement/service/apis/operations@2023-03-01-preview' = {
  parent: service_POSAPIMResource_name_echo_api
  name: 'retrieve-resource-cached'
  properties: {
    displayName: 'Retrieve resource (cached)'
    method: 'GET'
    urlTemplate: '/resource-cached'
    templateParameters: []
    description: 'A demonstration of a GET call with caching enabled on the same "echo" backend as above. Cache TTL is set to 1 hour. When you make the first request the headers you supplied will be cached. Subsequent calls will return the same headers as the first time even if you change them in your request.'
    request: {
      queryParameters: [
        {
          name: 'param1'
          description: 'A sample parameter that is required and has a default value of "sample".'
          type: 'string'
          defaultValue: 'sample'
          required: true
          values: [
            'sample'
          ]
        }
        {
          name: 'param2'
          description: 'Another sample parameter, set to not required.'
          type: 'string'
          values: []
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

    service_POSAPIMResource_name_resource
  ]
}
