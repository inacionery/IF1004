- Instalar virtualbox
	> brew cask install virtualbox

- Criar a vm master
	> docker-machine create -d virtualbox master

- Criar swarm master
	> docker-machine ssh master "docker swarm init --advertise-addr eth1"

- Criar node minion01
	> docker-machine create -d virtualbox minion01

- Entrar na swarm com o token do master
	> docker-machine ssh minion01 "docker swarm join --token SWMTKN-1-5s7ux69fdpja8r7p2t47ju576bhr4v1ukcruadocf3yzvmc5js-dng200dctwh9wqd7ebcmoriuq 192.168.99.100:2377"

- Criar node minion02
	> docker-machine create -d virtualbox minion02

- Entrar na swarm com o token do master
	> docker-machine ssh minion02 "docker swarm join --token SWMTKN-1-5s7ux69fdpja8r7p2t47ju576bhr4v1ukcruadocf3yzvmc5js-dng200dctwh9wqd7ebcmoriuq 192.168.99.100:2377"

- Usar o docker como fosse o master
	> eval $(docker-machine env master)

- Cria as imagens do grafana e prometheus
	> ./create_images.sh

- Deploy da aplicação if1004
	> docker stack deploy -c docker-compose.yml if1004

- Mostra o stack da aplicação if1004
	> docker stack ps if1004

- Lista as VMs
	> docker-machine ls

- Ip da master
	> docker-machine ip master

- Remove aplicação
	> docker stack rm if1004

- https://medium.com/@fidelissauro/docker-swarm-quickstart-do-seu-cluster-local-com-docker-machine-e-virtualbox-44d4096deae