# see https://doc-kurento.readthedocs.io/en/6.10.0/tutorials/node/tutorial-helloworld.html
FROM node:8.10-alpine AS clone-tutorial
WORKDIR /
RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add git && \
    apk add alpine-sdk && \
    apk add python
RUN git clone https://github.com/Kurento/kurento-tutorial-node.git && \
    cd kurento-tutorial-node/kurento-hello-world  && \
    git checkout 6.10.0
WORKDIR /kurento-tutorial-node/kurento-hello-world
RUN npm config set unsafe-perm true
RUN npm install bower -g
RUN npm install --ignore-scripts
RUN cd static && bower install --allow-root

FROM node:8.10-alpine
COPY --from=clone-tutorial /kurento-tutorial-node/kurento-hello-world /kurento-hello-world
WORKDIR /kurento-hello-world
EXPOSE 8443
ENTRYPOINT ["npm", "start"]
