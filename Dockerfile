FROM node:alpine

ENV HOST 0.0.0.0
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json .
COPY package-lock.json .
# For npm@5 or later, copy package-lock.json as well
# COPY package.json package-lock.json ./

RUN npm install
RUN npm install nuxt -g

# Bundle app source
COPY . .

RUN npm run build

EXPOSE 3000
CMD [ "npm", "start" ]