# build
FROM node:20-alpine AS build

WORKDIR /build

COPY package*.json ./

COPY . .

RUN npm install ; npm cache clean --force ; npm run build

# production
FROM node:20-alpine

WORKDIR /app

COPY --from=build /build/node_modules ./node_modules
COPY --from=build /build/dist ./dist
COPY --from=build build/server.js ./server.js
COPY --from=build build/.env ./.env

EXPOSE 80

ENTRYPOINT [ "node"  , "server.js" ]

