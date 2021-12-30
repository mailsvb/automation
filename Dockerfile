FROM node:alpine

RUN apk update && apk upgrade
RUN mkdir -p /data

ENV NODE_ENV=production
ENV HOME=/data
ENV TZ=Europe/Berlin
WORKDIR /data
RUN npm install -g node-red node-red-dashboard node-red-contrib-ccu node-red-contrib-tplink node-red-contrib-aedes \
                   node-red-node-email node-red-node-openweathermap node-red-contrib-tankerkoenig node-red-contrib-sun-position \
                   node-red-contrib-wemo-emulator node-red-contrib-jsftpd node-red-contrib-webdav node-red-contrib-persist
