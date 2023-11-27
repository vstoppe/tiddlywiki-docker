FROM node:alpine

ARG release

RUN npm install -g tiddlywiki@${release}

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
ENTRYPOINT ["/bin/sh"]
CMD ["/usr/local/bin/init-and-run-wiki"]
