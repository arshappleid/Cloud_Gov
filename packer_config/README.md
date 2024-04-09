### Different Steps of Generating Images

1. Source - From Where do we consume our original code base from.
   - In our case we consume from github , docker code base.
     - Image_offer - Ubuntu , since we will be using ubuntu as the preffered OS.
2. Builder - Since We are using a AWS Code Build Environment as part of our pipeline, we will use that as our Build Source.

### Installing Packer

##### MacOs for Development

```bash
brew install packer
packer --version
packer -autocomplete-install
```

###### Docker Installation

Read the docker file , to see how packer was installed

###### Development Commands

```bash
packer build
packer fmt 
packer validate ## Helps find errors in config
packer inspect ## Inspect different variables
```

###### Configuring ENV Variables

```bash
export PACKER_LOG=1
export PACKER_LOG_PATH=./packer_config/logs/packerlog.txt
```

##### Ubuntu

How to configure packer on the source Machine, that will provision the the different images

Replace the version # with the target version number

###### Install

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer
sudo cp /usr/bin/packer /usr/local/bin/packer
```

###### Validate

```bash
which packer
/usr/local/bin/packer
```



### Environment Variables

Since Packer will deploy resources in AWS , and Azure to build the images , and store them in S3 or Blob stores. We need to configure approriate environment variables for it do so. 

Points where this can be configured : AWS Project Build ENV variables. Since technically this machine, will be our cloud packer env.

###### Azure Credentials

```bash
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
ARM_CLIENT_ID
ARM_CLIENT_SECRET
```

###### AWS Credentials

```bash
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```



#### How to Deploy Packer

1. Create an AWS Instance , and install packer on it. (Use the above ubuntu installation steps)
2. Configure AWS , Azure Environment variables, as listed above.
3. Setup CICD pipeline, that everytime tests are passed in your latest codebase. Trigger Packer to create new images in AWS , Azure.
4. Setup CICD , to consume the latest images that have been already created by Packer. These will be in the S3 , Blob storage directories.

### Webapp Setup

- Create a ```/assests/setup-web.sh``` file , in the main project repo. And configure it to start the application.

  ```bash 
  #!/usr/bin/env sh
  
  cp /tmp/assets/webapp /usr/local/bin/
  chmod +x /usr/local/bin/*
  cp /tmp/assets/webapp.service /lib/systemd/system/webapp.service
  service webapp start			## Can be any sorts of commad , start node, .NET
  systemctl enable webapp					
  ```

- 
