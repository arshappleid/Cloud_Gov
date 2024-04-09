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
