FROM node:13.12.0-alpine

WORKDIR /frontend

ENV PATH /frontend/node_modules/.bin:$PATH

COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
#RUN npm global add react-scripts@3.4.1 --silent

COPY . .

EXPOSE 3000

CMD ["npm", "start"]