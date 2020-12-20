FROM node:alpine as hello
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=hello /app/build  /usr/share/nginx/html
