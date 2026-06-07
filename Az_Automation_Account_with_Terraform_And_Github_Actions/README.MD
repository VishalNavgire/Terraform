# 🚀 Azure Automation Runbooks CI/CD using Terraform and GitHub Actions

## 📖 Overview

This project demonstrates how to deploy and manage Azure Automation Runbooks using Infrastructure as Code (IaC) principles with Terraform and GitHub Actions.

The solution automates the provisioning of:

* Azure Resource Group
* Azure Automation Account
* PowerShell Runbooks
* Python Runbooks

while enforcing code quality checks through GitHub Actions before deployment.

The goal is to eliminate manual runbook creation and provide a repeatable, scalable, and version-controlled automation platform.

---

# 🎯 Business Problem

Many organizations create Azure Automation Runbooks directly through the Azure Portal.

This approach often introduces several challenges:

| Challenge                       | Impact                          |
| ------------------------------- | ------------------------------- |
| Manual runbook creation         | Configuration drift             |
| No version control              | Difficult rollback and auditing |
| No code review process          | Increased operational risk      |
| Inconsistent deployment methods | Environment differences         |
| Lack of quality validation      | Production failures             |

As automation scales across cloud environments, managing scripts manually becomes difficult and error-prone.

---

# 💡 Solution

This project introduces a GitOps-driven deployment model:

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ├── Python Validation
    │
    ├── PowerShell Validation
    │
    ▼
Terraform Deployment
    │
    ▼
Azure Automation Account
    │
    ▼
Automation Runbooks
```

Every change is:

* Version controlled
* Reviewed
* Validated
* Automatically deployed

This enables consistent automation management across environments.

---

# 🏗️ Solution Architecture

```text
┌─────────────────────┐
│     Developer       │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ GitHub Repository   │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ GitHub Actions CI   │
├─────────────────────┤
│ Pylint              │
│ PSScriptAnalyzer    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Terraform Apply     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Azure Resource Group│
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Automation Account  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Runbooks            │
├─────────────────────┤
│ PowerShell          │
│ Python              │
└─────────────────────┘
```

---

# 🧩 Components Used

## Terraform

Terraform is used to provision Azure resources declaratively.

### Resources Created

* Azure Resource Group
* Azure Automation Account
* Azure Automation Runbooks

### Benefits

* Infrastructure as Code
* Repeatable deployments
* Version control
* Reduced manual effort

---

## Azure Automation Account

Azure Automation provides a centralized service for:

* Process automation
* Scheduled tasks
* Operational maintenance
* Resource management

### Typical Enterprise Use Cases

* Start/Stop Azure VMs
* Azure resource cleanup
* Compliance checks
* Patch automation
* Inventory collection
* User provisioning

---

## PowerShell Runbooks

PowerShell Runbooks automate operational activities within Azure.

### Example Scenarios

* Restart services
* Collect inventory
* Azure VM lifecycle management
* Resource tagging
* Compliance validation

---

## Python Runbooks

Python Runbooks provide automation capabilities beyond PowerShell.

### Example Scenarios

* REST API integrations
* Data processing
* Reporting
* ServiceNow integrations
* Monitoring integrations

---

## GitHub Actions

GitHub Actions provides Continuous Integration and Continuous Deployment (CI/CD).

### Responsibilities

* Validate PowerShell code
* Validate Python code
* Deploy Terraform resources
* Enforce deployment standards

---

# 🔍 CI/CD Workflow

## Step 1: Developer Commit

A developer updates:

```text
runbooks/
├── powershell/
└── python/
```

and pushes changes to GitHub.

---

## Step 2: Python Validation

Workflow:

```text
03-build-pylint.yml
```

Tool:

```text
Pylint
```

Purpose:

* Detect syntax issues
* Improve code quality
* Enforce Python standards

---

## Step 3: PowerShell Validation

Workflow:

```text
04-build-powershell.yml
```

Tool:

```text
PSScriptAnalyzer
```

Purpose:

* Detect PowerShell issues
* Identify security concerns
* Enforce scripting standards

---

## Step 4: Terraform Deployment

Workflow:

```text
05-terraform-deployment.yml
```

Terraform performs:

```bash
terraform init
terraform fmt
terraform plan
terraform apply
```

Purpose:

* Create infrastructure
* Deploy runbooks
* Maintain desired state

---

# 📂 Repository Structure

```text
.
├── .github/
│   └── workflows/
│       ├── 01-deploy-runbooks.yml
│       ├── 03-build-pylint.yml
│       ├── 04-build-powershell.yml
│       └── 05-terraform-deployment.yml
│
├── runbooks/
│   ├── powershell/
│   │   └── test.ps1
│   │
│   └── python/
│       └── test.py
│
├── terraform/
│   ├── main.tf
│   ├── resources.tf
│   ├── variables.tf
│   ├── output.tf
│   └── runbooks.tfvars
│
└── README.md
```

---

# 📋 Terraform Resources

## Resource Group

Creates the logical container for Azure resources.

```terraform
azurerm_resource_group
```

---

## Automation Account

Creates an Azure Automation Account.

```terraform
azurerm_automation_account
```

---

## Runbooks

Dynamically deploys multiple runbooks using Terraform.

```terraform
azurerm_automation_runbook
```

The project uses:

```terraform
for_each
```

to deploy multiple runbooks from a single configuration.

---

# 🔐 Security Considerations

Current implementation uses:

```text
Azure Service Principal
```

for Terraform authentication.

Production recommendations:

* GitHub OIDC Federation
* Azure Managed Identity
* Azure Key Vault integration
* Remote Terraform State Storage
* Terraform Security Scanning

---

# 📈 Benefits of this Approach

| Capability             | Benefit                     |
| ---------------------- | --------------------------- |
| Infrastructure as Code | Consistent deployments      |
| Git Version Control    | Full audit trail            |
| Automated Validation   | Reduced deployment failures |
| CI/CD Automation       | Faster delivery             |
| Terraform              | Repeatable infrastructure   |
| Runbooks as Code       | Better governance           |
| GitHub Actions         | Automated quality gates     |

---

# 🚀 Future Enhancements

Planned improvements include:

* Terraform Modules
* Multi-environment Deployments
* Azure Key Vault Integration
* GitHub OIDC Authentication
* Remote Terraform State
* Checkov Security Scanning
* TFLint Integration
* Terraform Validate Stage
* Pull Request Approval Gates
* Enterprise Naming Standards

---

# 🧑‍💻 Skills Demonstrated

This project demonstrates practical experience with:

* Terraform
* Azure Automation
* Azure Resource Manager
* Infrastructure as Code (IaC)
* GitHub Actions
* CI/CD Pipelines
* PowerShell
* Python
* Azure Service Principals
* Cloud Automation
* Platform Engineering Concepts

---

# 📚 Learning Outcome

Through this project, I learned how to:

* Provision Azure infrastructure using Terraform
* Deploy Azure Automation Runbooks as code
* Build reusable CI/CD workflows
* Implement PowerShell and Python code validation
* Automate cloud resource deployments
* Apply Infrastructure as Code best practices
* Integrate GitHub Actions with Azure deployments

---

# 📜 Disclaimer

This project was created for learning and demonstration purposes. Additional security controls, remote state management, approval gates, and enterprise governance should be implemented before production use.
