FROM node:22
WORKDIR /app
COPY package*.json ./
RUN npm i -g @quasar/cli
RUN npm install
COPY . .
ENV PORT=8080
EXPOSE 8080
CMD [ "quasar","dev" ]
