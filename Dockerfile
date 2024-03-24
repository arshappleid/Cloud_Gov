# Start from a basic Alpine Linux image
FROM alpine:3.19.1
WORKDIR /cloud_gov
COPY iac/ ./iac/
COPY cicd_for_iac/ ./cicd_for_iac/
COPY iam_roles/ ./iam_roles/
COPY scripts/ ./scripts/


# Install curl and unzip, which are needed to download and extract Terraform
RUN apk add --no-cache curl unzip

# Set environment variables for versions
ARG TERRAFORM_VERSION=1.7.4
ARG TERRAGRUNT_VERSION=0.28.1
ARG GO_VERSION=1.21.8-r0

# Install Terraform
RUN curl -Lo terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip terraform.zip -d /bin && \
    rm terraform.zip && \
    curl -Lo terragrunt "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" && \
    chmod +x terragrunt && \
    mv terragrunt /bin && \
    apk add --no-cache "go=$GO_VERSION" && \
    apk add --no-cache bash
    # Set a default command
CMD ["tail", "-f", "/dev/null"]
