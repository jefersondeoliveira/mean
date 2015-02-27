# Mean #

###  [O que é docker ?](https://www.docker.com/whatisdocker/) ###

### Executando docker ###

* Primeiramente deve-se criar a imagem do projeto:
```
docker build -t mean .
```

* Após a criação da imagem você já poderá executar o container do projeto:

```
docker run -i -t -d -v `pwd`:/home/jeferson-docker/mean mean

```
### Ganhando controle sobre o shell do container do projeto ###

* Após executar o container do projeto execute o comando a seguir para recuperar o id do container em execução:

```
docker ps
```
* Execute o comando a seguir para ganhar o controle sobre o shell do container:

```
docker exec -it <ID-CONTAINER> bash
```

### Parando o container ###

* Para parar o container do projeto execute o comando a seguir:

```
docker stop <ID-CONTAINER>
```

### Executando o sistema ###

* Para executar o projeto você deve acessar a pasta 'mean' e execute o seguintes comando:

```
nodemon server.js
```

* Agora você já deve ter acesso ao sistema rodando em: [http://localhost:3000](http://localhost:3000)


