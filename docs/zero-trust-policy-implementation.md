## This document hightlights the different strategies implemented, to implement the Zero Trust Architecture

### Implementation of Identity Management System 

### Network Requirements for Zero Trust Architecture

#### Considering every other network hostile , even within the enterprise.
All inter-vpc communication should be encrypted 

#### Enterprise can observe all network traffic.
Enterprise can observe all network traffic.

#### Enterprise resources should not be reachable without accessing Policy Enforcement Point.
Every Application will require, Active Driectory Authorization to get consumed.

### Multi Cloud - Hybrid Applications should allow Applications in Cloud A , to talk directly to Cloud B.


### Utilizing Terraform vault, to manage access Credentials.
1. For ASG units, access credentials will only be created / granted when the new unit is turned on. Once the new additional unit is no longer needed a LifeCycle hook will automatically revoke its acess credentials.

2. Any tokens provisioned, will be bound to to CIDR(s) to ensure that even if tokoens are stolen. They will not be able to work from a different CIDR range. Ensure than access to data plane, can only be made from certan CIDR ranges.

3. All access credentials provisioned will be recorded and monitored, into an EFS drive.

4. Collaboration across Enterprises will be provisioned through guest access using Active directory. And any temporary application process will be provisioned using vault tokens, that will have a set expiration time.