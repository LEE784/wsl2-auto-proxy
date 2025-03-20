#!/bin/bash

# 获取 Windows 主机的 IP
WIN_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')

# 从 Windows 注册表获取代理设置
PROXY=$(powershell.exe -Command "Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | Select-Object -Property ProxyServer" | grep -o '[^ ]*$')

# 检查是否成功获取代理
if [ -n "$PROXY" ]; then
    # 设置代理环境变量
    export http_proxy="http://$WIN_IP:$PROXY"
    export https_proxy="http://$WIN_IP:$PROXY"
    export all_proxy="http://$WIN_IP:$PROXY"
    echo "Proxy set to: http://$WIN_IP:$PROXY"
else
    echo "Failed to retrieve proxy settings from Windows."
    unset http_proxy https_proxy all_proxy
fi
