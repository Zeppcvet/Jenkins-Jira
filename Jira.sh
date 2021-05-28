#!/bin/bash
sudo apt-get update
sudo apt-get install default-jdk
wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-core-8.13.7-x64.bin
chmod +x atlassian-jira-core-8.13.7-x64.bin
printf "o\2\/ops/atlassian/jira\/var/atlassian/application-data/jira\1\y\i\y" | ./atlassian-jira-core-8.13.7-x64.bin
sudo apt install ufw
ufw allow 8181
ufw allow 8005
ufw allow 8080
ufw enable
