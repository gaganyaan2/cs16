if [[ -d /opt/cs16 ]]
then
echo "cs16 is already installed on path /opt/cs16"
exit
fi

if [[ $(cat /etc/os-release | egrep "debian|ubuntu") != "" ]]
then
#install dependency 
apt install -y docker git

wget https://github.com/koolwithk/cs16/raw/master/cs16.tar.gz
tar -xzf cs16.tar.gz
mv cs16 /opt/cs16
rm -rf cs16.tar.gz

docker run -d -p 27015:27015/udp -v /opt/cs16:/opt/cs16:Z --name cs16 koolwithk/cs16:latest
fi

if [[ $(cat /etc/os-release | egrep  "centos|rhel|fedora") != "" ]]
then
#install dependency
yum install -y docker git

wget https://github.com/koolwithk/cs16/raw/master/cs16.tar.gz
tar -xzf cs16.tar.gz
mv cs16 /opt/cs16
rm -rf cs16.tar.gz

systemctl start docker
systemctl enable docker

docker run -d -p 27015:27015/udp -v /opt/cs16:/opt/cs16:Z --name cs16 koolwithk/cs16:latest
fi

sleep 2

if [[ $(docker ps | awk '{print $NF}' | grep -o 'cs16') == 'cs16' ]]
then
echo "cs16 server is running...connect to LOCALIP:27015"
else
echo "OOPS...cs16 server failed..."
fi