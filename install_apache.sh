#/bin/bash

USER_UID=$(echo $UID)
OS_ID=$(cat /etc/os-release | grep "^ID=" | cut -d"=" -f2)

if [[ "$USER_UID" -ne 0 ]]; then
	echo "you should run with su or sudo"
	exit 1
fi

if [[ "$OS_ID" == "ubuntu" ]]; then
  apt update && apt -y install apache2
  echo "<h1>Andriy Bobrovych</h1>" > /var/www/html/index.html
elif [[ "$OS_ID" == "centos" ]]; then
  yum -y install httpd
  echo "<h1>Andriy Bobrovych</h1>" > /usr/share/httpd/noindex/index.html
fi 
