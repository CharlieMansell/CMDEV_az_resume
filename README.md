# Azure Cloud Resume

Simple overview of use/purpose.

## Description

An in-depth paragraph about your project and overview of use.

## Getting Started

### Dependencies

* Powershell 5.1

#### PowerShell Modules

* ExchangeOnlineManagement (version 3.7.1)
* Microsoft.Graph.Authentication (version 2.26.1)
* Microsoft.Graph.Users (version 2.26.1)
* Microsoft.Graph.Identity.DirectoryManagement (version 2.26.1)
* PowerShellGet (version 2.2.5)

These modules must be installed as an administrator, and can be done with the below command. 

```
Install-Module -Name <ModuleName> -Scope AllUsers -Force
```

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Deployment

* Deploy Azure Infra with Bicep
```
New-AzResourceGroupDeployment -ResourceGroupName arg-cloudresumechallenge -TemplateFile '.\deploy.bicep'
```
* Enable Static Web Hosting on $web container 
```
az storage blob service-properties update --account-name staysydstaticweb01  --static-website --404-document 404.html --index-document index.html
```
* Push a change to front-end, this will trigger the yml workflow to update the $web folder with the most up to date content. Alternatively, place the web content here. 
* Build Function using VSCode Extension, and deploy to Azure - CMDevGetResumeCount
* Verify CNAME & custom domain configuration on CDN Endpoint. 


## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release


## Acknowledgments

Inspiration, code snippets, etc.
* Nothing currently
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)