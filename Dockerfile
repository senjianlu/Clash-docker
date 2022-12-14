# 基础镜像系统版本为 dreamacro/clash:latest
FROM dreamacro/clash:latest

# 维护者信息
LABEL maintainer="Rabbir admin@cs.cheap"

# Docker 内用户切换到 root
USER root

# 设置时区为东八区
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime > /etc/timezone

# 将配置文件复制到容器中
COPY config/config.yaml /root/.config/clash/config.yaml
COPY config/Country.mmdb /root/.config/clash/Country.mmdb

# 复制 Clash 的启动、关闭和检查脚本
COPY script/c_start.sh /usr/local/bin/c_start.sh
COPY script/c_stop.sh /usr/local/bin/c_stop.sh
COPY script/c_check.sh /usr/local/bin/c_check.sh

# 将启动脚本复制到容器中
COPY script/start.sh /usr/local/bin/start.sh

# 启动命令
ENTRYPOINT ["sh", "/usr/local/bin/start.sh"]