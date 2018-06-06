
$HOST_NAME="$1"
IP="$2"

# Set hostname
hostnamectl set-hostname "${HOST_NAME}"

# Set static IP
sed -i "s/ONBOOT=no/ONBOOT=yes/g" /etc/sysconfig/network-scripts/ifcfg-ens33
sed -i "s/IPADDR=192.168.37.100/IPADDR=${IP}/g" /etc/sysconfig/network-scripts/ifcfg-ens33
systemctl restart network

ip addr show

