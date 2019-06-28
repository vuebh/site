# Site da comunidade VueJS de BH
[![Netlify Status](https://api.netlify.com/api/v1/badges/87bb32fd-4b00-46a2-b89c-8bb47fdd293f/deploy-status)](https://app.netlify.com/sites/vuejsbh/deploys)

O presente artigo é um tutorial para subir containers para o ambiente de desenvolvimento do Quasar Framework v1.0.0-rc.5, um framework para VueJS de alta performance que utiliza Material Design. O site da comunidade está em https://vuejsbh.dev/ .

A publicação também está em: https://medium.com/@eduardofg87/site-da-comunidade-vuejs-de-bh-d942e40d2830

## Inicialização do projeto Quasar
Para inicializar o projeto, precisamos de criar um novo diretório e instalar o vue/cli. Para fazer isso basta executar o seguinte comando no terminal:

`sudo docker run --rm -v ${PWD}:/app -it node:12.4.0-alpine sh -c "npm install -g @vue/cli && npm install -g @quasar/cli && quasar create app"`

Após executado o comando acima algumas informações deve ser preenchidas como por exemplo na imagem abaixo:

![alt text](https://github.com/vuebh/site/blob/master/assets/quasar_cli.png)

## Dockerfile
O Dockerfile é baseado no [real-world Vue example](https://vuejs.org/v2/cookbook/dockerize-vuejs-app.html#Real-World-Example):

```
# develop stage
FROM node:12.4.0-alpine as develop-stage
WORKDIR /app
COPY package*.json ./
RUN npm install -g @vue/cli && npm install -g @quasar/cli
COPY . .
# build stage
FROM develop-stage as build-stage
RUN npm
RUN quasar build
# production stage
FROM nginx:1.17.0-alpine as production-stage
COPY --from=build-stage /app/dist/spa-mat /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

O Dockerfile se divide em develop, build e production, o primeiro instala todas dependências em um container Node, o segundo monta a aplicação no container node enquanto o terceiro serve de artefato para o NGINX.

Build do container:

`docker build -t dockerize-quasar .`

Iniciar o container:

`docker run -it -p 8000:80 --rm dockerize-quasar`

## Docker-compose

```
# for local development
version: '3.7'
services:
  quasar:
    build:
      context: .
      target: 'develop-stage'
    ports:
    - '8080:8080'
    volumes:
    - '.:/app'
    command: /bin/sh -c "quasar dev"
```

Build no docker-compose: 
`sudo docker-compose up --build`

Após o build é possível acessar o projeto em http://localhost:8080 como na imagem abaixo:

![alt text](https://github.com/vuebh/site/blob/master/assets/quasar_localhost.png)


Após algumas pequenas modificações a primeira versão ficou assim:

![alt text](https://github.com/vuebh/site/blob/master/assets/quasar_localhost_vuejsbh.png)

É possível acessar o projeto online em http://vuejsbh.dev. O deploy foi realizado pelo [Netlify](https://www.netlify.com/). 

Espero que eu tenha contribuído!

Podem me procurar nas redes sociais por @eduardofg87


### Referências:

1. [VueJS](https://vuejs.org/)
1. [QuasarFramework](https://quasar.dev/)
1. [Quasar applications with Docker; initialize, develop and build](https://medium.com/@jwdobken/develop-quasar-applications-with-docker-a19c38d4a6ac)
