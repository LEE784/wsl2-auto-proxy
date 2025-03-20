## 中文
### 项目简介
此项目提供了一个脚本，用于在 WSL2 中自动配置代理设置，解决在添加`.wslconfig` 文件（例如设置`networkingMode=mirrored`）后，WSL2 无法连接 Visual Studio Code (VSCode) 的问题。通过动态同步 Windows 主机的代理设置，此脚本确保 WSL2 无需手动干预即可保持网络连接。

### 功能
- 自动从 Windows 注册表获取主机 IP 和代理设置。  
- 在 WSL2 中设置 `http_proxy`、`https_proxy` 和 `all_proxy`。
- 通过 `.bashrc` 在 WSL2 启动时运行，避免手动 export。
### 解决问题
   在配置 `.wslconfig`（例如 `networkingMode=mirrored`）时，WSL2 可  能因代理设置不匹配而无法连接 VSCode。此脚本通过将 Windows 代理设置  镜像到 WSL2 中解决此问题。

### 前提条件
   在 Windows 系统上安装了 WSL2。
   WSL2 可以访问 PowerShell。
   Windows 已配置代理（例如 127.0.0.1:7890）。

### 安装步骤:
1. 克隆此仓库:
   ```bash
   git clone https://github.com/LEE784/wsl2-auto-proxy.git  
   cd wsl2-auto-proxy  
3. 将脚本复制到家目录:
   ```bash
   cp auto_proxy.sh ~/auto_proxy.sh  
   chmod +x ~/auto_proxy.sh  
5. 添加到 `.bashrc`:
   ```bash
   echo '. ~/auto_proxy.sh' >> ~/.bashrc  
   source ~/.bashrc  
### 使用方法  
   打开 WSL2 终端，代理设置将自动应用。
### 验证:
`echo $http_proxy`  
### 注意事项  
- 确保 Windows 代理对 WSL2 可访问（例如绑定到 0.0.0.0）。  
- 在 Windows 11 和 Ubuntu WSL2 上测试通过。  
- 按 `Ctrl+O`，回车保存。  
- 按 `Ctrl+X` 退出。  
---
# WSL2 Auto Proxy

## English

### Overview
This project provides a script to automatically configure proxy settings in WSL2, addressing the issue where WSL2 fails to connect to Visual Studio Code (VSCode) after adding a `.wslconfig` file (e.g., with `networkingMode=mirrored`). By dynamically syncing the Windows host's proxy settings, this script ensures WSL2 maintains network connectivity without manual intervention.

### Features
- Automatically retrieves the Windows host IP and proxy settings from the registry.
- Sets `http_proxy`, `https_proxy`, and `all_proxy` in WSL2.
- Runs on WSL2 startup via `.bashrc`, avoiding the need for manual `export`.

### Problem Solved
When configuring `.wslconfig` (e.g., `networkingMode=mirrored`), WSL2 may lose connectivity to VSCode due to  proxy mismatches. This script resolves this by mirroring the Windows proxy settings into WSL2.

### Prerequisites
- WSL2 installed on a Windows system.
- PowerShell accessible from WSL2.
- A proxy configured in Windows (e.g., `127.0.0.1:7890`).

### Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/LEE784/wsl2-auto-proxy.git
   cd wsl2-auto-proxy
2. Copy the script to your home directory:
   ```bash
   cp auto_proxy.sh ~/auto_proxy.sh
   chmod +x ~/auto_proxy.sh
3. Add it to .bashrc:
   ```bash
   echo '. ~/auto_proxy.sh' >> ~/.bashrc
   source ~/.bashrc
### Usage
   Open a WSL2 terminal. The proxy settings will be applied automatically.
### Verify with:
`echo $http_proxy`
### Notes
- Ensure your Windows proxy is accessible from WSL2 (e.g., bound to 0.0.0.0 if needed).
- Tested on Ubuntu WSL2 with Windows 11.
    
