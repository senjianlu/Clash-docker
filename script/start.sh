#!/bin/bash
# Docker 容器启动时内部执行的脚本

# 永久循环
while :
do
    # 1. 检查 Clash 是否启动着，关闭了则需要重启
    sh /usr/local/bin/c_check.sh
    if [ $? -gt 0 ]; then
        echo "Clash 不在运行！进行重启......"
        sh /usr/local/bin/c_stop.sh
        sh /usr/local/bin/c_start.sh
    else
        echo "Clash 运行中......"
    fi
    # 2. 睡眠 5 秒
    sleep 5
done