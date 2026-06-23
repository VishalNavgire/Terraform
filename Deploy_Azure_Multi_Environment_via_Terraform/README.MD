<div align="center">

# 🏗️ Multi-Tier Enterprise Azure Infrastructure via GitOps

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
