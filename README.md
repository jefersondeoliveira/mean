# Mean #

###  [O que é docker ?](https://www.docker.com/whatisdocker/) ###

### Executando docker ###

* Caso não queira executar manualmente os comandos de configuração do ambiente do projeto, existe um script de automação, que é executado pelo seguinte comando:

```
#!shell

* Primeiramente deve-se criar a imagem do projeto:
```
#!shell

docker build -t mean .
```

* Após a criação da imagem você já poderá executar o container do projeto:

```
#!shell

docker run -i -t -d -v `pwd`:/home/jeferson-docker/mean mean

```
### Ganhando controle sobre o shell do container do projeto ###

* Após executar o container do projeto execute o comando a seguir para recuperar o id do container em execução:

```
#!shell

docker ps
```
* Execute o comando a seguir para ganhar o controle sobre o shell do container:

```
#!shell

docker exec -it <ID-CONTAINER> bash
```

### Parando o container ###

* Para parar o container do projeto execute o comando a seguir:

```
#!shell

docker stop <ID-CONTAINER>
```

### Executando o sistema ###

* Para executar o projeto você deve acessar a pasta 'mean' e execute o seguintes comando:

```
#!shell

nodemon server.js
```

* Agora você já deve ter acesso ao sistema rodando em: [http://localhost:3000](http://localhost:3000)

