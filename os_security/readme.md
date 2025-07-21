## Operating System Choice 
Use a minimal operating system to reduce the chance of zero day vulnerability and possible future failures. 

## Firewall Config
For this setup, lets assume the applications are public facing web apps, and only allow traffic on port 443.

Also allow traffic only 

## Consuming Environment Variables

Assuming env variables are stored in AWS ssm service, and the iam service role for the instance has the correct permissions. in the following format
```
VAR1=value1
VAR2=value2
```

## CICD setup
The user-account.md file should be used to create a role and user with least privilege access to run the application service as a background process.

The build stage should compile the source code and store the JAR file, along with separate artifacts, in an S3 bucket. The AMI should be generated and stored in an S3 bucket, with the compiled code in the /app folder and the systemd file included. The systemd file will handle downloading the environment variables and launching the application.

Using the user account defined, after testing and building the app in a separate environment, the following systemd unit service file should be created and configured to launch on startup. The following command will enable the service to run automatically on boot once the ASG starts up. This needs to be automated as part of the AMI creation process.


```
# 1. Copy your systemd unit file to the correct directory
sudo cp myapp.service /etc/systemd/system/myapp.service

# 2. Reload systemd to read the new unit file
sudo systemctl daemon-reload

# 3. Enable the service to auto-start on boot for all future instances
sudo systemctl enable myapp.service
```


## Security Strategy

Shell access, and access to system directories has been limited to prevent any malicious code taking access of system level commands or modules. 