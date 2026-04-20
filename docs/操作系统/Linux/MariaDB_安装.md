# MariaDB 安装

```sh
# 安装 MariaDB
sudo pacman -Sy mariadb
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# 启用服务
systemctl enable --now mariadb
systemctl status mariadb

# 初始化数据库
sudo mysql_secure_installation

# 以 root 用户的身份登录
sudo mysql -u root

MariaDB > USE mysql;
MariaDB > SELECT User, Host, plugin FROM user;

# 创建用户
MariaDB > CREATE USER 'YOUR_SYSTEM_USER'@'localhost' IDENTIFIED BY 'YOUR_PASSWD'; # 添加用户
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'YOUR_SYSTEM_USER'@'localhost';          # 授予用户权限

# 设置验证方式
# 注意: 在 MariaDB 中, mysql.user 只是一个视图, 不能直接通过 UPDATE 语句进行修改
MariaDB > ALTER USER 'YOUR_SYSTEM_USER'@'localhost' IDENTIFIED VIA unix_socket;

MariaDB > FLUSH PRIVILEGES; # 使修改立即生效

# 以当前用户的身份登录
mysql
```
