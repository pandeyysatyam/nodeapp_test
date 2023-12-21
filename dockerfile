FROM node:latest

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install
RUN kubectl apply -f nodeapp-config.yaml
RUN kubectl get deployments
RUN kubectl get ingresses
RUN kubectl get services

COPY . .

EXPOSE 4000
CMD [ "node", "index.js" ]
