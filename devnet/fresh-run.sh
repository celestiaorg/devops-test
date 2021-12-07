apt update 
apt install docker.io -y
apt install docker-compose -y
git clone https://github.com/celestiaorg/devops-test.git
git checkout jbowen93/docker
cd devops-test/devnet
docker-compose up
