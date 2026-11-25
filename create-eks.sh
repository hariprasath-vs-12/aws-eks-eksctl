
#!/bin/bash

# =================================
# EKS Cluster Creation Script
# Learning Project
# =================================

set -e

CLUSTER_NAME="eks-learning"
REGION="ap-south-2"
NODE_TYPE="t3.medium"
NODES=2

echo "================================="
echo "Starting EKS Cluster Creation"
echo "================================="

# Check required tools
for tool in aws eksctl kubectl; do
    if ! command -v "$tool" &> /dev/null; then
        echo "ERROR: $tool is not installed"
        exit 1
    fi
done

echo "All required tools are installed."

# Check AWS credentials
echo "Checking AWS credentials..."
aws sts get-caller-identity

# Check region
echo "Using AWS Region: $REGION"

# Check existing cluster
if eksctl get cluster --name "$CLUSTER_NAME" --region "$REGION" >/dev/null 2>&1; then
    echo "Cluster already exists: $CLUSTER_NAME"
    exit 1
fi

# Create EKS cluster
echo "Creating EKS cluster..."

eksctl create cluster \
    --name "$CLUSTER_NAME" \
    --region "$REGION" \
    --node-type "$NODE_TYPE" \
    --nodes "$NODES" \
    --managed \
    --with-oidc

# Configure kubectl
echo "Updating kubeconfig..."

aws eks update-kubeconfig \
    --region "$REGION" \
    --name "$CLUSTER_NAME"

# Verify nodes
echo "Checking Kubernetes nodes..."

kubectl get nodes


echo "================================="
echo "EKS Setup Completed!"
echo "================================="

