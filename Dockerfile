FROM unknownhero/ubuntu-node-n

RUN n latest

# Bundle app source
COPY ./server_example/package.json /src/server_example/package.json

WORKDIR /src/server_example

RUN npm install --no-bin-links

COPY . /src

EXPOSE 47121

CMD ["node","server.js"]
