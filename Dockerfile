FROM keymetrics/pm2:15-alpine
LABEL author="ductn53@gmail.com"

RUN mkdir -p /home/mewcloud
WORKDIR /home/mewcloud

COPY server ./server
COPY ecosystem.config.js ./
RUN cd server && npm install
COPY build ./build

EXPOSE 3000

ENTRYPOINT [ "pm2-runtime","start","ecosystem.config.js" ]
