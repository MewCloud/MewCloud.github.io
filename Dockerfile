FROM ductn4/pm2:15-alpine
LABEL author="ductn53@gmail.com"

RUN mkdir -p /home/mewcloud
WORKDIR /home/mewcloud

COPY node_server ./node_server
COPY ecosystem.config.js ./

RUN cd node_server \
    && npm install \
    && npm cache verify \
    && node-prune

COPY build ./build

EXPOSE 3000

ENTRYPOINT [ "pm2-runtime","start","ecosystem.config.js" ]
