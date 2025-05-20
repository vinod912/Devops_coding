
# Jenkins CI/CD Pipeline for Spring Boot Java Application

## Overview
### This project demonstrates a robust, secure, and automated CI/CD pipeline for a Java Spring Boot application (e.g., spring-petclinic) using Jenkins and Kubernetes.

#### The pipeline covers:
- Source code checkout and build using Maven
- Unit and integration testing
- Static code analysis with SonarQube
- Docker image build and push to GitHub Container Registry (GHCR)
- Container vulnerability scanning using Trivy
- Kubernetes deployment with dynamic image versioning and rollback support
- Email notifications for build status

## Architecture & Workflow
### Checkout & Build
The source code is checked out from GitHub and built using Maven on a dedicated Jenkins Java build agent.

### Testing & Code Quality
Unit and integration tests are executed, followed by static code analysis through SonarQube to ensure code quality and security.

### Dockerization
A Docker image is built and tagged with the Git tag or a version fallback and pushed securely to GHCR.

### Security Scanning
The Docker image is scanned for vulnerabilities using Trivy to maintain container security.

### Deployment to Kubernetes
The Kubernetes deployment manifest is dynamically updated to use the newly built Docker image and applied to the Kubernetes cluster. The deployment includes readiness and liveness probes for reliability.

### Rollback & Notifications
If the deployment rollout fails, the pipeline automatically triggers a rollback to the previous stable version. Build status notifications are sent via email.

## Pipeline Details
### Jenkins Agents Used:
- master for SCM checkout
- slave-java for Maven build, testing, and SonarQube scanning
- slave-docker for Docker build, push, and Trivy scanning
- slave-k8s for Kubernetes deployment and rollout management

### Key Jenkins Plugins/Tools:

- Git Plugin
- SonarQube Scanner Plugin
- Docker CLI & login configured on docker agent
- Trivy CLI installed on docker agent
- Kubernetes CLI (kubectl) configured on k8s agent
- Email Extension Plugin for notifications

### Credentials Needed:

- sonarqube-token for SonarQube authentication
- ghcr-token for GitHub Container Registry access
- kubeconfig Kubernetes config file for cluster access

###  Kubernetes Deployment Manifest
- The deployment manifest (k8s/springboot-deployment.yaml) defines a single Deployment with 3 replicas for high availability.
- Container image placeholder PLACEHOLDER_IMAGE is dynamically replaced with the image tag built during the pipeline.
- Health checks via readiness and liveness probes ensure stable rollouts.

### Prerequisites
- Jenkins configured with required agents and plugins.
- Access to SonarQube server and credentials.
- Docker and Trivy installed on Docker build agent.
- Kubernetes cluster with kubectl configured and accessible.
- Email server configured in Jenkins for notifications.
- GitHub Container Registry access with appropriate tokens.

### How to Use
- Clone or Fork the Project:
- Clone this repository or your fork containing the Jenkinsfile and Kubernetes manifests.
- Configure Jenkins:
- Create a new pipeline job in Jenkins pointing to your repo.
- Add credentials (sonarqube-token, ghcr-token, kubeconfig) in Jenkins Credentials store.
- Ensure Jenkins agents are configured properly with necessary tools.

### Run the Pipeline:
- Trigger the pipeline to start the automated process from code checkout to Kubernetes deployment.

### Monitor Results:
- View build and deployment logs in Jenkins.
- Receive email notifications for success or failure.
- Monitor deployed pods and services in your Kubernetes cluster.

### Benefits
- Automated CI/CD: Full automation from code commit to deployment reduces manual errors and accelerates delivery.
- Security Integration: Static code and container image scanning help maintain secure code and runtime environments.
- Resiliency: Deployment rollback ensures minimal downtime and quick recovery.
- Scalability: Kubernetes Deployment with replicas provides high availability.
- Visibility: Email notifications and SonarQube reports give continuous feedback.
