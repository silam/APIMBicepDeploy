{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
      "apis_pospoc_path": {
          "type": "SecureString"
      },
      "subscriptions_6557e586e17c190043070001_displayName": {
          "type": "SecureString"
      },
      "subscriptions_6557e586e17c190043070002_displayName": {
          "type": "SecureString"
      },
      "users_1_lastName": {
          "type": "SecureString"
      },
      "service_POSAPIMResource_name": {
          "defaultValue": "POSAPIMResource",
          "type": "String"
      }
  },
  "variables": {},
  "resources": [
      {
          "type": "Microsoft.ApiManagement/service",
          "apiVersion": "2023-03-01-preview",
          "name": "[parameters('service_POSAPIMResource_name')]",
          "location": "East US",
          "tags": {
              "Project": "POS POC"
          },
          "sku": {
              "name": "Developer",
              "capacity": 1
          },
          "identity": {
              "type": "SystemAssigned"
          },
          "properties": {
              "publisherEmail": "si.lam@redwingshoes.com",
              "publisherName": "Red Wing Shoes",
              "notificationSenderEmail": "apimgmt-noreply@mail.windowsazure.com",
              "hostnameConfigurations": [
                  {
                      "type": "Proxy",
                      "hostName": "posapimresource.azure-api.net",
                      "negotiateClientCertificate": false,
                      "defaultSslBinding": true,
                      "certificateSource": "BuiltIn"
                  }
              ],
              "customProperties": {
                  "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11": "false",
                  "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10": "false",
                  "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11": "false",
                  "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10": "false",
                  "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30": "false",
                  "Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2": "true",
                  "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TripleDes168": "false",
                  "Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Ssl30": "false"
              },
              "virtualNetworkType": "None",
              "disableGateway": false,
              "natGatewayState": "Disabled",
              "apiVersionConstraint": {},
              "publicNetworkAccess": "Enabled",
              "legacyPortalStatus": "Enabled",
              "developerPortalStatus": "Enabled"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Echo API",
              "apiRevision": "1",
              "subscriptionRequired": true,
              "serviceUrl": "http://echoapi.cloudapp.net/api",
              "path": "echo",
              "protocols": [
                  "https"
              ],
              "authenticationSettings": {
                  "oAuth2AuthenticationSettings": [],
                  "openidAuthenticationSettings": []
              },
              "subscriptionKeyParameterNames": {
                  "header": "Ocp-Apim-Subscription-Key",
                  "query": "subscription-key"
              },
              "isCurrent": true
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/pospoc')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "POSPOC",
              "apiRevision": "1",
              "subscriptionRequired": true,
              "protocols": [
                  "https"
              ],
              "authenticationSettings": {
                  "oAuth2AuthenticationSettings": [],
                  "openidAuthenticationSettings": []
              },
              "subscriptionKeyParameterNames": {
                  "header": "Ocp-Apim-Subscription-Key",
                  "query": "subscription-key"
              },
              "isCurrent": true,
              "path": "[parameters('apis_pospoc_path')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/administrators')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Administrators",
              "description": "Administrators is a built-in group containing the admin email account provided at the time of service creation. Its membership is managed by the system.",
              "type": "system"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/developers')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Developers",
              "description": "Developers is a built-in group. Its membership is managed by the system. Signed-in users fall into this group.",
              "type": "system"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/guests')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Guests",
              "description": "Guests is a built-in group. Its membership is managed by the system. Unauthenticated users visiting the developer portal fall into this group.",
              "type": "system"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/notifications",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/AccountClosedPublisher')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/notifications",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/BCC')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/notifications",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/NewApplicationNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/notifications",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/NewIssuePublisherNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/notifications",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/PurchasePublisherNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/notifications",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/QuotaLimitApproachingPublisherNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/notifications",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/RequestPublisherNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/policies",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/policy')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "value": "<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - Only the <forward-request> policy element can appear within the <backend> section element.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n-->\r\n<policies>\r\n  <inbound />\r\n  <backend>\r\n    <forward-request />\r\n  </backend>\r\n  <outbound />\r\n</policies>",
              "format": "xml"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/portalconfigs",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "enableBasicAuth": true,
              "signin": {
                  "require": false
              },
              "signup": {
                  "termsOfService": {
                      "requireConsent": false
                  }
              },
              "delegation": {
                  "delegateRegistration": false,
                  "delegateSubscription": false
              },
              "cors": {
                  "allowedOrigins": []
              },
              "csp": {
                  "mode": "disabled",
                  "reportUri": [],
                  "allowedSources": []
              }
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/portalsettings",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/delegation')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subscriptions": {
                  "enabled": false
              },
              "userRegistration": {
                  "enabled": false
              }
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/portalsettings",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/signin')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "enabled": false
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/portalsettings",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/signup')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "enabled": true,
              "termsOfService": {
                  "enabled": false,
                  "consentRequired": false
              }
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Starter",
              "description": "Subscribers will be able to run 5 calls/minute up to a maximum of 100 calls/week.",
              "subscriptionRequired": true,
              "approvalRequired": false,
              "subscriptionsLimit": 1,
              "state": "published"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Unlimited",
              "description": "Subscribers have completely unlimited access to the API. Administrator approval is required.",
              "subscriptionRequired": true,
              "approvalRequired": true,
              "subscriptionsLimit": 1,
              "state": "published"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/subscriptions",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/master')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "scope": "[concat(resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name')), '/')]",
              "displayName": "Built-in all-access subscription",
              "state": "active",
              "allowTracing": false
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/AccountClosedDeveloper')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Thank you for using the $OrganizationName API!",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          On behalf of $OrganizationName and our customers we thank you for giving us a try. Your $OrganizationName API account is now closed.\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Thank you,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Your $OrganizationName Team</p>\r\n    <a href=\"$DevPortalUrl\">$DevPortalUrl</a>\r\n    <p />\r\n  </body>\r\n</html>",
              "title": "Developer farewell letter",
              "description": "Developers receive this farewell email after they close their account.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/ApplicationApprovedNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Your application $AppName is published in the application gallery",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          We are happy to let you know that your request to publish the $AppName application in the application gallery has been approved. Your application has been published and can be viewed <a href=\"http://$DevPortalUrl/Applications/Details/$AppId\">here</a>.\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Best,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>",
              "title": "Application gallery submission approved (deprecated)",
              "description": "Developers who submitted their application for publication in the application gallery on the developer portal receive this email after their submission is approved.",
              "parameters": [
                  {
                      "name": "AppId",
                      "title": "Application id"
                  },
                  {
                      "name": "AppName",
                      "title": "Application name"
                  },
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/ConfirmSignUpIdentityDefault')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Please confirm your new $OrganizationName API account",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <meta charset=\"UTF-8\" />\r\n    <title>Letter</title>\r\n  </head>\r\n  <body>\r\n    <table width=\"100%\">\r\n      <tr>\r\n        <td>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\"></p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Thank you for joining the $OrganizationName API program! We host a growing number of cool APIs and strive to provide an awesome experience for API developers.</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">First order of business is to activate your account and get you going. To that end, please click on the following link:</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n            <a id=\"confirmUrl\" href=\"$ConfirmUrl\" style=\"text-decoration:none\">\r\n              <strong>$ConfirmUrl</strong>\r\n            </a>\r\n          </p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">If clicking the link does not work, please copy-and-paste or re-type it into your browser's address bar and hit \"Enter\".</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Thank you,</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">$OrganizationName API Team</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n            <a href=\"$DevPortalUrl\">$DevPortalUrl</a>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>",
              "title": "New developer account confirmation",
              "description": "Developers receive this email to confirm their e-mail address after they sign up for a new account.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  },
                  {
                      "name": "ConfirmUrl",
                      "title": "Developer activation URL"
                  },
                  {
                      "name": "DevPortalHost",
                      "title": "Developer portal hostname"
                  },
                  {
                      "name": "ConfirmQuery",
                      "title": "Query string part of the activation URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/EmailChangeIdentityDefault')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Please confirm the new email associated with your $OrganizationName API account",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <meta charset=\"UTF-8\" />\r\n    <title>Letter</title>\r\n  </head>\r\n  <body>\r\n    <table width=\"100%\">\r\n      <tr>\r\n        <td>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\"></p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">You are receiving this email because you made a change to the email address on your $OrganizationName API account.</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Please click on the following link to confirm the change:</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n            <a id=\"confirmUrl\" href=\"$ConfirmUrl\" style=\"text-decoration:none\">\r\n              <strong>$ConfirmUrl</strong>\r\n            </a>\r\n          </p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">If clicking the link does not work, please copy-and-paste or re-type it into your browser's address bar and hit \"Enter\".</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Thank you,</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">$OrganizationName API Team</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n            <a href=\"$DevPortalUrl\">$DevPortalUrl</a>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>",
              "title": "Email change confirmation",
              "description": "Developers receive this email to confirm a new e-mail address after they change their existing one associated with their account.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  },
                  {
                      "name": "ConfirmUrl",
                      "title": "Developer confirmation URL"
                  },
                  {
                      "name": "DevPortalHost",
                      "title": "Developer portal hostname"
                  },
                  {
                      "name": "ConfirmQuery",
                      "title": "Query string part of the confirmation URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/InviteUserNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "You are invited to join the $OrganizationName developer network",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          Your account has been created. Please follow the link below to visit the $OrganizationName developer portal and claim it:\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n      <a href=\"$ConfirmUrl\">$ConfirmUrl</a>\r\n    </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Best,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>",
              "title": "Invite user",
              "description": "An e-mail invitation to create an account, sent on request by API publishers.",
              "parameters": [
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "ConfirmUrl",
                      "title": "Confirmation link"
                  },
                  {
                      "name": "DevPortalHost",
                      "title": "Developer portal hostname"
                  },
                  {
                      "name": "ConfirmQuery",
                      "title": "Query string part of the confirmation link"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/NewCommentNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "$IssueName issue has a new comment",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">This is a brief note to let you know that $CommenterFirstName $CommenterLastName made the following comment on the issue $IssueName you created:</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">$CommentText</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          To view the issue on the developer portal click <a href=\"http://$DevPortalUrl/issues/$IssueId\">here</a>.\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Best,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>",
              "title": "New comment added to an issue (deprecated)",
              "description": "Developers receive this email when someone comments on the issue they created on the Issues page of the developer portal.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "CommenterFirstName",
                      "title": "Commenter first name"
                  },
                  {
                      "name": "CommenterLastName",
                      "title": "Commenter last name"
                  },
                  {
                      "name": "IssueId",
                      "title": "Issue id"
                  },
                  {
                      "name": "IssueName",
                      "title": "Issue name"
                  },
                  {
                      "name": "CommentText",
                      "title": "Comment text"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/NewDeveloperNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Welcome to the $OrganizationName API!",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <meta charset=\"UTF-8\" />\r\n    <title>Letter</title>\r\n  </head>\r\n  <body>\r\n    <h1 style=\"color:#000505;font-size:18pt;font-family:'Segoe UI'\">\r\n          Welcome to <span style=\"color:#003363\">$OrganizationName API!</span></h1>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Your $OrganizationName API program registration is completed and we are thrilled to have you as a customer. Here are a few important bits of information for your reference:</p>\r\n    <table width=\"100%\" style=\"margin:20px 0\">\r\n      <tr>\r\n            #if ($IdentityProvider == \"Basic\")\r\n            <td width=\"50%\" style=\"height:40px;vertical-align:top;font-family:'Segoe UI';font-size:12pt\">\r\n              Please use the following <strong>username</strong> when signing into any of the ${OrganizationName}-hosted developer portals:\r\n            </td><td style=\"vertical-align:top;font-family:'Segoe UI';font-size:12pt\"><strong>$DevUsername</strong></td>\r\n            #else\r\n            <td width=\"50%\" style=\"height:40px;vertical-align:top;font-family:'Segoe UI';font-size:12pt\">\r\n              Please use the following <strong>$IdentityProvider account</strong> when signing into any of the ${OrganizationName}-hosted developer portals:\r\n            </td><td style=\"vertical-align:top;font-family:'Segoe UI';font-size:12pt\"><strong>$DevUsername</strong></td>            \r\n            #end\r\n          </tr>\r\n      <tr>\r\n        <td style=\"height:40px;vertical-align:top;font-family:'Segoe UI';font-size:12pt\">\r\n              We will direct all communications to the following <strong>email address</strong>:\r\n            </td>\r\n        <td style=\"vertical-align:top;font-family:'Segoe UI';font-size:12pt\">\r\n          <a href=\"mailto:$DevEmail\" style=\"text-decoration:none\">\r\n            <strong>$DevEmail</strong>\r\n          </a>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Best of luck in your API pursuits!</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">$OrganizationName API Team</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n      <a href=\"http://$DevPortalUrl\">$DevPortalUrl</a>\r\n    </p>\r\n  </body>\r\n</html>",
              "title": "Developer welcome letter",
              "description": "Developers receive this “welcome” email after they confirm their new account.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "DevUsername",
                      "title": "Developer user name"
                  },
                  {
                      "name": "DevEmail",
                      "title": "Developer email"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  },
                  {
                      "name": "IdentityProvider",
                      "title": "Identity Provider selected by Organization"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/NewIssueNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Your request $IssueName was received",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Thank you for contacting us. Our API team will review your issue and get back to you soon.</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          Click this <a href=\"http://$DevPortalUrl/issues/$IssueId\">link</a> to view or edit your request.\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Best,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">The $OrganizationName API Team</p>\r\n  </body>\r\n</html>",
              "title": "New issue received (deprecated)",
              "description": "This email is sent to developers after they create a new topic on the Issues page of the developer portal.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "IssueId",
                      "title": "Issue id"
                  },
                  {
                      "name": "IssueName",
                      "title": "Issue name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/PasswordResetByAdminNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Your password was reset",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <table width=\"100%\">\r\n      <tr>\r\n        <td>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\"></p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">The password of your $OrganizationName API account has been reset, per your request.</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n                Your new password is: <strong>$DevPassword</strong></p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Please make sure to change it next time you sign in.</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Thank you,</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">$OrganizationName API Team</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n            <a href=\"$DevPortalUrl\">$DevPortalUrl</a>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>",
              "title": "Password reset by publisher notification (Password reset by admin)",
              "description": "Developers receive this email when the publisher resets their password.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "DevPassword",
                      "title": "New Developer password"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/PasswordResetIdentityDefault')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Your password change request",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <meta charset=\"UTF-8\" />\r\n    <title>Letter</title>\r\n  </head>\r\n  <body>\r\n    <table width=\"100%\">\r\n      <tr>\r\n        <td>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\"></p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">You are receiving this email because you requested to change the password on your $OrganizationName API account.</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Please click on the link below and follow instructions to create your new password:</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n            <a id=\"resetUrl\" href=\"$ConfirmUrl\" style=\"text-decoration:none\">\r\n              <strong>$ConfirmUrl</strong>\r\n            </a>\r\n          </p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">If clicking the link does not work, please copy-and-paste or re-type it into your browser's address bar and hit \"Enter\".</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">Thank you,</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">$OrganizationName API Team</p>\r\n          <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n            <a href=\"$DevPortalUrl\">$DevPortalUrl</a>\r\n          </p>\r\n        </td>\r\n      </tr>\r\n    </table>\r\n  </body>\r\n</html>",
              "title": "Password change confirmation",
              "description": "Developers receive this email when they request a password change of their account. The purpose of the email is to verify that the account owner made the request and to provide a one-time perishable URL for changing the password.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  },
                  {
                      "name": "ConfirmUrl",
                      "title": "Developer new password instruction URL"
                  },
                  {
                      "name": "DevPortalHost",
                      "title": "Developer portal hostname"
                  },
                  {
                      "name": "ConfirmQuery",
                      "title": "Query string part of the instruction URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/PurchaseDeveloperNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Your subscription to the $ProdName",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Greetings $DevFirstName $DevLastName!</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          Thank you for subscribing to the <a href=\"http://$DevPortalUrl/products/$ProdId\"><strong>$ProdName</strong></a> and welcome to the $OrganizationName developer community. We are delighted to have you as part of the team and are looking forward to the amazing applications you will build using our API!\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Below are a few subscription details for your reference:</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n      <ul>\r\n            #if ($SubStartDate != \"\")\r\n            <li style=\"font-size:12pt;font-family:'Segoe UI'\">Start date: $SubStartDate</li>\r\n            #end\r\n            \r\n            #if ($SubTerm != \"\")\r\n            <li style=\"font-size:12pt;font-family:'Segoe UI'\">Subscription term: $SubTerm</li>\r\n            #end\r\n          </ul>\r\n    </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n            Visit the developer <a href=\"http://$DevPortalUrl/developer\">profile area</a> to manage your subscription and subscription keys\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">A couple of pointers to help get you started:</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n      <strong>\r\n        <a href=\"http://$DevPortalUrl/docs/services?product=$ProdId\">Learn about the API</a>\r\n      </strong>\r\n    </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">The API documentation provides all information necessary to make a request and to process a response. Code samples are provided per API operation in a variety of languages. Moreover, an interactive console allows making API calls directly from the developer portal without writing any code.</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n      <strong>\r\n        <a href=\"http://$DevPortalUrl/applications\">Feature your app in the app gallery</a>\r\n      </strong>\r\n    </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">You can publish your application on our gallery for increased visibility to potential new users.</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n      <strong>\r\n        <a href=\"http://$DevPortalUrl/issues\">Stay in touch</a>\r\n      </strong>\r\n    </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          If you have an issue, a question, a suggestion, a request, or if you just want to tell us something, go to the <a href=\"http://$DevPortalUrl/issues\">Issues</a> page on the developer portal and create a new topic.\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Happy hacking,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">The $OrganizationName API Team</p>\r\n    <a style=\"font-size:12pt;font-family:'Segoe UI'\" href=\"http://$DevPortalUrl\">$DevPortalUrl</a>\r\n  </body>\r\n</html>",
              "title": "New subscription activated",
              "description": "Developers receive this acknowledgement email after subscribing to a product.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "ProdId",
                      "title": "Product ID"
                  },
                  {
                      "name": "ProdName",
                      "title": "Product name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "SubStartDate",
                      "title": "Subscription start date"
                  },
                  {
                      "name": "SubTerm",
                      "title": "Subscription term"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/QuotaLimitApproachingDeveloperNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "You are approaching an API quota limit",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head>\r\n    <style>\r\n          body {font-size:12pt; font-family:\"Segoe UI\",\"Segoe WP\",\"Tahoma\",\"Arial\",\"sans-serif\";}\r\n          .alert { color: red; }\r\n          .child1 { padding-left: 20px; }\r\n          .child2 { padding-left: 40px; }\r\n          .number { text-align: right; }\r\n          .text { text-align: left; }\r\n          th, td { padding: 4px 10px; min-width: 100px; }\r\n          th { background-color: #DDDDDD;}\r\n        </style>\r\n  </head>\r\n  <body>\r\n    <p>Greetings $DevFirstName $DevLastName!</p>\r\n    <p>\r\n          You are approaching the quota limit on you subscription to the <strong>$ProdName</strong> product (primary key $SubPrimaryKey).\r\n          #if ($QuotaResetDate != \"\")\r\n          This quota will be renewed on $QuotaResetDate.\r\n          #else\r\n          This quota will not be renewed.\r\n          #end\r\n        </p>\r\n    <p>Below are details on quota usage for the subscription:</p>\r\n    <p>\r\n      <table>\r\n        <thead>\r\n          <th class=\"text\">Quota Scope</th>\r\n          <th class=\"number\">Calls</th>\r\n          <th class=\"number\">Call Quota</th>\r\n          <th class=\"number\">Bandwidth</th>\r\n          <th class=\"number\">Bandwidth Quota</th>\r\n        </thead>\r\n        <tbody>\r\n          <tr>\r\n            <td class=\"text\">Subscription</td>\r\n            <td class=\"number\">\r\n                  #if ($CallsAlert == true)\r\n                  <span class=\"alert\">$Calls</span>\r\n                  #else\r\n                  $Calls\r\n                  #end\r\n                </td>\r\n            <td class=\"number\">$CallQuota</td>\r\n            <td class=\"number\">\r\n                  #if ($BandwidthAlert == true)\r\n                  <span class=\"alert\">$Bandwidth</span>\r\n                  #else\r\n                  $Bandwidth\r\n                  #end\r\n                </td>\r\n            <td class=\"number\">$BandwidthQuota</td>\r\n          </tr>\r\n              #foreach ($api in $Apis)\r\n              <tr><td class=\"child1 text\">API: $api.Name</td><td class=\"number\">\r\n                  #if ($api.CallsAlert == true)\r\n                  <span class=\"alert\">$api.Calls</span>\r\n                  #else\r\n                  $api.Calls\r\n                  #end\r\n                </td><td class=\"number\">$api.CallQuota</td><td class=\"number\">\r\n                  #if ($api.BandwidthAlert == true)\r\n                  <span class=\"alert\">$api.Bandwidth</span>\r\n                  #else\r\n                  $api.Bandwidth\r\n                  #end\r\n                </td><td class=\"number\">$api.BandwidthQuota</td></tr>\r\n              #foreach ($operation in $api.Operations)\r\n              <tr><td class=\"child2 text\">Operation: $operation.Name</td><td class=\"number\">\r\n                  #if ($operation.CallsAlert == true)\r\n                  <span class=\"alert\">$operation.Calls</span>\r\n                  #else\r\n                  $operation.Calls\r\n                  #end\r\n                </td><td class=\"number\">$operation.CallQuota</td><td class=\"number\">\r\n                  #if ($operation.BandwidthAlert == true)\r\n                  <span class=\"alert\">$operation.Bandwidth</span>\r\n                  #else\r\n                  $operation.Bandwidth\r\n                  #end\r\n                </td><td class=\"number\">$operation.BandwidthQuota</td></tr>\r\n              #end\r\n              #end\r\n            </tbody>\r\n      </table>\r\n    </p>\r\n    <p>Thank you,</p>\r\n    <p>$OrganizationName API Team</p>\r\n    <a href=\"$DevPortalUrl\">$DevPortalUrl</a>\r\n    <p />\r\n  </body>\r\n</html>",
              "title": "Developer quota limit approaching notification",
              "description": "Developers receive this email to alert them when they are approaching a quota limit.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "ProdName",
                      "title": "Product name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "SubPrimaryKey",
                      "title": "Primary Subscription key"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  },
                  {
                      "name": "QuotaResetDate",
                      "title": "Quota reset date"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/RejectDeveloperNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Your subscription request for the $ProdName",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          We would like to inform you that we reviewed your subscription request for the <strong>$ProdName</strong>.\r\n        </p>\r\n        #if ($SubDeclineReason == \"\")\r\n        <p style=\"font-size:12pt;font-family:'Segoe UI'\">Regretfully, we were unable to approve it, as subscriptions are temporarily suspended at this time.</p>\r\n        #else\r\n        <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          Regretfully, we were unable to approve it at this time for the following reason:\r\n          <div style=\"margin-left: 1.5em;\"> $SubDeclineReason </div></p>\r\n        #end\r\n        <p style=\"font-size:12pt;font-family:'Segoe UI'\"> We truly appreciate your interest. </p><p style=\"font-size:12pt;font-family:'Segoe UI'\">All the best,</p><p style=\"font-size:12pt;font-family:'Segoe UI'\">The $OrganizationName API Team</p><a style=\"font-size:12pt;font-family:'Segoe UI'\" href=\"http://$DevPortalUrl\">$DevPortalUrl</a></body>\r\n</html>",
              "title": "Subscription request declined",
              "description": "This email is sent to developers when their subscription requests for products requiring publisher approval is declined.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "SubDeclineReason",
                      "title": "Reason for declining subscription"
                  },
                  {
                      "name": "ProdName",
                      "title": "Product name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/templates",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/RequestDeveloperNotificationMessage')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "subject": "Your subscription request for the $ProdName",
              "body": "<!DOCTYPE html >\r\n<html>\r\n  <head />\r\n  <body>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Dear $DevFirstName $DevLastName,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          Thank you for your interest in our <strong>$ProdName</strong> API product!\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">\r\n          We were delighted to receive your subscription request. We will promptly review it and get back to you at <strong>$DevEmail</strong>.\r\n        </p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">Thank you,</p>\r\n    <p style=\"font-size:12pt;font-family:'Segoe UI'\">The $OrganizationName API Team</p>\r\n    <a style=\"font-size:12pt;font-family:'Segoe UI'\" href=\"http://$DevPortalUrl\">$DevPortalUrl</a>\r\n  </body>\r\n</html>",
              "title": "Subscription request received",
              "description": "This email is sent to developers to acknowledge receipt of their subscription requests for products requiring publisher approval.",
              "parameters": [
                  {
                      "name": "DevFirstName",
                      "title": "Developer first name"
                  },
                  {
                      "name": "DevLastName",
                      "title": "Developer last name"
                  },
                  {
                      "name": "DevEmail",
                      "title": "Developer email"
                  },
                  {
                      "name": "ProdName",
                      "title": "Product name"
                  },
                  {
                      "name": "OrganizationName",
                      "title": "Organization name"
                  },
                  {
                      "name": "DevPortalUrl",
                      "title": "Developer portal URL"
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/users",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/1')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "firstName": "Administrator",
              "email": "si.lam@redwingshoes.com",
              "state": "active",
              "identities": [
                  {
                      "provider": "Azure",
                      "id": "si.lam@redwingshoes.com"
                  }
              ],
              "lastName": "[parameters('users_1_lastName')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/create-resource')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Create resource",
              "method": "POST",
              "urlTemplate": "/resource",
              "templateParameters": [],
              "description": "A demonstration of a POST call based on the echo backend above. The request body is expected to contain JSON-formatted data (see example below). A policy is used to automatically transform any request sent in JSON directly to XML. In a real-world scenario this could be used to enable modern clients to speak to a legacy backend.",
              "request": {
                  "queryParameters": [],
                  "headers": [],
                  "representations": [
                      {
                          "contentType": "application/json",
                          "examples": {
                              "default": {
                                  "value": "{\r\n\t\"vehicleType\": \"train\",\r\n\t\"maxSpeed\": 125,\r\n\t\"avgSpeed\": 90,\r\n\t\"speedUnit\": \"mph\"\r\n}"
                              }
                          }
                      }
                  ]
              },
              "responses": [
                  {
                      "statusCode": 200,
                      "representations": [],
                      "headers": []
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/modify-resource')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Modify Resource",
              "method": "PUT",
              "urlTemplate": "/resource",
              "templateParameters": [],
              "description": "A demonstration of a PUT call handled by the same \"echo\" backend as above. You can now specify a request body in addition to headers and it will be returned as well.",
              "responses": [
                  {
                      "statusCode": 200,
                      "representations": [],
                      "headers": []
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/pospoc/profileget')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'pospoc')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "ProfileGet",
              "method": "GET",
              "urlTemplate": "/profile",
              "templateParameters": [],
              "responses": []
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/pospoc/profilepost')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'pospoc')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "ProfilePost",
              "method": "POST",
              "urlTemplate": "/profile",
              "templateParameters": [],
              "responses": []
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/remove-resource')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Remove resource",
              "method": "DELETE",
              "urlTemplate": "/resource",
              "templateParameters": [],
              "description": "A demonstration of a DELETE call which traditionally deletes the resource. It is based on the same \"echo\" backend as in all other operations so nothing is actually deleted.",
              "responses": [
                  {
                      "statusCode": 200,
                      "representations": [],
                      "headers": []
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/retrieve-header-only')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Retrieve header only",
              "method": "HEAD",
              "urlTemplate": "/resource",
              "templateParameters": [],
              "description": "The HEAD operation returns only headers. In this demonstration a policy is used to set additional headers when the response is returned and to enable JSONP.",
              "responses": [
                  {
                      "statusCode": 200,
                      "representations": [],
                      "headers": []
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/retrieve-resource')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Retrieve resource",
              "method": "GET",
              "urlTemplate": "/resource",
              "templateParameters": [],
              "description": "A demonstration of a GET call on a sample resource. It is handled by an \"echo\" backend which returns a response equal to the request (the supplied headers and body are being returned as received).",
              "request": {
                  "queryParameters": [
                      {
                          "name": "param1",
                          "description": "A sample parameter that is required and has a default value of \"sample\".",
                          "type": "string",
                          "defaultValue": "sample",
                          "required": true,
                          "values": [
                              "sample"
                          ]
                      },
                      {
                          "name": "param2",
                          "description": "Another sample parameter, set to not required.",
                          "type": "number",
                          "values": []
                      }
                  ],
                  "headers": [],
                  "representations": []
              },
              "responses": [
                  {
                      "statusCode": 200,
                      "description": "Returned in all cases.",
                      "representations": [],
                      "headers": []
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/retrieve-resource-cached')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "displayName": "Retrieve resource (cached)",
              "method": "GET",
              "urlTemplate": "/resource-cached",
              "templateParameters": [],
              "description": "A demonstration of a GET call with caching enabled on the same \"echo\" backend as above. Cache TTL is set to 1 hour. When you make the first request the headers you supplied will be cached. Subsequent calls will return the same headers as the first time even if you change them in your request.",
              "request": {
                  "queryParameters": [
                      {
                          "name": "param1",
                          "description": "A sample parameter that is required and has a default value of \"sample\".",
                          "type": "string",
                          "defaultValue": "sample",
                          "required": true,
                          "values": [
                              "sample"
                          ]
                      },
                      {
                          "name": "param2",
                          "description": "Another sample parameter, set to not required.",
                          "type": "string",
                          "values": []
                      }
                  ],
                  "headers": [],
                  "representations": []
              },
              "responses": [
                  {
                      "statusCode": 200,
                      "representations": [],
                      "headers": []
                  }
              ]
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/wikis",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "documents": []
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/wikis",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/pospoc/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'pospoc')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "documents": []
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/groups/users",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/administrators/1')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'administrators')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/groups/users",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/developers/1')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'developers')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/apis",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/echo-api')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/apis",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/echo-api')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/administrators')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/administrators')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/developers')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/developers')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/guests')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groups",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/guests')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ]
      },
      {
          "type": "Microsoft.ApiManagement/service/products/policies",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/policy')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "value": "<!--\r\n            IMPORTANT:\r\n            - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n            - Only the <forward-request> policy element can appear within the <backend> section element.\r\n            - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n            - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n            - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n            - To remove a policy, delete the corresponding policy statement from the policy document.\r\n            - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n            - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n            - Policies are applied in the order of their appearance, from the top down.\r\n        -->\r\n<policies>\r\n  <inbound>\r\n    <rate-limit calls=\"5\" renewal-period=\"60\" />\r\n    <quota calls=\"100\" renewal-period=\"604800\" />\r\n    <base />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n</policies>",
              "format": "xml"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/wikis",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "documents": []
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/wikis",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/default')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "documents": []
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations/policies",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/create-resource/policy')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis/operations', parameters('service_POSAPIMResource_name'), 'echo-api', 'create-resource')]",
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "value": "<policies>\r\n  <inbound>\r\n    <base />\r\n    <json-to-xml apply=\"always\" consider-accept-header=\"false\" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n</policies>",
              "format": "xml"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations/policies",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/retrieve-header-only/policy')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis/operations', parameters('service_POSAPIMResource_name'), 'echo-api', 'retrieve-header-only')]",
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "value": "<policies>\r\n  <inbound>\r\n    <base />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n    <set-header name=\"X-My-Sample\" exists-action=\"override\">\r\n      <value>This is a sample</value>\r\n      <!-- for multiple headers with the same name add additional value elements -->\r\n    </set-header>\r\n    <jsonp callback-parameter-name=\"ProcessResponse\" />\r\n  </outbound>\r\n</policies>",
              "format": "xml"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations/policies",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/echo-api/retrieve-resource-cached/policy')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis/operations', parameters('service_POSAPIMResource_name'), 'echo-api', 'retrieve-resource-cached')]",
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "value": "<policies>\r\n  <inbound>\r\n    <base />\r\n    <cache-lookup vary-by-developer=\"false\" vary-by-developer-groups=\"false\">\r\n      <vary-by-header>Accept</vary-by-header>\r\n      <vary-by-header>Accept-Charset</vary-by-header>\r\n    </cache-lookup>\r\n    <rewrite-uri template=\"/resource\" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n    <cache-store duration=\"3600\" />\r\n  </outbound>\r\n</policies>",
              "format": "xml"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations/policies",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/pospoc/profileget/policy')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis/operations', parameters('service_POSAPIMResource_name'), 'pospoc', 'profileget')]",
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'pospoc')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "value": "<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <mock-response status-code=\"200\" content-type=\"application/json\" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>",
              "format": "xml"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/apis/operations/policies",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/pospoc/profilepost/policy')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/apis/operations', parameters('service_POSAPIMResource_name'), 'pospoc', 'profilepost')]",
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'pospoc')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]"
          ],
          "properties": {
              "value": "<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <mock-response status-code=\"200\" content-type=\"application/json\" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>",
              "format": "xml"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/apiLinks",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/501546B9-E3B8-411F-AEE3-8711909A9EFA')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]"
          ],
          "properties": {
              "apiId": "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/apiLinks",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/A1EB9257-3922-406D-BA58-7A51B93704BC')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]"
          ],
          "properties": {
              "apiId": "[resourceId('Microsoft.ApiManagement/service/apis', parameters('service_POSAPIMResource_name'), 'echo-api')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groupLinks",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/45ABCAE0-A8AB-42F5-9949-B2B73C6ECFF8')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'developers')]"
          ],
          "properties": {
              "groupId": "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'developers')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groupLinks",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/51D3C418-17E3-4E00-A323-E103189226C6')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'developers')]"
          ],
          "properties": {
              "groupId": "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'developers')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groupLinks",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/52FC784E-12E4-4358-895D-FC700EA548E5')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'administrators')]"
          ],
          "properties": {
              "groupId": "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'administrators')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groupLinks",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/61C6181D-D806-4114-9DF8-C9FA20F6D952')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'administrators')]"
          ],
          "properties": {
              "groupId": "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'administrators')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groupLinks",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/starter/CF0729CA-3A01-4363-A9E6-231D10E83479')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'guests')]"
          ],
          "properties": {
              "groupId": "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'guests')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/products/groupLinks",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/unlimited/EB8293E8-4F14-4B70-97E9-55ACF0852B4C')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'guests')]"
          ],
          "properties": {
              "groupId": "[resourceId('Microsoft.ApiManagement/service/groups', parameters('service_POSAPIMResource_name'), 'guests')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/subscriptions",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/6557e586e17c190043070001')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/users', parameters('service_POSAPIMResource_name'), '1')]",
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]"
          ],
          "properties": {
              "ownerId": "[resourceId('Microsoft.ApiManagement/service/users', parameters('service_POSAPIMResource_name'), '1')]",
              "scope": "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'starter')]",
              "state": "active",
              "allowTracing": false,
              "displayName": "[parameters('subscriptions_6557e586e17c190043070001_displayName')]"
          }
      },
      {
          "type": "Microsoft.ApiManagement/service/subscriptions",
          "apiVersion": "2023-03-01-preview",
          "name": "[concat(parameters('service_POSAPIMResource_name'), '/6557e586e17c190043070002')]",
          "dependsOn": [
              "[resourceId('Microsoft.ApiManagement/service', parameters('service_POSAPIMResource_name'))]",
              "[resourceId('Microsoft.ApiManagement/service/users', parameters('service_POSAPIMResource_name'), '1')]",
              "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]"
          ],
          "properties": {
              "ownerId": "[resourceId('Microsoft.ApiManagement/service/users', parameters('service_POSAPIMResource_name'), '1')]",
              "scope": "[resourceId('Microsoft.ApiManagement/service/products', parameters('service_POSAPIMResource_name'), 'unlimited')]",
              "state": "active",
              "allowTracing": false,
              "displayName": "[parameters('subscriptions_6557e586e17c190043070002_displayName')]"
          }
      }
  ]
}
