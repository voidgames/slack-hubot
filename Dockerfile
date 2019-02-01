FROM node:10.15.1-alpine
LABEL url=https://github.com/voidoperator/slack-hubot.git version=0.0.1

RUN npm install -g yo generator-hubot coffeescript hubot-slack

USER node
WORKDIR /home/node
RUN yo hubot --owner "void" --name "testbot" --description "Hubot Slack" --adapter slack

CMD cd /home/node; bin/hubot --adapter slack
