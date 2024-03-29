## Description

A cloud solution for a subset of government organization, created using NSA and CISA  Top 10 Cybersecurity Mitigation Strategies. This cloud Solution can act as a template to manage their overall cloud infrastructure , and expand their network to allow for additional apps in the future. By providing seamless , and easy integration to their current secure infrastructure.

The solution has been optimized for Operational Excellence , Security , Reliability , Performance , Cost Optimization. It has also been made sure to meet the Impact level 4 requirements as per [Department of  Defense (DOD) IL-4 Guidelines](./docs/DOD_IL_Requirements.pdf) from DISA, [NSA Top 10 Security Strategy](./docs/NSA_Top10_Security_Strategy.pdf), and [OWASP Top 10 Security Risks](https://owasp.org/www-project-top-ten/).

## Repo Design

```
.
├── docs 									# Project Documentation
│ ├── closing_presentation.pptx 			# Close off Presentation
│ ├── procurement_request 					# Initial project request
│ ├── requirements.docx 					# Project Requirements
│ └── ...
├── cicd_for_iac 							# AWS Codepipeline Config.
├── iam_role 								# Config for IAM roles 
├── iac 									# Terraform Config modules
│	├── aws									# AWS Config Modules
│	├── azure								# Azure Config Modules
├── integration_tests						# Integration Testing with GO
├── database.sql 							# Potential Schema Design
└── README.md

```

## Requirements Overview:

- Multi AZ Availability for high Availability.
- Multi VPC Structure to design a cohesive Infrastructure , for future projects to be able to scale.
- Auto recovery from failure, with very little downtime. Less than 5 minutes.
- Appropriate Logging at individual VPC level.
- There can be upto 100000 concurrent users of the application , at one time during peak hours. Should have high Scaling capacity , to endure high number of User Requests.
- Application should have access from all states of America, with very low latecy. Although , should only be deployed close to MD , for security purposes.
  - Occasionally people might also access it from other parts of the world, and should have access to the application with low latency as well.
- Deploy, plan to maintain and rotate SSL certificates on Endpoints using AWS Ceritificate Manager.
- Document all security compliance rules through AWS Config.

## Department of Defense Impact Level 4 Requirements

- Support for PKI authentication by DID priveleged and non priveleged users.
- Support for DOD IP Addressing.
- Encryption of Data at Rest
- Cloud Solution (CSO) must be able to function if DOD limits access to or disconnects from the internet during times of attack.
- Any access to internet from the CSO , must be through a `<u>`specific Internet Line `</u>`.
- Prevent any backdoor access from the internet, and any traffic to the internet should be monitored.

### Security Risks Identified and accounted for

- Broken Access Control / In efficient Access Control - Seperate AD VPC .
- Secure Infrastructure Design - Implementing aws secure architecture design.
- Security Logging and Monitoring - Cloud Watch Alarms , and Logs Recording.
- Cryptographic Key Failures - Automatic key rotation

### System Design Choices Implemented

* Caching - CDN Caching through Cloudfront , Cache Aside (S3 bucket), Write Behind (FIFO Que).
* Performance - Increase MTU Size for Packets , Create a gateway Endpoint for S3 bucket to be accessed inside the network.
* Database Caching - Aurora Buffer pool, connection pooling.
* High Availability - Multi-AZ deployment , Que - Based Load Leveling , Database Connection pool.
* Resiliency - Backup Solution (Azure Backup Solution), Retry, Health Endpoint Monitoring.
* Monitoring - Health , Availability , Performance , Security , Usage , Alerts.
* Security - Gatekeepr VPC , Federated Identity (Microsoft AD) , Network Segmentation.

## Infrastructure as Code Coding Strategy

IAC was coded with reusability in mind , and also the networking components were seperated from actual Infrastructure. This was to make sure everytime we have to make changes to the actual infrastructure , we do not risk taking down the main networking components.

[Terraform Testing](https://www.hashicorp.com/blog/testing-hashicorp-terraform) strategy was used to test individual components of the infrastructure.

## Provisioning of PKI Keys

PKI keys are provisioned using Terraform Vault , as this gave the oppurtunity to provision the keys in the multi cloud infrastructure.

## Maintenance after Deployment

- Rotate passwords every n days , for users accessing cloud resources.
  - Continue with 2 MFA Account login , for users.
- Analyze Cloudwatch Logs , to look for any malicious activity.
- Respond to SNS notifications, regarding any changes in cloud infrastructure.

## Important Links:

- [Original Procurement Document Request](./docs/procurement_request.pdf)
- [Functional &amp; Non Functional Requirements](./docs/requirements.docx)
- [Project Board](https://github.com/users/arshappleid/projects/4/views/1)

## Latest Architecture Design

<img src="./images/architecture.png" alt="Design System Architecture" style="zoom: 50%;" />

## Sample CICD Pipeline

<img src="./images/cicd_pipeline.png" alt="CICD Pipeline" style="zoom: 65%;" />

Side Note : We will be using Github Repository , with a Code Star Connection instead of Code Commit. Although Rest of the Pipeline stays the same. Also Github Actions will provide additional functionality to perform code checks, and Linting, while the code is being developed. Although only code pipeline will have the ability / AWS Secrets to deploy the architecture.

## IAM Infrastructure

### Infrastructure Management Accounts

![Security Account](./images/Security_account.png)

### Team Management Accounts

<img src="./images/IAM_Infrastructure.png" alt="IAM Infrastructure" style="zoom: 33%;" />

## Threat Detection, Monitoring and response , after Deployment

1. Through Security Hub:
   1. Respond to AWS [Guard Duty](https://aws.amazon.com/guardduty/) EMAIL notifications.
      1. Will notify regarding : Unusual API calls, or unauthorized deployments.
      2. VPC Logs , DNS Logs , CloudTrail Events.
   2. AWS Macie Notifications regarding AWS Account Best Practices.
   3. Inspector - Any security issues from AMI Images.
2. Analyze network logs Dashboards, to understand and lookup any unauthorized access.
3. Monitor Account Access through AWS Control Tower.
4. Follow , and make changes if Trusted Advisor advices of any more best practices.
5. Provision SSM Parameters through [Terraform Vault](https://registry.terraform.io/providers/hashicorp/vault/latest/docs).

## Proposed Database Schema Design

<img src="./docs/ER_Diagram.png" alt="Database Schema" style="zoom: 33%;" />

### Sources Reffered

1. [AWS Documentation to create a CICD Pipeline for Terraform Code] (https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/create-a-ci-cd-pipeline-to-validate-terraform-configurations-by-using-aws-codepipeline.html)
