FROM node:latest
RUN npm install -g http-server
RUN apt-get update -y && apt-get install -y 
RUN mkdir /app

WORKDIR /app
# copy both 'package.json' and 'package-lock.json' (if available)
# COPY package*.json ./

COPY . /app

# install project dependencies
RUN npm install
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]