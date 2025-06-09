param profiles_my_cdn_profile_webdev_name string = 'my-cdn-profile-webdev'
param databaseAccounts_azcosmoscrc01_name string = 'azcosmoscrc01'
param storageAccounts_staysydstaticweb01_name string = 'staysydstaticweb01'

resource profiles_my_cdn_profile_webdev_name_resource 'Microsoft.Cdn/profiles@2025-04-15' = {
  name: profiles_my_cdn_profile_webdev_name
  location: 'Global'
  sku: {
    name: 'Standard_Microsoft'
  }
  kind: 'cdn'
  properties: {}
}

resource databaseAccounts_azcosmoscrc01_name_resource 'Microsoft.DocumentDB/databaseAccounts@2024-12-01-preview' = {
  name: databaseAccounts_azcosmoscrc01_name
  location: 'Australia Southeast'
  tags: {
    defaultExperience: 'Core (SQL)'
    'hidden-workload-type': 'Learning'
    'hidden-cosmos-mmspecial': ''
  }
  kind: 'GlobalDocumentDB'
  identity: {
    type: 'None'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
    enableAutomaticFailover: false
    enableMultipleWriteLocations: false
    isVirtualNetworkFilterEnabled: false
    virtualNetworkRules: []
    disableKeyBasedMetadataWriteAccess: false
    enableFreeTier: false
    enableAnalyticalStorage: false
    analyticalStorageConfiguration: {
      schemaType: 'WellDefined'
    }
    databaseAccountOfferType: 'Standard'
    enableMaterializedViews: false
    capacityMode: 'Serverless'
    defaultIdentity: 'FirstPartyIdentity'
    networkAclBypass: 'None'
    disableLocalAuth: false
    enablePartitionMerge: false
    enablePerRegionPerPartitionAutoscale: false
    enableBurstCapacity: false
    enablePriorityBasedExecution: false
    minimalTlsVersion: 'Tls12'
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
      maxIntervalInSeconds: 5
      maxStalenessPrefix: 100
    }
    locations: [
      {
        locationName: 'Australia Southeast'
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    cors: []
    capabilities: []
    ipRules: []
    backupPolicy: {
      type: 'Periodic'
      periodicModeProperties: {
        backupIntervalInMinutes: 240
        backupRetentionIntervalInHours: 8
        backupStorageRedundancy: 'Local'
      }
    }
    networkAclBypassResourceIds: []
    diagnosticLogSettings: {
      enableFullTextQuery: 'None'
    }
    capacity: {
      totalThroughputLimit: 4000
    }
  }
}


resource storageAccounts_staysydstaticweb01_name_resource 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageAccounts_staysydstaticweb01_name
  location: 'australiaeast'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    allowedCopyScope: 'AAD'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource profiles_my_cdn_profile_webdev_name_cmdev01 'Microsoft.Cdn/profiles/endpoints@2025-04-15' = {
  parent: profiles_my_cdn_profile_webdev_name_resource
  name: 'cmdev01'
  location: 'Global'
  properties: {
    originHostHeader: 'staysydstaticweb01.z8.web.core.windows.net'
    contentTypesToCompress: [
      'application/eot'
      'application/font'
      'application/font-sfnt'
      'application/javascript'
      'application/json'
      'application/opentype'
      'application/otf'
      'application/pkcs7-mime'
      'application/truetype'
      'application/ttf'
      'application/vnd.ms-fontobject'
      'application/xhtml+xml'
      'application/xml'
      'application/xml+rss'
      'application/x-font-opentype'
      'application/x-font-truetype'
      'application/x-font-ttf'
      'application/x-httpd-cgi'
      'application/x-javascript'
      'application/x-mpegurl'
      'application/x-opentype'
      'application/x-otf'
      'application/x-perl'
      'application/x-ttf'
      'font/eot'
      'font/ttf'
      'font/otf'
      'font/opentype'
      'image/svg+xml'
      'text/css'
      'text/csv'
      'text/html'
      'text/javascript'
      'text/js'
      'text/plain'
      'text/richtext'
      'text/tab-separated-values'
      'text/xml'
      'text/x-script'
      'text/x-component'
      'text/x-java-source'
    ]
    isCompressionEnabled: true
    isHttpAllowed: true
    isHttpsAllowed: true
    queryStringCachingBehavior: 'IgnoreQueryString'
    origins: [
      {
        name: 'default-origin-b0b53b91'
        properties: {
          hostName: 'staysydstaticweb01.z8.web.core.windows.net'
          httpPort: 80
          httpsPort: 443
          originHostHeader: 'staysydstaticweb01.z8.web.core.windows.net'
          priority: 1
          weight: 1000
          enabled: true
        }
      }
    ]
    originGroups: []
    geoFilters: []
  }
}

resource databaseAccounts_azcosmoscrc01_name_cmdevcosdb 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2024-12-01-preview' = {
  parent: databaseAccounts_azcosmoscrc01_name_resource
  name: 'cmdevcosdb'
  properties: {
    resource: {
      id: 'cmdevcosdb'
    }
  }
}

resource databaseAccounts_azcosmoscrc01_name_00000000_0000_0000_0000_000000000001 'Microsoft.DocumentDB/databaseAccounts/sqlRoleDefinitions@2024-12-01-preview' = {
  parent: databaseAccounts_azcosmoscrc01_name_resource
  name: '00000000-0000-0000-0000-000000000001'
  properties: {
    roleName: 'Cosmos DB Built-in Data Reader'
    type: 'BuiltInRole'
    assignableScopes: [
      databaseAccounts_azcosmoscrc01_name_resource.id
    ]
    permissions: [
      {
        dataActions: [
          'Microsoft.DocumentDB/databaseAccounts/readMetadata'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/executeQuery'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/readChangeFeed'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/read'
        ]
        notDataActions: []
      }
    ]
  }
}

resource databaseAccounts_azcosmoscrc01_name_00000000_0000_0000_0000_000000000002 'Microsoft.DocumentDB/databaseAccounts/sqlRoleDefinitions@2024-12-01-preview' = {
  parent: databaseAccounts_azcosmoscrc01_name_resource
  name: '00000000-0000-0000-0000-000000000002'
  properties: {
    roleName: 'Cosmos DB Built-in Data Contributor'
    type: 'BuiltInRole'
    assignableScopes: [
      databaseAccounts_azcosmoscrc01_name_resource.id
    ]
    permissions: [
      {
        dataActions: [
          'Microsoft.DocumentDB/databaseAccounts/readMetadata'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*'
        ]
        notDataActions: []
      }
    ]
  }
}

resource Microsoft_DocumentDB_databaseAccounts_tableRoleDefinitions_databaseAccounts_azcosmoscrc01_name_00000000_0000_0000_0000_000000000001 'Microsoft.DocumentDB/databaseAccounts/tableRoleDefinitions@2024-12-01-preview' = {
  parent: databaseAccounts_azcosmoscrc01_name_resource
  name: '00000000-0000-0000-0000-000000000001'
  properties: {
    roleName: 'Cosmos DB Built-in Data Reader'
    type: 'BuiltInRole'
    assignableScopes: [
      databaseAccounts_azcosmoscrc01_name_resource.id
    ]
    permissions: [
      {
        dataActions: [
          'Microsoft.DocumentDB/databaseAccounts/readMetadata'
          'Microsoft.DocumentDB/databaseAccounts/tables/containers/executeQuery'
          'Microsoft.DocumentDB/databaseAccounts/tables/containers/readChangeFeed'
          'Microsoft.DocumentDB/databaseAccounts/tables/containers/entities/read'
        ]
        notDataActions: []
      }
    ]
  }
}

resource Microsoft_DocumentDB_databaseAccounts_tableRoleDefinitions_databaseAccounts_azcosmoscrc01_name_00000000_0000_0000_0000_000000000002 'Microsoft.DocumentDB/databaseAccounts/tableRoleDefinitions@2024-12-01-preview' = {
  parent: databaseAccounts_azcosmoscrc01_name_resource
  name: '00000000-0000-0000-0000-000000000002'
  properties: {
    roleName: 'Cosmos DB Built-in Data Contributor'
    type: 'BuiltInRole'
    assignableScopes: [
      databaseAccounts_azcosmoscrc01_name_resource.id
    ]
    permissions: [
      {
        dataActions: [
          'Microsoft.DocumentDB/databaseAccounts/readMetadata'
          'Microsoft.DocumentDB/databaseAccounts/tables/*'
          'Microsoft.DocumentDB/databaseAccounts/tables/containers/*'
          'Microsoft.DocumentDB/databaseAccounts/tables/containers/entities/*'
        ]
        notDataActions: []
      }
    ]
  }
}

resource storageAccounts_staysydstaticweb01_name_default 'Microsoft.Storage/storageAccounts/blobServices@2024-01-01' = {
  parent: storageAccounts_staysydstaticweb01_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: false
    }
  }
}



resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_staysydstaticweb01_name_default 'Microsoft.Storage/storageAccounts/fileServices@2024-01-01' = {
  parent: storageAccounts_staysydstaticweb01_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: false
      days: 0
    }
  }
}



resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_staysydstaticweb01_name_default 'Microsoft.Storage/storageAccounts/queueServices@2024-01-01' = {
  parent: storageAccounts_staysydstaticweb01_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}


resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_staysydstaticweb01_name_default 'Microsoft.Storage/storageAccounts/tableServices@2024-01-01' = {
  parent: storageAccounts_staysydstaticweb01_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource profiles_my_cdn_profile_webdev_name_cmdev01_resume_cmdevelop_com 'Microsoft.Cdn/profiles/endpoints/customdomains@2025-04-15' = {
  parent: profiles_my_cdn_profile_webdev_name_cmdev01
  name: 'resume-cmdevelop-com'
  properties: {
    hostName: 'resume.cmdevelop.com'
  }
  dependsOn: [
    profiles_my_cdn_profile_webdev_name_resource
  ]
}

resource profiles_my_cdn_profile_webdev_name_cmdev01_default_origin_b0b53b91 'Microsoft.Cdn/profiles/endpoints/origins@2025-04-15' = {
  parent: profiles_my_cdn_profile_webdev_name_cmdev01
  name: 'default-origin-b0b53b91'
  properties: {
    hostName: 'staysydstaticweb01.z8.web.core.windows.net'
    httpPort: 80
    httpsPort: 443
    originHostHeader: 'staysydstaticweb01.z8.web.core.windows.net'
    priority: 1
    weight: 1000
    enabled: true
  }
  dependsOn: [
    profiles_my_cdn_profile_webdev_name_resource
  ]
}

resource databaseAccounts_azcosmoscrc01_name_cmdevcosdb_Counter 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2024-12-01-preview' = {
  parent: databaseAccounts_azcosmoscrc01_name_cmdevcosdb
  name: 'Counter'
  properties: {
    resource: {
      id: 'Counter'
      indexingPolicy: {
        indexingMode: 'consistent'
        automatic: true
        includedPaths: [
          {
            path: '/*'
          }
        ]
        excludedPaths: [
          {
            path: '/"_etag"/?'
          }
        ]
      }
      partitionKey: {
        paths: [
          '/id'
        ]
        kind: 'Hash'
        version: 2
      }
      uniqueKeyPolicy: {
        uniqueKeys: []
      }
      conflictResolutionPolicy: {
        mode: 'LastWriterWins'
        conflictResolutionPath: '/_ts'
      }
      computedProperties: []
    }
  }
  dependsOn: [
    databaseAccounts_azcosmoscrc01_name_resource
  ]
}

resource storageAccounts_staysydstaticweb01_name_default_web 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_staysydstaticweb01_name_default
  name: '$web'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'Blob'
  }
  dependsOn: [
    storageAccounts_staysydstaticweb01_name_resource
  ]
}

resource storageAccounts_staysydstaticweb01_name_default_azure_webjobs_hosts 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_staysydstaticweb01_name_default
  name: 'azure-webjobs-hosts'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_staysydstaticweb01_name_resource
  ]
}

resource storageAccounts_staysydstaticweb01_name_default_azure_webjobs_secrets 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_staysydstaticweb01_name_default
  name: 'azure-webjobs-secrets'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_staysydstaticweb01_name_resource
  ]
}

resource storageAccounts_staysydstaticweb01_name_default_scm_releases 'Microsoft.Storage/storageAccounts/blobServices/containers@2024-01-01' = {
  parent: storageAccounts_staysydstaticweb01_name_default
  name: 'scm-releases'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_staysydstaticweb01_name_resource
  ]
}
