# Kubernetes(K8s) Minimum Viable Cluster

> 1. It is recommended to run this on a VM with at least 2 CPUs and 4GB of Ram  
> 2. Your K8s cluster must use [Calico's CNI plugin](https://github.com/projectcalico/calico)


## Setup on a clean DigitalOcean droplet using Minikube  


Grab dependencies
```
apt update
apt install conntrack 
```

Install Docker
```
apt install docker.io -y
```

Install Minikube
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

Install Kubectl
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

Create the Minikube cluster with Calico
```
 minikube start --network-plugin=cni --cni=calico --driver=none
```

Get the devnet config files
```
git clone https://github.com/celestiaorg/devops-test.git
cd devops-test/devnet
```

Start the core nodes
```
kubectl create -f k8s/core-nodes -R
```
>We need to wait for the core nodes to come up and start producing blocks before we can create the light nodes

Retrieve the list of pods
```
kubectl get pods
```

This should give something like
```
NAME                      READY   STATUS    RESTARTS   AGE
core0-55d67bbd55-wttnq    2/2     Running   0          5m56s
core1-7b96856c45-ljddj    2/2     Running   0          5m56s
core2-754d58d669-hgtxt    2/2     Running   0          5m56s
core3-559c667f9f-nlwhj    2/2     Running   0          5m56s
```

Check the status of a core node
```
kubectl logs core0-55d67bbd55-wttnq -c celestia-app
```
Look for block production logs
```
6:18PM INF received complete proposal block hash=64D831D041A57A9D93078B445F7B1347024A9B5A8A444086C0B556B65A8A96C7 height=1 module=consensus
6:18PM INF finalizing commit of block hash=64D831D041A57A9D93078B445F7B1347024A9B5A8A444086C0B556B65A8A96C7 height=1 module=consensus num_txs=0 root=E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855
6:18PM INF minted coins from module account amount=65911celes from=mint module=x/bank
6:18PM INF executed block height=1 module=state num_invalid_txs=0 num_valid_txs=0
6:18PM INF commit synced commit=436F6D6D697449447B5B3137352037302031303620313135203233362031303620382039203135392033352035342035322031342031373220313736203234352032313520323436203134203232302031383220313930203630203239203133372031323720313732203235322036342031373520313430203139395D3A317D
6:18PM INF committed state app_hash=AF466A73EC6A08099F2336340EACB0F5D7F60EDCB6BE3C1D897FACFC40AF8CC7 height=1 module=state num_txs=0
6:18PM INF indexed block height=1 module=txindex
```

Start the light nodes
```
kubectl create -f k8s/light-nodes -R
```

Retrieve the list of pods
```
kubectl get pods
```

This should now give you something like
```
NAME                      READY   STATUS    RESTARTS   AGE
core0-55d67bbd55-wttnq    2/2     Running   0          5m56s
core1-7b96856c45-ljddj    2/2     Running   0          5m56s
core2-754d58d669-hgtxt    2/2     Running   0          5m56s
core3-559c667f9f-nlwhj    2/2     Running   0          5m56s
light0-b69f45b74-gcmdx    1/1     Running   0          5m10s
light1-54b984d9c4-s99rz   1/1     Running   0          5m10s
light2-5dd6459c97-kqw7b   1/1     Running   0          5m10s
light3-54d8cdb7d9-8qmmp   1/1     Running   0          5m10s
```

Check the status of a light node
```
kubectl logs light0-b69f45b74-gcmdx
```

Look for header sync logs
```
2021-12-15T18:20:15.838Z        INFO    header-service  header/sync.go:34       syncing headers
2021-12-15T18:20:15.842Z        INFO    header-service  header/store.go:179     new head        {"height": 1, "hash": "64D831D041A57A9D93078B445F7B1347024A9B5A8A444086C0B556B65A8A96C7"}
```

Look for data availability sampling logs
```
2021-12-15T18:20:25.179Z        INFO    header-service  header/store.go:213     new head        {"height": 17, "hash": "66AEBA7F9254E9D5CDC75E14E1A4444B1269109202935A82E31C0F86F59303A6"}
2021-12-15T18:20:25.190Z        INFO    das     das/daser.go:96 sampling successful     {"height": 17, "hash": "66AEBA7F9254E9D5CDC75E14E1A4444B1269109202935A82E31C0F86F59303A6", "square width": 2, "finished (s)": 0.01134853}
```