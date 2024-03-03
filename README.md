## Description

A cloud solution for a subset of government organization, created using NSA and CISA  Top 10 Cybersecurity Mitigation Strategies. This cloud Solution can act as a template to manage their overall cloud infrastructure , and expand their network to allow for additional apps in the future. By providing seamless , and easy integration to their current secure infrastructure.

The solution has been optimized for Operational Excellence , Security , Reliability , Performance , Cost Optimization. It has also been made sure to meet the Impact level 4 requirements as per [Department of  Defense (DOD) IL-4 Guidelines](./docs/DOD_IL_Requirements.pdf) from DISA, [NSA Top 10 Security Strategy](./docs/NSA_Top10_Security_Strategy), and [OWASP Top 10 Security Risks](https://owasp.org/www-project-top-ten/).

## Repo Design

```
.
├── docs # All the Documentation files are in this folder
│ ├── closing_presentation.pptx # Small Presentation with an overview of project
│ ├── procurement_request # Initial project request , highlighting high-level requirements of the project.
│ ├── requirements.docx # Final requirements for the project.
│ └── ...
├── iam_role # All the code related to setting up authentication. 
├── infrastructure_As_Code # All the code for different resources in the solution , organized by VPC names.
├── database.sql # Potential Schema design for an application
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
- Any access to internet from the CSO , must be through a <u>specific Internet Line</u>.
- Prevent any backdoor access from the internet.

### Security Risks Identified and accounted for

- Broken Access Control / In efficient Access Control - Seperate AD VPC .
- Secure Infrastructure Design - Implementing aws secure architecture design.
- Security Logging and Monitoring - Cloud Watch Alarms , and Logs Recording.
- Cryptographic Key Failures - Automatic key rotation

### System Design Choices Implemented

* Caching - CDN Caching through Cloudfront , Cache Aside (S3 bucket), Write Behind (FIFO Que).
* Database Caching - Aurora Buffer pool, connection pooling.
* High Availability - Multi-AZ deployment , Que - Based Load Leveling , Database Connection pool.
* Resiliency - Backup Solution (Azure Backup Solution), Retry, Health Endpoint Monitoring.
* Monitoring - Health , Availability , Performance , Security , Usage , Alerts.
* Security - Gatekeepr VPC , Federated Identity (Microsoft AD) , Network Segmentation.

## Maintenance after Deployment

- Rotate passwords every n days , for users accessing cloud resources.
  - Continue with 2 MFA Account login , for users.
- Analyze Cloudwatch Logs , to look for any malicious activity.
- Respond to SNS notifications, regarding any changes in cloud infrastructure.

### Completed Checklilst

| Security VPC - Done  | IAM Infrastructure               |                                       |
| -------------------- | -------------------------------- | ------------------------------------- |
| Front End VPC - Done | Connection Testing - In Progress | MultiCloud Risk Backup Strategy       |
| Back End VPC         | Configure Environments           | Deploy developer unit for development |
| Database VPC         | Propose CICD Pipeline            |                                       |
| Active Directory VPC | Logging at VPC Level             |                                       |

## Important Links:

- [Original Procurement Document Request](./docs/procurement_request.pdf)
- [Functional &amp; Non Functional Requirements](./docs/requirements.docx)
- [Architecture Documentation](./docs/architecture.docx)
- [Infrastructure as Code](./Infrastructure_as_Code)
- [Testing Procedure](./docs/testing_procedures.docx)

## Latest Architecture Design

<img src="./images/architecture.png" alt="Design System Architecture" style="zoom: 50%;" />

## CICD Pipeline

<img src="./images/cicd_pipeline.png" alt="CICD Pipeline" style="zoom: 65%;" />


## IAM Infrastructure

<img src="./images/IAM_Infrastructure.png" alt="IAM Infrastructure" style="zoom: 33%;" />

## Proposed Database Schema Design

<img src="./docs/ER_Diagram.png" alt="Database Schema" style="zoom: 33%;" />
