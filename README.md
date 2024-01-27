## Description
A cloud solution for a subset of government organization , that has multiple workflow apps deployed to manage day to day management tasks and relay valuable information to people. This cloud Solution can act as a template to manage their overall cloud infrastructure , and expand their network to allow for additional apps in the future. By providing seamless , and easy integration to their current secure infrastructure.

The solution has been optimized for Operational Excellence , Security , Reliability , Performance , Cost Optimization. While also taking into Governance practices into account.

## Repo Design
```
.
├── docs # All the Documentation files are in this folder
│ ├── closing_presentation.pptx # Small Presentation with an overview of project
│ ├── procurement_request # Initial project request , highlightign high-level requirements of the project.
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
- Scaling capacity , to endure high number of User Requests.
- Auto recovery from failure . 
- Appropriate Logging at individual VPC level.

### Completed Checklilst

| Security VPC - Done | IAM Infrastructure |  |
| ------------------------------ | ---- | ---- |
| Front End VPC - Done | Connection Testing - In Progress |MultiCloud Risk Backup Strategy  |
| Back End VPC | Configure Environments | Deploy developer unit for development |
| Database VPC | Propose CICD Pipeline |  |
| Active Directory VPC | Logging at VPC Level |  |

### Security Risks Identified
- Broken Access Control / In efficient Access Control - Seperate AD VPC .
- Secure Infrastructure Design - Implementing aws secure architecture design.
- Security Logging and Monitoring - Cloud Watch Alarms , and Logs Recording.
- Cryptographic Key Failures - Automatic key rotation


## Important Links:

- [Original Procurement Document Request](./docs/procurement_request.pdf)
- [Functional & Non Functional Requirements](./docs/requirements.docx)
- [Architecture Documentation](./docs/architecture.docx)
- [Infrastructure as Code](./Infrastructure_as_Code)
- [Testing Procedure](./docs/testing_procedures.docx)

## Latest Architecture Design 
<img src="./images/architecture.png" alt="Design System Architecture" style="zoom: 50%;" />

## IAM Infrastructure
<img src="./images/IAM_Infrastructure.png" alt="IAM Infrastructure" style="zoom: 33%;" />

## Proposed Database Schema Design
<img src="./docs/ER_Diagram.png" alt="Database Schema" style="zoom: 33%;" />
