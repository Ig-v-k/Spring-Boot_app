#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/<key> \
  target/<.jar file> \
  <username>@<ip-address>:<put directory>

echo 'Restart server...'

scp -i ~/.ssh/<key> <username>@<ip-address> << EOF

pgrep java |  | xargs kill -9
nohub java .jar <.jar file> > log.txt &

EOF

echo 'Bye'