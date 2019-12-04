# Projeto IF1004/IN0980
Este repositório contém os arquivos do projeto da disciplina IF1004/IN0980 do [Centro de Informática](https://www3.cin.ufpe.br/br/) ministrada pelo Prof. Vinícios Garcia (https://github.com/vinicius3w).

Integrantes:
* Carlos Zimmerle ([Gmail](mailto:cezl@cin.ufpe.br) | [Github](https://github.com/carloszimm))
* Inácio Nery ([Gmail](mailto:jinfn@cin.ufpe.br) | [Github](https://github.com/inacionery))
* Matheus Monteiro ([Gmail](mailto:msm2@cin.ufpe.br) | [Github](https://github.com/smbmatheus))


# Running

O projeto simula a provisão de um cluster [swarm](https://docs.docker.com/engine/swarm/) rodando em três maquinas virtuais, criadas com o auxílio do [docker-machine](https://docs.docker.com/machine/), e a possibilidade de um usuário visualizar as métricas de consumo e bilhetação (billing) do serviço baseado nas métricas coletadas no cluster.

Para facilitar, um bash script foi criado no root do projeto (start.sh).
> sudo ./start.sh
