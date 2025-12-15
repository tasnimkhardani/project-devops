# build stage
FROM node:20-alpine AS build

WORKDIR /build

COPY package*.json ./

RUN npm ci ; npm cache clean --force

# production
FROM node:20-alpine

WORKDIR /app

COPY --from=build build/node_modules ./node_modules
COPY . .

EXPOSE 80

ENTRYPOINT [ "node" , "server.js" ]

