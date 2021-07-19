# Install OpenJDK 11 on RHEL 8 / CentOS 8
sudo yum -y install java-11-openjdk-devel

java -version
which java

sudo cat > /etc/profile.d/java11.sh <<EOF
export JAVA_HOME=\$(dirname \$(dirname \$(readlink \$(readlink \$(which javac)))))
export PATH=\$PATH:\$JAVA_HOME/bin
export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar
EOF

sudo source /etc/profile.d/java11.sh

# Install Java SE Development Kit 11 (JDK 11) on RHEL 8 / CentOS 8
sudo curl -LO -H "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.rpm"

sudo rpm -Uvh jdk-11.0.1_linux-x64_bin.rpm 
sudo java -version 


# Step 1: Add MySQL repository
sudo dnf install mysql-server
sudo systemctl start mysqld.service
sudo systemctl status mysqld
sudo systemctl enable mysqld
