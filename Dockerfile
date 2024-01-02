FROM node:20-alpine
ENV NODE_ENV=production
ENV HOME=/data
ENV TZ=Europe/Berlin
RUN mkdir -p /data
WORKDIR /data
RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache tzdata bash coreutils procps openssl bind-tools python3 make gcc g++ linux-headers udev && \
    npm install -g node-red@3.1.3 \
                   node-red-dashboard@^3.0.0 \
                   node-red-contrib-ccu@^3.0.0 \
                   node-red-contrib-tplink@^1.0.0 \
                   node-red-contrib-aedes@^0.12.0 \
                   node-red-node-email@^2.0.0 \
                   node-red-node-openweathermap@^0.5.0 \
                   node-red-contrib-aws@^0.7.0 \
                   node-red-contrib-tankerkoenig@^0.1.0 \
                   node-red-contrib-sun-position@^2.0.0 \
                   node-red-contrib-wemo-emulator@^1.0.0 \
                   node-red-contrib-jsftpd@^1.0.0 \
                   node-red-contrib-webdav@^1.0.0 \
                   node-red-contrib-persist@^1.0.0 \
                   node-red-contrib-https@^2.0.0 \
                   node-red-contrib-testssl@^1.0.0 \
                   node-red-contrib-netatmo-dashboard@^1.0.0 \
                   node-red-contrib-kobold@^0.9.0 \
                   node-red-contrib-ringcentral-api@^1.0.0 \
                   node-red-contrib-modbus@^5.0.0 \
                   node-red-contrib-sonos-plus@^6.0.0 \
                   node-red-node-mongodb@^0.2.5 \
                   passport@^0.7.0 \
                   passport-keycloak-oauth2-oidc@^1.0.0 && \
    apk del make gcc g++ linux-headers && \
    rm -rf /var/cache/apk/*

CMD ["/usr/local/bin/node", "/usr/local/lib/node_modules/node-red/red.js", "-s", "/data/settings.js"]
