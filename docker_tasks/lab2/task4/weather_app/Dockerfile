FROM node:alpine

ARG APP_VERSION=latest

WORKDIR /node/weather-app
COPY Good_Reads_App/ .

#to run dependencies for the node js app from package.json file
RUN npm install

ENV NODE_ENV production


WORKDIR /var/weather-app

RUN cp -r /node/weather-app/ .  
EXPOSE 3000
ENTRYPOINT [./bin/www]

