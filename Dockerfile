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
