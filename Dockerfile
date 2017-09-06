# official slim node image based on debian
FROM node:6-slim

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
  echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
  apt-get update &&\
  apt-get install -y --no-install-recommends python2.7 make build-essential g++ yarn &&\
  cp /usr/bin/python2.7 /usr/local/bin/python &&\
  chmod 0755 /usr/local/bin/python &&\
  rm -vrf /var/cache/apt/* /var/lib/apt/lists/* &&\
  yarn global add gulp-cli

CMD yarn

