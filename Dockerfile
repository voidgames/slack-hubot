FROM centos:7
LABEL url=https://github.com/voidoperator/slack-hubot.git version=0.0.1

RUN yum update -y
RUN yum install -y vim
RUN yum install -y epel-release
RUN yum install -y nodejs npm

RUN npm install -g yo generator-hubot coffeescript hubot-slack

RUN useradd -d /home/hubot -m -s /bin/bash -U hubot
USER hubot
WORKDIR /home/hubot
RUN yo hubot --owner "void" --name "testbot" --description "Hubot Slack" --adapter slack

CMD cd /home/hubot; bin/hubot --adapter slack
