#!/bin/bash

echo "liangszu.xyz深圳大学校园网自动登录配置脚本"
echo "请确保现在已经退出校园网，否则影响配置进行"

# Step 1: 创建drcom.sh文件
echo '#!/bin/sh
Username=""
Password=""
Date=$(date "+%Y-%m-%d %H:%M:%S")
parentDir="/usr"
fileName="drcom_log.txt"
url="http://172.30.255.42:801/eportal/portal/login?callback=dr1003&login_method=1&user_account=%2C1%2C${Username}&user_password=${Password}"
 
echo $Date >> /usr/$fileName
curl $url >> /usr/$fileName 
echo "" >> /usr/$fileName' > drcom.sh

# Step 2: 交互式获取用户名和密码
read -p "请输入校园网账号：" Username
read -p "请输入校园网密码：" Password

# Step 3: 写入用户名和密码
sed -i "s/Username=\".*\"/Username=\"$Username\"/" drcom.sh
sed -i "s/Password=\".*\"/Password=\"$Password\"/" drcom.sh

# Step 4: 移动drcom.sh文件
mv drcom.sh /usr/
chmod 0777 /usr/drcom.sh

# Step 5: 执行drcom.sh
bash /usr/drcom.sh

# Step 6: 判断登陆结果
if tail -n 1 /usr/drcom_log.txt | grep -qE 'Portal协议认证成功！|已经在线！'; then
    # Step 7: 在rc.local中添加启动项
    sed -i '$i\sleep 10 && /usr/drcom.sh' /etc/rc.local
    # Step 8: 在crontab中添加定时任务
    (crontab -l ; echo "0 */10 * * * /usr/drcom.sh") | crontab -
    # Step 9: 打印成功信息
    echo "校园网自动登录已经配置成功！"
else
    # 登录失败
    echo "登录失败"
fi
