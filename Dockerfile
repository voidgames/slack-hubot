FROM centos:7
LABEL url=https://github.com/voidoperator/slack-hubot.git version=0.0.1

RUN yum update -y \
    && yum install -y vim \
    && yum install -y epel-release \
    && yum install -y nodejs npm \
    && npm install -g yo generator-hubot coffeescript hubot-slack \
    && useradd -d /home/hubot -m -s /bin/bash -U hubot

USER hubot
WORKDIR /home/hubot
RUN yo hubot --owner "void" --name "testbot" --description "Hubot Slack" --adapter slack

CMD cd /home/hubot; bin/hubot --adapter slack
