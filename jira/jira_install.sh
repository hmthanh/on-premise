# Install OpenJDK 11 on RHEL 8 / CentOS 8
sudo yum -y install java-11-openjdk-devel

java -version
which java

cat > /etc/profile.d/java11.sh <<EOF
export JAVA_HOME=\$(dirname \$(dirname \$(readlink \$(readlink \$(which javac)))))
export PATH=\$PATH:\$JAVA_HOME/bin
export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar
EOF

source /etc/profile.d/java11.sh

# Install Java SE Development Kit 11 (JDK 11) on RHEL 8 / CentOS 8
curl -LO -H "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.rpm"

sudo rpm -Uvh jdk-11.0.1_linux-x64_bin.rpm 
java -version 


# Step 1: Add MySQL repository
sudo dnf remove @mysql
sudo dnf module reset mysql && sudo dnf module disable mysql

cat > /etc/yum.repos.d/mysql-community.repo <<EOF
[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0

[mysql-connectors-community]
name=MySQL Connectors Community
baseurl=http://repo.mysql.com/yum/mysql-connectors-community/el/7/$basearch/
enabled=1
gpgcheck=0

[mysql-tools-community]
name=MySQL Tools Community
baseurl=http://repo.mysql.com/yum/mysql-tools-community/el/7/$basearch/
enabled=1
gpgcheck=0
EOF

# Step 2: Install MySQL 5.7 on CentOS 8 / RHEL 8
sudo dnf config-manager --disable mysql80-community
sudo dnf config-manager --enable mysql57-community
sudo dnf install -y mysql-community-server


rpm -qi mysql-community-server

# Step 3: Configure MySQL 5.7 on CentOS 8 / RHEL 8
sudo systemctl enable --now mysqld.service

# sudo grep 'A temporary password' /var/log/mysqld.log |tail -1