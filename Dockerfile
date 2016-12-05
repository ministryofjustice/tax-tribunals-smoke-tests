FROM ruby:2.3-onbuild

RUN set -x
RUN apt-get update
RUN apt-get install -y --no-install-recommends curl
RUN mkdir /tmp/phantomjs
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar -xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 --strip-components=1 -C /tmp/phantomjs
RUN mv /tmp/phantomjs/bin/phantomjs /usr/local/bin
RUN curl -Lo /tmp/dumb-init.deb https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64.deb
RUN dpkg -i /tmp/dumb-init.deb
RUN apt-get purge --auto-remove -y curl
RUN apt-get clean
RUN rm -rf /tmp/* /var/lib/apt/lists/*
