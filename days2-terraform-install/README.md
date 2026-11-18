# 📅 Day 02: Installing & Verifying Terraform (Complete Installation Guide)

[![Terraform](https://img.shields.io/badge/Terraform-1.14.7-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Windows](https://img.shields.io/badge/OS-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://microsoft.com/windows)
[![Linux](https://img.shields.io/badge/OS-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://kernel.org)
[![macOS](https://img.shields.io/badge/OS-macOS-000000?style=for-the-badge&logo=apple&logoColor=white)](https://apple.com)

---

## 📌 Overview

On **Day 02** of the Terraform & Azure Learning Journey, the core focus is setting up our local workstation for Infrastructure as Code (IaC) engineering:
- Installing the Terraform CLI binary.
- Configuring System PATH environment variables.
- Verifying the installation using `terraform -version`.
- Setting up shell autocompletion and development tooling.

> **Why is Terraform unique?**  
> Terraform is distributed as a **single, standalone static binary** (written in Go). It requires no external runtime dependencies, no database, and no background daemon. Once the binary is placed in a directory registered in your system's `PATH`, it is ready to execute.

---

## 🎯 Day 02 Objectives

- [x] Download and install the Terraform binary on Windows (and document Linux/macOS options).
- [x] Configure the system `PATH` environment variable.
- [x] Verify installation using `terraform -version` and `where.exe terraform`.
- [x] Explore the top-level Terraform CLI help menu (`terraform -help`).
- [x] Enable shell tab auto-completion for faster workflow.
- [x] Document common installation errors and troubleshooting steps.

---

## 🛠️ Step-by-Step Installation Guide

### Method 1: Windows (Recommended / Current Lab Environment)

There are three ways to install Terraform on Windows. The manual method provides the best understanding of how Terraform runs as a standalone binary.

#### Option A: Manual Zip Installation (Standard DevOps Practice)

1. **Download the binary**:
   - Visit the official download page: [developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install)
   - Download the **Windows AMD64** `.zip` archive.

2. **Create a dedicated directory**:
   Open PowerShell as Administrator and create a target directory:
   ```powershell
   New-Item -ItemType Directory -Path "C:\Program Files\Terraform" -Force
   ```

3. **Extract the binary**:
   Extract `terraform.exe` from the downloaded zip file into `C:\Program Files\Terraform\`.

4. **Add to System PATH (PowerShell command)**:
   Add the directory to your permanent Machine PATH:
   ```powershell
   [Environment]::SetEnvironmentVariable(
       "Path",
       [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Program Files\Terraform",
       [EnvironmentVariableTarget]::Machine
   )
   ```

5. **Alternative: Add via Windows GUI**:
   - Press <kbd>Win</kbd> + <kbd>R</kbd>, type `sysdm.cpl`, and press **Enter**.
   - Navigate to the **Advanced** tab $\rightarrow$ Click **Environment Variables...**.
   - Under **System variables**, select `Path` $\rightarrow$ Click **Edit...**.
   - Click **New** $\rightarrow$ Add `C:\Program Files\Terraform`.
   - Click **OK** to save and close all dialogs.
   - Restart your PowerShell or Command Prompt terminal.

---

#### Option B: Windows Package Manager (`winget`)
If you prefer a package manager, Windows 10/11 includes `winget`:
```powershell
winget install Hashicorp.Terraform
```

#### Option C: Chocolatey
```powershell
choco install terraform
```

---

### Method 2: Linux (Ubuntu / Debian / RHEL)

#### Ubuntu / Debian:
```bash
# 1. Install prerequisites
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

# 2. Add HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# 3. Add official HashiCorp Linux repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# 4. Update repository and install
sudo apt-get update && sudo apt-get install -y terraform
```

#### RHEL / CentOS / Amazon Linux / Fedora:
```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

---

### Method 3: macOS (via Homebrew)

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

---

## 🔍 Verification & Inspection

After installation, open a **new** terminal session to verify that Terraform is accessible globally.

### 1. Verify Terraform Version
Run the verification command:
```powershell
terraform -version
```

**Actual Output:**
```plaintext
Terraform v1.14.7
on windows_amd64
```

> [!NOTE]
> If a newer minor release is available upstream, Terraform will also display a non-blocking notification showing the latest available version.

---

### 2. Check the Executable Location
Verify where the system is resolving the `terraform` binary from:

**On Windows:**
```powershell
where.exe terraform
```
**Output:**
```plaintext
C:\Program Files\Terraform\terraform.exe
```

**On Linux / macOS:**
```bash
which terraform
# /usr/bin/terraform or /usr/local/bin/terraform
```

---

### 3. Verify CLI Help & Core Options
Run `terraform -help` to inspect the available subcommands:
```powershell
terraform -help
```

**Output Breakdown:**
```plaintext
Usage: terraform [-version] [-help] <subcommand> [args]

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your code in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or update modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save an API token for Terraform Cloud
  logout        Remove an API token for Terraform Cloud
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  version       Show the current Terraform version
  workspace     Workspace management
```

---

## ⚡ Post-Installation Productivity Setup

### 1. Enable Shell Autocompletion
Terraform has built-in support for auto-completing commands, resource types, and flags when pressing <kbd>Tab</kbd>.

```powershell
# For PowerShell:
terraform -install-autocomplete

# Restart your PowerShell window to activate tab completion.
```

*(On Linux/macOS with Bash or Zsh, running `terraform -install-autocomplete` appends the configuration to `~/.bashrc` or `~/.zshrc` automatically).*

### 2. Recommended VS Code Extensions for DevOps
To make your development seamless, install these extensions:
- **HashiCorp Terraform** (`hashicorp.terraform`): Syntax highlighting, auto-formatting on save, validation, and schema tooltips.
- **Azure Terraform** (`ms-azuretools.vscode-azureterraform`): Integrated Azure CLI commands and code snippets.

---

## 🚨 Troubleshooting Common Installation Issues

| Issue / Error | Root Cause | Solution |
| :--- | :--- | :--- |
| `'terraform' is not recognized as an internal or external command` | The folder containing `terraform.exe` is not added to the `PATH` variable, or terminal wasn't restarted. | Add `C:\Program Files\Terraform` to system PATH and restart terminal. |
| `Access is denied` (on Windows) | Antivirus or permission restrictions on the installation folder. | Ensure the folder has read/execute permissions for your Windows user. |
| `permission denied` (on Linux) | The binary lacks executable permissions. | Run `chmod +x /usr/local/bin/terraform`. |
| Old version shows up after installing a new one | Another older `terraform.exe` exists in a path earlier in your `PATH` variable. | Run `where.exe terraform` to find duplicates and remove the older binary. |

---

## 📋 Commands Reference (Day 02)

| Command | Action |
| :--- | :--- |
| `terraform -version` | Display current installed version of Terraform CLI |
| `where.exe terraform` | Find exact file system path of the `terraform.exe` binary (Windows) |
| `which terraform` | Find exact file system path of the binary (Linux/macOS) |
| `terraform -help` | Display general help manual and core subcommands |
| `terraform -install-autocomplete` | Configure shell tab completion for PowerShell/Bash |

---

## ⏭️ Next Step (Day 03)

Now that Terraform CLI is installed, verified (`v1.14.7`), and added to our system `PATH`, we are ready for **Day 03**:  
👉 **Writing our first HCL configuration to provision a real Azure Resource Group!**

