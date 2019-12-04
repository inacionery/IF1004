- Instalar virtualbox
	> brew cask install virtualbox

- Criar a vm master
	> docker-machine create -d virtualbox master

- Criar swarm master
	> docker-machine ssh master "docker swarm init --listen-addr $(docker-machine ip master) --advertise-addr $(docker-machine ip master)"

- Exporta o token do master
	> export worker_token=$(docker-machine ssh master "docker swarm join-token worker -q")

- Criar node minion01
	> docker-machine create -d virtualbox minion01

- Entrar na swarm com o token do master
	> docker-machine ssh minion01 "docker swarm join --token=${worker_token} --listen-addr $(docker-machine ip minion01) --advertise-addr $(docker-machine ip minion01) $(docker-machine ip master)"

- Criar node minion02
	> docker-machine create -d virtualbox minion02

- Entrar na swarm com o token do master
	> docker-machine ssh minion02 "docker swarm join --token=${worker_token} --listen-addr $(docker-machine ip minion02) --advertise-addr $(docker-machine ip minion02) $(docker-machine ip master)"

- Usar o docker como fosse o minion01
	> eval $(docker-machine env minion01)

- Cria as imagens do grafana e prometheus
	> ./create_images.sh

- Usar o docker como fosse o minion02
	> eval $(docker-machine env minion02)

- Cria as imagens do grafana e prometheus
	> ./create_images.sh
	
- Usar o docker como fosse o master
	> eval $(docker-machine env master)

- Cria as imagens do grafana e prometheus
	> ./create_images.sh

- Deploy da aplicação if1004
	> docker stack deploy -c docker-compose.yml if1004

- Mostra o stack da aplicação if1004
	> docker stack ps if1004

- Mostra os serviços da aplicação if1004
	> docker stack services if1004

- Lista as VMs
	> docker-machine ls

- Ip da master
	> docker-machine ip master

- Remove aplicação
	> docker stack rm if1004

- Fonte:
https://medium.com/@fidelissauro/docker-swarm-quickstart-do-seu-cluster-local-com-docker-machine-e-virtualbox-44d4096deae
