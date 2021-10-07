brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve

sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

docker-machine create -d xhyve default

docker-machine create default --driver xhyve --xhyve-experimental-nfs-share
eval $(docker-machine env default)

docker-machine start default 
# docker-machine stop default 
# docker-machine restart default