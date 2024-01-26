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
| Front End VPC - Done | Connection Testing - In Progress |  |
| Back End VPC | Configure Environments |  |
| Database VPC | Document CICD Pipeline |  |
| Active Directory VPC |  |  |

### Security Principles Implemented
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
![Design System Architecture](./images/architecture.png)

## IAM Infrastructure
![IAM Infrastructure](./images/IAM_Infrastructure.png)

## Proposed Database Schema Design
![Database Schema](./2.2_ER_DIAGRAM.pdf)
