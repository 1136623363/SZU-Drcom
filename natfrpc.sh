#!/bin/bash

# 下载并重命名frpc客户端
wget https://nya.globalslb.net/natfrp/client/frpc/0.51.0-sakura-2/frpc_linux_armv7
mv frpc_linux_armv7 /sbin/natfrpc
chmod a+wx /sbin/natfrpc

# 创建并配置启动脚本
cat << 'EOF' > /etc/init.d/natfrpc
#!/bin/sh /etc/rc.common

USE_PROCD=1
START=90

start_service() {
    procd_open_instance natfrpc
    procd_set_param command /sbin/natfrpc

    procd_append_param command -f p63xqglrhn7hc9iocgldacbb9mkincg7:5259881 --update
 
    procd_set_param env LANG=zh_CN.UTF-8
    procd_set_param limits nofile="unlimited"
    procd_set_param respawn 300 5 10
    procd_set_param stdout 1
    procd_set_param stderr 1
    procd_add_jail natfrp log
    procd_close_instance
}
EOF

# 去除 Windows 换行符并赋予可执行权限
sed -i 's/\r//' /etc/init.d/natfrpc
chmod +x /etc/init.d/natfrpc

# 启动服务并设置开机自启动
/etc/init.d/natfrpc start
/etc/init.d/natfrpc enable
