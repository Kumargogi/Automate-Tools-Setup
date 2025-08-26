yum install docker git -y
systemctl start docker
systemctl status docker
#To link jenkins with docker we need to give permisssions to docker.so
chmod 777 ///var/run/docker.sock
