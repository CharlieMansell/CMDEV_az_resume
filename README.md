# Azure Cloud Resume

This repository holds the code for my attempt at the Azure Cloud Resume Challenge.

The Cloud Resume Challenge is a hands-on, end-to-end cloud engineering project designed to demonstrate your practical cloud skills by building and deploying a resume website using real cloud infrastructure. It was created by Forrest Brazeal, a cloud educator, to help aspiring and current cloud professionals showcase their skills beyond certifications.

[Cloud Resume Challenge](https://cloudresumechallenge.dev/)

## Description



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