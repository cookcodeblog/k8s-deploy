# https://www.cnblogs.com/syqlp/p/6555524.html

rpm -qa |grep yum
rpm -qa|grep yum|xargs rpm -e --nodeps
rpm -qa|grep python-urlgrabber|xargs rpm -e --nodeps
rpm -qa |grep yum

# Check detailed rpm version in mirror:
# https://mirrors.aliyun.com/centos/7/os/x86_64/Packages/

wget https://mirrors.aliyun.com/centos/7/os/x86_64/Packages/yum-metadata-parser-1.1.4-10.el7.x86_64.rpm
wget https://mirrors.aliyun.com/centos/7/os/x86_64/Packages/yum-3.4.3-158.el7.centos.noarch.rpm      
wget https://mirrors.aliyun.com/centos/7/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.31-45.el7.noarch.rpm 
wget https://mirrors.aliyun.com/centos/7/os/x86_64/Packages/yum-utils-1.1.31-45.el7.noarch.rpm
wget https://mirrors.aliyun.com/centos/7/os/x86_64/Packages/python-urlgrabber-3.10-8.el7.noarch.rpm
wget https://mirrors.aliyun.com/centos/7/os/x86_64/Packages/python-kitchen-1.1.1-5.el7.noarch.rpm
wget https://mirrors.aliyun.com/centos/7/os/x86_64/Packages/python-chardet-2.2.1-1.el7_1.noarch.rpm

rpm -ivh python-chardet-2.2.1-1.el7_1.noarch.rpm
rpm -ivh python-kitchen-1.1.1-5.el7.noarch.rpm
rpm -ivh python-urlgrabber-3.10-8.el7.noarch.rpm

rpm -ivh yum-utils-1.1.31-45.el7.noarch.rpm yum-metadata-parser-1.1.4-10.el7.x86_64.rpm yum-3.4.3-158.el7.centos.noarch.rpm yum-plugin-fastestmirror-1.1.31-45.el7.noarch.rpm 

 

