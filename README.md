# Kubernetes Cluster Automation with Terraform and Helm

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Helm](https://img.shields.io/badge/helm-%230F1689.svg?style=for-the-badge&logo=helm&logoColor=white)

A complete infrastructure-as-code solution for provisioning a Kubernetes cluster and deploying API with proper monitoring and observability.

## 📖 Overview
This solution automates the creation and configuration of a Kubernetes cluster using:
- **Terraform** for infrastructure provisioning
- **Helm** for package management
- **GitHub Actions** for CI/CD automation
- **Prometheus/Grafana** for monitoring

## 🚀 Features

| Component              | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| Cluster Infrastructure | Automated Kubernetes cluster provisioning using Terraform with helm provider                  |
| CI/CD Pipeline         | GitHub Actions workflow for infrastructure management                       |
| Monitoring Stack       | kube-prom-stack with Prometheus, Grafana, and Alertmanager                  |
| API Deployment         | Custom Helm chart for application deployment                                |
| Security               | Secret management and partial TLS configuration                            |
| Observability          | Service monitoring, custom dashboards, and alert rules                     |

## ✅ Implementation Checklist

| #  | Task                              | Status        |
|----|-----------------------------------|---------------|
| 1  | Helm Chart for API Deployment     | ✅ Completed  |
| 2  | Expose application API endpoint  | ✅ Completed  |
| 3  | Set up monitoring stack          | ✅ Completed  |
| 4  | Configure service monitor        | ✅ Completed  |
| 5  | Create dashboard with PromQL     | ✅ Completed  |
| 6  | Configure alert rules            | ✅ Completed  |
| 7  | Configure TLS                    | ⚠️ Pending   |

## 📋 Prerequisites

- Terraform v1.5+
- Helm v3.8+
- kubectl v1.25+
- AWS account (cloud provider)
- GitHub account with Actions enabled

## 🛠️ Installation

### 1. Secrets Management
```bash
kubectl create secret generic api-secrets \
  --from-literal=connection-string="your_connection_string_here"
  
```

### 2. Helm Chart Installation
```bash
helm install <your-release-name> ./test-api-chart --values test-api-chart/values.yaml

```

## 📈 Accesing Dashboard and API Endpoint

- **API**  : http://code-challange.hashanr.cloud/test-api
- **Grafana Dashboard** https://grafana.hashanr.cloud/