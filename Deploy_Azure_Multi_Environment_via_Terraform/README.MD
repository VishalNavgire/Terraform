<div align="center">

# 🏗️ Multi-Tier Enterprise Azure Infrastructure via Terraform

![Terraform](https://img.shields.io/badge/Terraform-%237B42BC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-Automation-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-Cloud%20Infrastructure-0072C6?style=for-the-badge&logo=microsoftazure&logoColor=white)
![GitOps](https://img.shields.io/badge/GitOps-Declarative%20CD-009639?style=for-the-badge&logo=git&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)

**Enterprise-grade Infrastructure-as-Code (IaC) configuration and continuous deployment pipeline utilizing Terraform modularity and GitHub Actions to automate isolated, multi-tier Azure resource footprints across Dev, QA, Staging, and Production environments.**

</div>

---

# 📖 Overview

In modern cloud architecture, **manual infrastructure drift and inconsistent environments create massive operational overhead and configuration vulnerabilities**. Managing multi-stage promotion lifecycles requires absolute consistency and hard state boundaries to protect mission-critical production data.

This project addresses these challenges by implementing an automated **GitOps progressive delivery pipeline**. By utilizing standard, reusable structural blueprints, the architecture safely handles code changes—from initial testing down to strict production deployment loops.

### The automated workflow handles:
1️⃣ Validating code formatting and tracking configurations across distinct directories.

2️⃣ Injecting environment parameters dynamically via structural configurations.

3️⃣ Restricting race conditions through central, active remote state locks.

4️⃣ Requiring strict, multi-stage human approval workflows before mutating live production resources.

---

# 🎯 Key Capabilities

| Feature                                     | Description                                                                |
| ------------------------------------------- | -------------------------------------------------------------------------- |
| 🛡️ **Blast Radius Mitigation** | Complete file-system directory isolation prevents cross-environment drift. |
| 🔑 **Secure App Authentication** | Utilizes Azure OpenID Connect (OIDC) to run credential-less pipelines.     |
| 🔁 **Immutable Multi-Tier Footprint** | Standardizes VNet, Subnet, NSG, Public IP, and compute setups across tiers. |
| 🔏 **Multi-Platform Lock Enforcement** | Implements cross-compiled dependency tracking across Mac, Windows, and Linux.|
| 🚦 **Sequential Promotion Gates** | Leverages GitHub Actions protected environments for human sign-offs.       |
| 🔒 **State Concurrency Prevention** | Integrates native Azure Storage Account blob leases for state locking.     |
| 📦 **Central Variable Separation** | Isolates credential tracking from resource declaration definitions.        |

---

# 🏗️ Architecture Layout

The pipeline is split into structural resource definitions (**Modules**) and isolated, location-specific inputs (**Environments**) to maintain clean execution boundaries.

    ├── .github/
    │   └── workflows/
    │       └── deploy-infra.yml      # 4-Stage GitHub Actions GitOps Orchestrator
    │
    ├── modules/
    │   └── environment_tier/         # Reusable Infrastructure Structural Blueprint
    │       ├── main.tf               # Core Declarations (RG, VNet, Subnet, NSG, Public IP, VM)
    │       ├── variables.tf          # Contract Inputs
    │       └── outputs.tf            # Target Output Exports
    │
    └── environments/                 # Parameter Overrides & Active Backends
    ├── dev/                      # Lifecycle Tier — Development
    │   ├── backend.tf            # Remote State Lock Pointer
    │   ├── main.tf               # Module Instantiation Block
    │   └── terraform.tfvars      # Dev Parameter Assertions
    ├── qa/                       # Lifecycle Tier — Quality Assurance
    ├── staging/                  # Lifecycle Tier — Staging
    └── prod/                     # Lifecycle Tier — Production
---

# ⚙️ Technology Stack

### ☁️ Cloud Infrastructure
* Microsoft Azure (Compute, Networking, Security, Storage)
* Azure Blob Storage (Remote Backend)

### 🛠️ Infrastructure as Code
* HashiCorp Terraform (v1.5.0+)
* HCL Dependency Lock Verification

### 🚀 Automation & DevSecOps
* GitHub Actions
* GitHub Protected Environments
* OpenID Connect (OIDC) Security Federation

---

# 🚀The GitOps Continuous Deployment Pipeline
The workflow progression maps directly across strict gates, creating a reliable deployment sequence from code commit to production validation.

---
    [Developer Code Push] ──> [GitHub Main Branch]
                                    │
                                    ▼
                    ┌─────────────────────────┐
                    │  Stage 1: Deploy DEV    │
                    └────────────┬────────────┘
                                    │ (Success)
                                    ▼
                    ┌─────────────────────────┐
                    │  Stage 2: Deploy QA     │ <── [Requires Manual Sign-Off]
                    └────────────┬────────────┘
                                    │ (Success)
                                    ▼
                    ┌─────────────────────────┐
                    │  Stage 3: Deploy STAGE  │ <── [Requires Manual Sign-Off]
                    └────────────┬────────────┘
                                    │ (Success)
                                    ▼
                    ┌─────────────────────────┐
                    │  Stage 4: Deploy PROD   │ <── [Requires Structural Review]
                    └─────────────────────────┘
---
# Step 1 — Central Ingestion
The engineer issues a code modification or configuration change inside a feature branch and merges it into the main branch.

#  Step 2 — Environment Initialization & Multi-Platform Validation
The automated engine enforces a read-only lock verification policy (terraform init -readonly). This blocks executions if anyone introduces unverified provider code versions that deviate from the multi-platform tracking record:

```text
Bash

terraform providers lock -platform=windows_amd64 -platform=darwin_arm64 -platform=linux_amd64
```

# Step 3 — Execution Sequence & Approval Gates
* Dev Phase: Runs automatically on push to track regressions.

* QA / Staging Loops: Once lower tiers pass, execution pauses. GitHub environments send out alerts requiring an infrastructure administrator to review logs before allowing changes to proceed.

* Prod Phase: Final block verification execution loop occurs, updating live production computing resources securely.

---

# 📁 Remote State Storage Strategy
State files are not stored locally. They are tracked inside a centralized Azure Storage Account container with unique keys to isolate environments completely.

| Environment | Resource Group Target | State Blob Key Location | Concurrency Control |
|-------------|----------------------|-------------------------|---------------------|
| Dev         | rg-dev               | dev.terraform.tfstate   | Native Lease Lock   |
| QA          | rg-qa                | qa.terraform.tfstate    | Native Lease Lock   |
| Staging     | rg-staging           | stage.terraform.tfstate | Native Lease Lock   |
| Prod        | rg-prod              | prod.terraform.tfstate  | Native Lease Lock   |

---

# 🧠 Real-World Engineering Value
This deployment structure establishes institutional governance models that eliminate standard infrastructure vulnerabilities:

# 💥 Complete Blast Radius Control
Because state files and network allocations are completely separated by directory, an accidental deletion run inside the Dev folder cannot impact Production configurations.

# 🚫 Blind-Spot Dependency Protection
By committing .terraform.lock.hcl files targeted at both developer workstations and Linux CI/CD environments, teams avoid unexpected breaking changes caused by unvetted minor provider updates.

# 🛡️ Credential-Less Execution Profile
By pairing GitHub OpenID Connect (OIDC) with Azure Service Principals, the orchestration pipeline gains short-lived access tokens dynamically, ensuring no secrets or long-lived keys are stored in source control.

# 🔐 Security Architecture
* Least-Privilege RBAC Access: Service Principal authorizations are strictly scoped at the target subscription or resource group tier.

* Encryption by Default: Remote state variables are encrypted at rest using platform-managed keys inside Azure Storage Account Blobs.

*  Immutable Version Locking: Both custom infrastructure modules and provider definitions use exact semantic versioning constraints to block unexpected code execution behaviors.
---
# 👨‍💻 Author

### Vishal Navgire

Cloud & Endpoint Automation Engineer

![Azure](https://img.shields.io/badge/Azure-%230072C6.svg?style=for-the-badge\&logo=microsoftazure\&logoColor=white)
![Python](https://img.shields.io/badge/Python-3670A0?style=for-the-badge\&logo=python\&logoColor=ffdd54)
![Automation](https://img.shields.io/badge/Automation-DevOps-green?style=for-the-badge)
![Microsoft Graph](https://img.shields.io/badge/Microsoft%20Graph-6264A7?style=for-the-badge\&logo=microsoft\&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge\&logo=powershell\&logoColor=white)

---
