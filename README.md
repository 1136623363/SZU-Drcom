# SZU-Drcom
深圳大学校园网自动登录配置脚本

适用于OpenWrt路由器

## 一键配置脚本食用方法：
1.SSH连接路由器，下载文件
```
wget https://raw.githubusercontent.com/1136623363/SZU-Drcom/main/install.sh
```
2.
在上网登录网页注销登录! [http://172.30.255.42/](http://172.30.255.42/)
在上网登录网页注销登录!
在上网登录网页注销登录!

然后执行
```
bash install.sh
```
## 常见问题处理
```
[root@OpenWrt:09:42 PM ~] # wget https://raw.githubusercontent.com/1136623363/SZU-Drcom/main/install.sh
--2023-06-29 21:42:37--  https://raw.githubusercontent.com/1136623363/SZUDrcom/main/install.sh
Resolving raw.githubusercontent.com... 185.199.108.133, 185.199.109.133, 185.199.110.133, ...
Connecting to raw.githubusercontent.com|185.199.108.133|:443... connected.
OpenSSL: error:0A000126:SSL routines::unexpected eof while reading
Unable to establish SSL connection.
```
解决方法
```
wget --no-check-certificate https://raw.githubusercontent.com/1136623363/SZU-Drcom/main/install.sh
```


## 手动配置请参考
[http://liangszu.xyz/archives/openwrt%E8%B7%AF%E7%94%B1%E5%99%A8%E8%87%AA%E5%8A%A8%E7%99%BB%E5%BD%95%E6%A0%A1%E5%9B%AD%E7%BD%91%E8%84%9A%E6%9C%AC](http://liangszu.xyz/archives/openwrt%E8%B7%AF%E7%94%B1%E5%99%A8%E8%87%AA%E5%8A%A8%E7%99%BB%E5%BD%95%E6%A0%A1%E5%9B%AD%E7%BD%91%E8%84%9A%E6%9C%AC)
