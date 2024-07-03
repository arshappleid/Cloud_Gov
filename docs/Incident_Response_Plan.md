Last Updated: June 24, 2024, by Prabhmeet Singh Deol 
## Introduction
Note: It was assumed that the video conferencing agency's name was snappy.
### Purpose
This document describes snappy's Incident Response plan for preparing and responding to information security incidents. It describes the primary elements of an effective incident response plan, including roles, responsibilities, phases, and lifecycle. The goal of this Incident Response Plan is to prepare for detection of cyber attacks and then respond and document them. It provides a framework by which the Incident Response Team (IRT) shall determine the scope and risk of an incident, react appropriately to that incident, communicate the results and risks to all stakeholders, and reduce the likelihood of an incident from occurring or reoccurring (State Of Michigan, 2024).
### Maintaining Currency
Prabhmeet Singh Deol is responsible for maintaining and revising this document and ensuring that it is always ready.

### Scope
This plan applies to Information Systems, Company Data, and networks of Snappy LLC and any person or employee with access to these systems.
### Stakeholders
Any cybersecurity attacks need to be reported to CEO, CTO, Cybersecurity Chief Officer, and the IT Team Leader. Additionally, the Federal government needs to be informed of any cyber incidents too.
### Definitions

1. Cyber Attacks - An event occurring on or conducted through a computer network that actually or imminently jeopardizes the confidentiality, integrity, or availability of computers, information or communications systems or networks, physical or virtual infrastructure controlled by computers or information systems, or information resident thereon  (Homeland Security , 2016).

2. Incident Management - Is the process of taking measures to prevent cyber attacks.

3. Incident Response is the process of responding to a cyber attack, which would include the folowing phases :  preparation, identification, containment, eradication, recovery, and Lessons Learned.

  

  

  

  

## Incident Response Plan

This document was developed in accordance with National Institute of Standards and Technology (NIST) Special Publication 800-61 rev. 2, the Incident Response Plan consists of a series of phases—distinct sets of activities that will assist in handling a security incident, from start to finish (State Of Michigan , 2024). 

### Identifying Valuable assets

Since the organization stores valuable client information in database records, credit card information for payment processing, and is a useful tool for organizations for their day-to-day activities. It is realized that any loss of information or availability of services to its clients could result in financial loss, Legal and Regulatory Consequences, Loss of intellectual property, and Trust Erosion. Therefore, all the information stored by the company needs to be secured, and its clients' availability needs to be maintained.
### Roles & Responsibilities

* CEO - [CEO Name here] will be required to be notified of any incidents since they will be responsible for mitigating any damage to the company's reputation. They will also be responsible for hiring a Cybersecurity Team to safeguard their company's infrastructure. 
* CTO—[CTO Name here] must be notified to ensure that the company's applications are running correctly after an attack and that the IRP plan has been successfully carried out and documented.
* IT Team Lead - [IT Team Lead Name here] will manage and carry out the IRP plan alongside the cybersecurity and IT teams.
* IT Team—This team will be responsible for provisioning any devices for use by company employees and ensuring appropriate security configurations have been set up on their devices before being signed off.
* Cybersecurity Team—This team will observe all applications' maintenance, patching, and updating. They will also be responsible for performing penetration testing or generating playbooks required as part of the IRP.
* Security Architect—[Security Architect Name] will be responsible for designing the Secure Architecture of the company's applications, implementing principles such as zero-trust architecture, and provisioning the company's identity management system.


The CTO or the CEO should report the incident to the required Federal Agencies (FBI) since 
every cyber-attack needs to be reported to the legal agencies as part of the Law (Homeland Security, 2016).





## IPR Phases
### Preparation


The organization will take the following policies and steps to ensure that Snappy’s data, infrastructure, and trade secrets are safeguarded from cyber incidents.


1. Security Awareness Training - Each employee handling any type of company or customer data, will be required to undergo additional training in malware, phishing, social engineering, ransomware, and other threats as they become known. Additionally, these trainings will be carried out every 4 months and will expect employees to have understood 80% of the material.
2. Malware/Antivirus/Spyware Protection - Every company device provisioned will have an Antivirus installed to continuously check for malware. The device user will not have permission to make any changes to the configuration of the software. Additionally, the antivirus will monitor all downloads to the devices. Any suspicious activity detected will be immediately reported to the organization’s security team.
3. Access to servers - Physical Access to on-prem servers will be only provided by bypassing advanced security personnel, and by providing necessary credentials. Additionally, access to these servers will be only limited to select individuals including : Senior IT Administrators, CEO , and the CTO.
4. Patching/ Updating - The IT team will take proactive steps to ensure that any server is running on the most current operating system and that any device provisioned to employees also has the latest OS. Each operating system version will be first tested for any known vulnerabilities with current company software and then provisioned to the other devices.
5. Event/Logs—Any application provisioned by the organization will have necessary logs relating to usage, unusual behavior, and network access through network flow logs. 
6. Monitoring - The organization will hire dedicated professionals to monitor important benchmarks for applications, and will report and act upon any unusual activity right-away.
7. Firewall implementation - The organization will ensure that any company network is protected by secure firewalls, and all traffic is monitored. It will also prevent access from locations, it is not expected to provide services in. Since the organization will make primary use of AWS services with its on prem servers, AWS WAF will be the primary firewall of choice.
8. App Architecture principles - Any company application will be built using Zero Architecture principles in mind, and will reference the NIST Zero Architecture (Rose, S. , 2020).
9. Playbooks - For any new application, a detailed playbook that will track for as many vulnerabilities as possible,  and generate a detailed report regarding any losses and any known exploits.
10. Encryption policies - Any data stored by the organization will be encrypted using AES-256 and SHA-256 protocols. Also encryption for data at rest and data in transit will be implemented. Additionally, it will be ensured that any artifacts part of the CICD pipelines are also encrypted.
11. Implementation of Security Tokens—Any application will gain access to other services using token-based authentication, and provisioning of these tokens will be done on a temporary basis only for the duration of the application service. Tokens will be regularly revoked and rotated to ensure that attackers who gain access to any of the services will not have access to the service for long.
12. Backup and retention - Any data being collected by the organization, will be backed up every 30 minutes and made available in a different region (geographically), as part of the disaster recovery strategy. If the primary region of AWS based deployment is us-east-1 , then us-east-4 should be used as the disaster recover region.
13. Internal Identity Management Systems—Every internal company application will be made accessible through Microsoft Active Directory and will also utilize Microsoft’s MFA solution as part of the authentication process. Each employee device will also utilize Active Directory to authenticate its owner to the company device and will monitor for activity before it logs the user out after 30 minutes of inactivity.
14. Identity Management System for External Applications - Every client based application will utilize SAML based authentication from Okta , and will also require MFA authentication using 6-digit one time passwords using the Okta mobile application.
### Identification


If a cyber attack happens, the designated cybersecurity professionals will follow the following steps to track the incident, report stakeholders, and attempt to isolate the malware or recover the data.


1. A person who first identifies that a cyber attack has occured, will immediately notify the CEO, CTO , IT team leader, and all the cybersecurity professionals through email.
2. Immediately after the attack, all tests for the application's availability should ran to ensure that customers can still access the application. If customers cannot access the application, efforts should be made to restore access to the application. The IT Team should redploy the application in a different Region, using the backup database store, and drives. 
3. The Cybersecurity team should run all the applicationplaybooks, to identify the source of the attack and see which application have been affected. Regardless of whether any evidence is found, this should be documented as part of the evidence.
4. The IT Team should inspect the Database records, to check if any records have been poised. This could be investigated by checking the database's usage logs. If records have been poised, switch to Database backup snapshot, and document the time between which the data will lost. Make efforts to recover this data from the poised database records.
5. The cybersecurity team should investigate all the logs for the duration of the attack, including application logs, network logs and access logs.
### Containment

After Inspecting all the logs and Identifying the cause of the attack, the Cybersecurity Team should immediatly fix and document the issues. They must patch the vulnerabilities in the Operating systems, identify and fix the vulnerabilities in the application code, and record any intruder information such as IP address or which access credentials they used.
### Eradication

The cybersecurity team should take measures to block any IP addresses that resemble the IP’s of the attackers, and fix any vulnerabilities in the operating system. If OS vulnerabilities cannot be fixed promptly, the team should temporarily switch the applications to an alternative operating system until the issues are fixed. Consider writing automated tests that would mimic the attack and can notify if it were to occur in the future. This could be part of application tests or even Infrastructure tests. After all the fixes have been made, ensure that all the tests are running as part of the new patches and secure CICD pipelines were utilized to deploy any new versions of the app. 
###  Lessons learned

The cybersecurity team should review the point of exploitation and research and fix any similar vulnerabilities. Awareness regarding the attack should be raised within the company and the community.
Stakeholder Contact Information





## Stakeholder Contact Information
| Role               | Name                      | Contact Email              |
| ------------------ | ------------------------- | -------------------------- |
| CEO                | [CEO Name here]           | [CEO Email here]           |
| CTO                | [CTO Name here]           | [CTO Email here]           |
| IT Team Lead       | [IT Team Lead Name here]  | [IT Team Lead Email here]  |
| IT Team            | -                         | -                          |
| Cybersecurity Team | -                         | -                          |
| Security Architect | [Security Architect Name] | [Security Architect Email] |



## References 
Homeland Security. (2016). National Cyber Incident Response Plan PRE-DECISIONAL DRAFT NATIONAL CYBER INCIDENT RESPONSE PLAN. https://www.cisa.gov/sites/default/files/ncirp/National_Cyber_Incident_Response_Plan.pdf


‌Rose, S., Borchert, O., Mitchell, S. and Connelly, S. (2020), Zero Trust Architecture, Special Publication (NIST SP), National Institute of Standards and Technology, Gaithersburg, MD, [online], https://doi.org/10.6028/NIST.SP.800-207.


Kirvan, P. (2024). How to build an incident response plan, with examples, template. Security; TechTarget. https://www.techtarget.com/searchsecurity/feature/5-critical-steps-to-creating-an-effective-incident-response-plan
Raderman, L. (2014). Computer Security Incident Response Plan. Carnegie Mellon. https://www.cmu.edu/iso/governance/procedures/incidentresponseplanv1.6.pdf
‌Example Incident Response Plan. (n.d.). https://www.michigan.gov/-/media/Project/Websites/msp/cjic/pdfs6/Example_Incident_Response_Policy.pdf?rev=4bf335b6d1344226a92a0947bc8688ec
‌