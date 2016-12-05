FROM ruby:2.3-onbuild

RUN set -x \
&& apt-get update \
&& apt-get install -y --no-install-recommends curl \
&& mkdir /tmp/phantomjs \
&& wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
&& tar -xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 --strip-components=1 -C /tmp/phantomjs \
&& mv /tmp/phantomjs/bin/phantomjs /usr/local/bin \
&& curl -Lo /tmp/dumb-init.deb https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64.deb \
&& dpkg -i /tmp/dumb-init.deb \
&& apt-get purge --auto-remove -y curl \
&& apt-get clean \
&& rm -rf /tmp/* /var/lib/apt/lists/*
