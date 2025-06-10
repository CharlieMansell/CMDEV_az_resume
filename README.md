# Azure Cloud Resume

This repository holds the code for my attempt at the Azure Cloud Resume Challenge.

The Cloud Resume Challenge is a hands-on, end-to-end cloud engineering project designed to demonstrate your practical cloud skills by building and deploying a resume website using real cloud infrastructure. It was created by Forrest Brazeal, a cloud educator, to help aspiring and current cloud professionals showcase their skills beyond certifications.

[Cloud Resume Challenge](https://cloudresumechallenge.dev/)

## My Experience

I found this project extremely helpful, to be able to further showcase my skillset on the Azure Platform, being able to have a practical experience beyond my certifications, that I can talk through in great detail, without breaching an NDA.... 

I will be using this site moving forward to showcase other projects within the Microsoft 365 / Azure Space, as I have found I really enjoy writing blog posts - that can hopefully help others to understand concepts that I have learnt. 

If you would like to read more about my experience, feel free to check out my blog post on the challenge [here](https://resume.cmdevelop.com/AzResumeBlogPost.html)

You can view my site [here](https://resume.cmdevelop.com)

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

## Acknowledgments

* The random reddit post that I stumbled across, where I first learnt of the challenge.
* [Gwyn P @ Cloud Guru](https://www.pluralsight.com/resources/blog/cloud/cloudguruchallenge-your-resume-in-azure) - This helped me to conceptualize any concepts I was struggling with, particularly as C# was very new to me. 