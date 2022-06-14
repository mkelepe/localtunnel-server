FROM node:10.1.0-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

COPY . /app

EXPOSE 80

ENV NODE_ENV production
CMD ["node", "-r", "esm", "./bin/server", "--port", "80"]
