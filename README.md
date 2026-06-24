## End to End Machine Learning Project

### Steps to deploy in a ec2 of aws

1. Docker build checked
2. Github workflow
3. Create an IAM user in AWS
4. Create ECR in AWS (566540245226.dkr.ecr.us-east-1.amazonaws.com/student_performance)
5. Create a EC2 instance in AWS

## Docker Setup In EC2 commands to be Executed

#optional

sudo apt-get update -y

sudo apt-get upgrade -y

#required

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker ubuntu

newgrp docker

6. Create a self-hosted runner in github

Select linux image

## Configure EC2 as self-hosted runner:

- Download

#Create a folder
mkdir actions-runner && cd actions-runner

#Download the latest runner package
curl -o actions-runner-linux-x64-2.335.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.335.1/actions-runner-linux-x64-2.335.1.tar.gz

#Optional: Validate the hash
echo "4ef2f25285f0ae4477f1fe1e346db76d2f3ebf03824e2ddd1973a2819bf6c8cf  actions-runner-linux-x64-2.335.1.tar.gz" | shasum -a 256 -c

#Extract the installer
tar xzf ./actions-runner-linux-x64-2.335.1.tar.gz

- Configure

#Create the runner and start the configuration experience
./config.sh --url https://github.com/Cesarho96/mlproject --token BTKUBH4EHOUAON4JB37LQR3KHM2B6

in Enter the name of the runner group, you must type: Enter
in Enter the name of  runner, you must type: self-hosted

#Last step, run it!
./run.sh

- Using your self-hosted runner

#Use this YAML in your workflow file for each job
runs-on: self-hosted

7. Add secret keys in github

## Setup github secrets:

AWS_ACCESS_KEY_ID= the access key id that you download when you create the EC2 instances

AWS_SECRET_ACCESS_KEY= the secret access key that you download when you create the EC2 instances

AWS_REGION = us-east-1 (The region from the EC2 is running)

AWS_ECR_LOGIN_URI = 566540245226.dkr.ecr.us-east-1.amazonaws.com (string before the slash of the link of the ecr that we get in step 4)

ECR_REPOSITORY_NAME = student_performance (string after the slash of the link of the ecr that we get in step 4)
