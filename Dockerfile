FROM httpd:2.4
RUN apt update && apt upgrade -y
RUN apt install -y nodejs npm
WORKDIR /app
COPY package*.json ./
RUN npm i -g @quasar/cli
RUN npm install
COPY . .
RUN quasar build
RUN ls -la ./dist/spa
RUN cp -r ./dist/spa/* /usr/local/apache2/htdocs/
