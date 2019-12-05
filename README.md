# Projeto IN0980 (IF1004)
Este repositório contém os arquivos do projeto da disciplina IN0980 do [Centro de Informática](https://www3.cin.ufpe.br/br/) ministrada pelo Prof. Vinicius Garcia (https://github.com/vinicius3w).

Integrantes:
* Carlos Zimmerle ([Gmail](mailto:cezl@cin.ufpe.br) | [Github](https://github.com/carloszimm))
* Inácio Nery ([Gmail](mailto:jinfn@cin.ufpe.br) | [Github](https://github.com/inacionery))
* Matheus Monteiro ([Gmail](mailto:msm2@cin.ufpe.br) | [Github](https://github.com/smbmatheus))

# Tecnologias Utilizadas

* [Docker](https://github.com/docker)
* [Docker compose](https://github.com/docker/compose)
* [Docker Swarm](https://docs.docker.com/engine/swarm/)
* [Docker Machine](https://docs.docker.com/machine/)
* [VirtualBox](https://www.virtualbox.org/)
* [Prometheus](https://github.com/prometheus/prometheus)
* [Grafana](https://github.com/grafana/grafana)
* [cAdvisor](https://github.com/google/cadvisor)
* [Node exporter](https://github.com/prometheus/node_exporter)


# Executando

O projeto simula a provisão de um cluster swarm rodando em três maquinas virtuais, criadas com o auxílio do docker-machine, e a possibilidade de um usuário visualizar o consumo e bilhetação (billing) do serviço baseado em métricas coletadas no cluster.

Para facilitar, um bash script foi criado no root do projeto (start.sh).
> sudo ./start.sh

* **OBS: AS CINCO PRIMEIRAS TECNOLOGIAS RELACIONADAS NA SEÇÃO ANTERIOR DEVEM ESTAR INSTALADAS ANTES DA EXECUÇÃO DO SCRIPT**

Ao executá-lo, as três VMs são automicamente criadas, sendo uma delas configurada para ser o manager do cluster e as outras duas assumindo os papeis de workers. Nesta configuração, Grafana e Prometheus são executadas apenas no nó manager. Por um outro lado, Node exporter e cAdvisor são configurados para serem implantados de forma global, isto é, eles rodam em todos os nós. São esses dois programas responsáveis pela disponibilização de métricas que são consumidas pelo Prometheus. O Grafana por sua vez executa de tempos em tempos consultas ao Prometheus para mostrar de forma gráfica o consumo dos nós (inserido no Prometheus através do node exporter) e consumo dos serviços (inserido através do cAdvisor).

Os dashboards no Grafana (acessado na porta 3000 usando o IP do nó manager) que mostram as informações gerais de consumo foram baseados na solução provida pelo [swarmprom](https://github.com/stefanprodan/swarmprom). O de bilhetação (billing), por sua vez, foi criado pela equipe do projeto.

Para matar as três VMs, pode-se rodar o script contido no root do projeto:
> sudo ./shutdown_vms.sh

## Aplicação de Teste
Para fins de testes, o script start.sh faz um deploy de um aplicação teste, publicamente disponível, para testar o projeto. Trata-se de um aplicação simples contruida para fins didáticos que pode servir para visualizar o uso de load balancing e scaling de uma aplicação em um cluster. Ao fim da execução do script, ao utilizar o IP do nó manager, um usuário pode acessar o index da aplicação, que mostra um GIF animado. A aplicação roda na porta 80, assim é opcional o uso da porta na URL. Por outro lado, a aplicação expõe um endpoint que mostra um sequência, ID, diferente a cada requisição. Este ID corresponde ao ID do container no qual a requisição foi encaminhada, demostrando o uso do load balancer. A aplicação encontra-se disponível no [Docker Hub](https://hub.docker.com/r/msfidelis/example-api/).
