FROM node:10.1.0-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

COPY . /app

ENV NODE_ENV production
ENV PORT 80
EXPOSE 80

CMD ["node", "-r", "esm", "./bin/server", "--port", "80", "domain", "lt.thetensortech.com"]
