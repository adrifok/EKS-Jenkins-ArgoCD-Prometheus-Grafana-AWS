# EKS-Jenkins-ArgoCD-Prometheus-Grafana-AWS

Full DevSecOps pipeline deploying a three-tier application on AWS EKS. Jenkins handles CI with SonarQube analysis, OWASP dependency check, and Trivy image scanning. ArgoCD handles GitOps-based delivery to the cluster. Prometheus and Grafana cover observability.

What gets deployed

Jenkins server on EC2 t2.2xlarge provisioned with Terraform, with SonarQube running as a Docker container on the same instance. Application images are built, scanned, and pushed to ECR. ArgoCD syncs Kubernetes manifests to EKS for backend, frontend, and database workloads with an ingress controller.

Pipeline stages

- Workspace cleanup and Git checkout
- SonarQube static analysis and quality gate
- OWASP Dependency-Check scan
- Trivy filesystem and image scan
- Docker build and push to ECR
- ArgoCD sync to EKS

Structure

- `Jenkins-Server-TF` — Terraform to provision the Jenkins EC2 instance and tooling
- `Jenkins-Pipeline-Code` — Jenkinsfiles for backend and frontend pipelines
- `Kubernetes-Manifests-file` — K8s manifests for backend, frontend, database, and ingress
- `Application-Code` — application source code

Variables

- `key-name` — EC2 SSH key pair name
- `instance-name` — EC2 instance tag name
- `aws_region` — target AWS region (default: `us-east-1`)
