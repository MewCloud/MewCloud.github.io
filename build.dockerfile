# Build BASE
FROM node:16-alpine3.15 as BASE
LABEL author="ductnn"

WORKDIR /mewcloud
COPY package*.json ./
RUN apk add --no-cache git \
    && npm install --frozen-lockfile


# Build Image
FROM node:16-alpine3.15 AS BUILD
LABEL author="ductnn"

WORKDIR /mewcloud
COPY --from=BASE /mewcloud/node_modules ./node_modules
COPY . .
RUN apk add --no-cache git curl \
    && npm run build \
    && rm -rf node_modules \
    && npm install --production --frozen-lockfile --ignore-scripts --prefer-offline \
    && curl -sf https://gobinaries.com/tj/node-prune | sh -s -- -b /usr/local/bin \
    && node-prune


# Build production
FROM node:16-alpine3.15 AS PRODUCTION
LABEL author="ductnn"

WORKDIR /mewcloud
COPY --from=BUILD /mewcloud/package*.json ./
COPY --from=BUILD /mewcloud/node_modules ./node_modules
COPY --from=BUILD /mewcloud/build ./build
COPY --from=BUILD /mewcloud/public ./public

EXPOSE 3000

CMD ["npm", "start"]
