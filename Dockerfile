FROM node:alpine

RUN apk update && apk upgrade
RUN mkdir -p /data

ENV NODE_ENV=production
ENV HOME=/data
ENV TZ=Europe/Berlin
WORKDIR /data
RUN npm install -g node-red@^2.0.0 \
                   node-red-dashboard@^3.0.0 \
                   node-red-contrib-ccu@^3.0.0 \
                   node-red-contrib-tplink@^1.0.0 \
                   node-red-contrib-aedes@^0.7.0 \
                   node-red-node-email@^1.0.0 \
                   node-red-node-openweathermap@^0.5.0 \
                   node-red-contrib-tankerkoenig@^0.1.0 \
                   node-red-contrib-sun-position@^2.0.0 \
                   node-red-contrib-wemo-emulator@^1.0.0 \
                   node-red-contrib-jsftpd@^1.0.0 \
                   node-red-contrib-webdav@^1.0.0 \
                   node-red-contrib-persist@^1.0.0 \
                   node-red-contrib-circuit@^2.0.0 \
                   node-red-contrib-https@^2.0.0 \
                   node-red-contrib-testssl@^1.0.0 \
                   node-red-contrib-twitter-stream@^1.0.0 \
                   node-red-contrib-netatmo-dashboard@^0.5.2 \
                   node-red-contrib-kobold@^0.9.0 \
                   node-red-contrib-ringcentral-api@^1.0.0

CMD ["/usr/local/bin/node", "/usr/local/lib/node_modules/node-red/red.js", "-s", "/data/settings.js"]
