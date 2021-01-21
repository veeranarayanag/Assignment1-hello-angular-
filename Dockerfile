# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
EXPOSE 80

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/hello-angular /usr/share/nginx/html



