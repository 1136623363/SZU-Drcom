#!/bin/sh
Username="391232"
Password="1136623363"
Date=$(date "+%Y-%m-%d %H:%M:%S")
parentDir="/usr"
fileName="drcom_log.txt"
url="http://172.30.255.42:801/eportal/portal/login?callback=dr1003&login_method=1&user_account=%2C1%2C${Username}&user_password=${Password}"
 
echo $Date >> /usr/$fileName
curl $url >> /usr/$fileName 
echo '' >> /usr/$fileName
