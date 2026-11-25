# AWS EKS Cluster Creation using eksctl

## Project Overview

This project automates the creation of an Amazon Elastic Kubernetes Service (EKS) cluster using a Bash script and `eksctl`.

The script checks the required tools, validates AWS credentials, creates an EKS cluster with managed node groups, configures `kubectl`, and verifies the Kubernetes worker nodes.

## Architecture

- **Cloud Provider:** AWS
- **Kubernetes Service:** Amazon EKS
- **Cluster Management:** eksctl
- **Infrastructure:** AWS Managed Node Group
- **Automation:** Bash Script
- **CLI Tools:** AWS CLI, kubectl

## Configuration

| Component | Configuration |
|---|---|
| Cluster Name | eks-learning |
| AWS Region | ap-south-2 (Hyderabad) |
| Node Type | t3.medium |
| Number of Nodes | 2 |
| Node Group | Managed |
| OIDC | Enabled |

## Prerequisites

Install the following tools before running the script:

1. AWS CLI
2. eksctl
3. kubectl
4. Bash

Configure AWS credentials:

```bash
aws configure
```

Verify AWS access:

```bash
aws sts get-caller-identity
```

## Project Structure

```text
EKS----eksctl/
│
├── create-eks.sh
└── README.md
```

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/hariprasath-vs-12/EKS----eksctl.git
```

### 2. Navigate to the Project

```bash
cd EKS----eksctl
```

### 3. Give Execute Permission

```bash
chmod +x create-eks.sh
```

### 4. Run the Script

```bash
./create-eks.sh
```

## Verify EKS Cluster

Check the EKS cluster:

```bash
eksctl get cluster --region ap-south-2
```

Check Kubernetes nodes:

```bash
kubectl get nodes
```

Check cluster information:

```bash
kubectl cluster-info
```

## Cleanup – Delete EKS Cluster

**Important:** EKS clusters and worker nodes can incur AWS charges. Delete the cluster after completing your practice.

```bash
eksctl delete cluster \
  --name eks-learning \
  --region ap-south-2 \
  --wait
```

## Learning Objectives

- Understand Amazon EKS architecture.
- Automate EKS cluster creation using Bash.
- Learn eksctl commands.
- Configure AWS credentials and kubeconfig.
- Understand managed node groups.
- Connect kubectl with an EKS cluster.
- Verify Kubernetes worker nodes.
- Practice EKS cluster lifecycle management.

## Important Notes

- Ensure your AWS account has the required IAM permissions.
- Check your AWS Service Quotas before creating the cluster.
- EKS, EC2 instances, networking and related resources may incur charges.
- This is a learning project. Review the AWS costs before deployment.

## Author

**Hariprasath VS**

GitHub: https://github.com/hariprasath-vs-12

**Technologies:** AWS | EKS | Kubernetes | eksctl | Bash | Linux
