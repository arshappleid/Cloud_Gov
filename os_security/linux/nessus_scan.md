## Nessus Scan
Nessus is a vulnerability scanner tool, which looks for vulnerabilities in devices, applications, operating systems, cloud services, and network resources to detect security weaknesses such as software flaws, missing patches, misconfigurations, and malware. The biggest advantage to nessus is its integration with the MITRE ATT&CK Database which tracks latest attack strategies and exploits that attackers use to vulnerabilities in systems. This scan should be automated to be performed atleast once each day to allow automated checkup of vulnerabilities. 

It is best strategy to deploy nessus on a bastion host, which then SSH's into target servers to perform the Scan. This will require the bastion host server to have to access to the network segment of the target host. Additionally it will require the SSH Keys for all the target Devices. 

To implement Least Privelege Access, it will be important to limit the Access rights of the user account the bastion account uses to perform the scan. 

### Implementation Strategy 
1. SSH Access from the bastion host - Change the Security Group / Firewall Rules just before the scan starts to allow the bastion host SSH into the target device. Ensure that ssh is restricted only from the Static IP of the bastion host. 

2. Nessus User account access - Use an AMI / OS snapshot with a nessus user account, which has limited priveleges to perform the scan. The snapshot should also have all the required packages to perform the scan. Configure the **nessus** user in the sudoers file to have the followin access without having to input the password (will be key for automation). 

```
nessus ALL=(ALL) NOPASSWD: /bin/su, /bin/bash, /usr/bin/dpkg, /usr/bin/rpm, \
/usr/bin/yum, /usr/bin/apt-get, /usr/bin/apt, /usr/bin/systemctl, \
/usr/bin/service, /usr/sbin/service, /sbin/ifconfig, /usr/sbin/ifconfig, \
/bin/netstat, /usr/bin/netstat, /usr/sbin/ip, /usr/bin/ip, /bin/cat, \
/usr/bin/uname, /usr/bin/ls, /usr/bin/find
```
3. Execute the nessus command from the bastion host. 

Initially the policy document can be created by using the UI. 

Steps to Create via UI

1. Log into Nessus Web UI (via port-forward or direct access).
2. Go to Policies → New Policy.
3. Choose a template (e.g., Advanced Network Scan).
4. Under Credentials → SSH:
	- Username: nessus
	- Auth Method: Password or Public Key (paste the private key or browse to upload).
	- Privilege Escalation: sudo (if non-root).
5. Save the policy with a clear name (e.g., SSH Credentialed Scan via Nessus User).

```
/opt/nessus/sbin/nessuscli policy --import SSH_Credentialed_Scan_via_Nessus_User.nessus

/opt/nessus/sbin/nessuscli scan --targets <target-ip> \
  --policy "SSH Credentialed Scan via Nessus User" \
  --output /tmp/<scan-report>.nessus

```

Now the scan can be automated to run each day. 

## Configuring Automatic Nessus Scans on a Linux Server.


## References 
Awati, R. (2025, February 18). What is the Nessus vulnerability scanning platform? TechTarget.

Tenable, Inc. (2017, October 30). Configuring least privilege SSH scans with Nessus. Tenable Blog. https://www.tenable.com/blog/configuring-least-privilege-ssh-scans-with-nessus