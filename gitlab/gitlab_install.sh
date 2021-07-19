# Step 1: Update system and Install Dependencies
sudo yum -y update
sudo yum -y install curl vim policycoreutils python3-policycoreutils

sudo yum -y install postfix
sudo systemctl enable postfix && sudo systemctl start postfix

# Step 2: Add the Gitlab CE Repository
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash

# Step 3: Install GitLab CE on CentOS 8 / RHEL 8
sudo yum install gitlab-ce

# sudo vi /etc/gitlab/gitlab.rb
# external_url 'http://gitlab.example.com' # http://192.168.30.134

# sudo gitlab-ctl reconfigure

# sudo firewall-cmd --permanent --add-service={ssh,http,https} --permanent
# sudo firewall-cmd --reload

# Step 4: Access GitLab Web Console
# sudo vi /etc/gitlab/initial_root_password
# curl http://192.168.30.134
