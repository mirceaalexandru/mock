FROM node:6.9.5

ENV MOCK_SERVER_PORT 3050

# Skip npm install if package.json didn't changed
ADD package.json /tmp/package.json

RUN cd /tmp && npm install --production

RUN mkdir -p /opt/mock && cp -a /tmp/node_modules /opt/mock

WORKDIR /opt/mock
ADD . /opt/mock

EXPOSE ${MOCK_SERVER_PORT}

CMD ["npm", "start"]
