# DevOps Challenge 

## Intro

- First of all, congratulations for reaching this step of the hiring process. The idea with this challenge is to evaluate your analytical and technical skills. 

## The Project

- Our development team needs a “production-ready” deployment of the microservice jumia_phone_validator (README for more details). 
- Your main goal is to create the infrastructure code to automate all the infrastructure and microservice deployment, which means that all configurations and processes must be automated (servers provision, docker images builds, docker containers, firewall management, etc). 

## Goals 

- Automatically configure servers: install required software, configure firewalls and configure SSH access 
- Automatically deploy the microservice jumia_phone_validator with all the required configurations 
- Automatically deploy the [database] service with all the required configurations 
- Don’t use any roles from Ansible Galaxy if you’re using Ansible 

## Requirements 

- In this section we will define to you the requirements for the servers, network configuration and service deployment. 
- In the picture below you can see the diagram view of the platform to deploy.

## Servers provisioning 

- Servers must have one user with root privileges 
- Servers access should be SSH only (port 1337) with SSH Key 
- Password authentication should be disabled 
- Root login should be disabled 
- Firewall should deny all the incoming traffic and only expose the required ports to the internet (e.g. SSH port, HTTP port) 

## Servers features 

1. Load-balancer 
- Run a application load balancer to expose the microservice API via port 80 and 443 

2. Database 
- Run the PostgreSQL service on a RDS 
- Create database: jumia_phone_validator 
- Create database user (jumia) with secure password d)Grant privileges to read and write 

3. Microservice 

- Run the microservice jumia_phone_validator on a Docker container (take into account the requirements described in the README file), with the latest tagged version. 
- Connect to the PostgreSQL database.

## Network configuration 

### Using the operating system firewall (e.g. iptables, ufw, etc): 
1. Load-balancer 
- Accept SSH connections from any IP address 
- Accept traffic from any IP address on port 80 and 443 

2. Database 
- Accept SSH connections from any IP address 
- Accept requests from the microservice IP address 3) Microservice 
- Accept SSH connections from any IP address 
- Accept requests from the load-balancer IP address

## Deliverables 
- A GitHub public git repository for the project code with all the commits made during the development of this project 
- Code to deploy the microservice 
- Code to deploy the PostgreSQL 
- Code to configure the servers firewalls 
- Code to configure AWS resources 
- The SSH access to all the created servers 
- The service jumia_phone_validator running per described ahead. 

## Bonus Points: 
1. Provision a Kubernetes cluster EKS or managed with: 
- 3 Worker Nodes 
- 1 Node per Availability Zone 
- Run the container inside the created Kubernetes cluster with: 
- 3 replicas, each assigned to a different node. 
- Create a Jenkins server with a pipeline to deploy jumia_phone_validator. ● Use Helm as a package manager to Kubernetes.


