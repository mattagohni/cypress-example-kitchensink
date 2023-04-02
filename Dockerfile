# This Docker file is for building this project on Codeship Pro
# https://documentation.codeship.com/pro/languages-frameworks/nodejs/
FROM cypress/base:10

# Create app directory
WORKDIR /home/node/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
COPY serve.json ./
COPY app ./app
COPY scripts/start.js ./server.js
COPY serve.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
#COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]