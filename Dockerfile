FROM node:10.15.1-alpine
LABEL url=https://github.com/voidoperator/slack-hubot.git version=0.0.1

RUN npm install -g yo generator-hubot coffeescript
# npm install -g yo generator-hubot coffeescript hubot-slack

USER node
WORKDIR /home/node

RUN yo hubot --owner "void" --name "bot" --description "Hubot Slack" --adapter slack

COPY package.json /home/node/
COPY scripts/ /home/node/scripts/

RUN npm install

CMD cd /home/node; bin/hubot --adapter slack
