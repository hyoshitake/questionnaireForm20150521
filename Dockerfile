FROM node:22.14.0

WORKDIR /

COPY app/ .

RUN ls -alF /

RUN apt update && apt install -y vim
RUN npm install -g npm@8.19.4

# Yarn のインストール
RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt update -y -qq && apt install -yq yarn && yarn install

# 多分この辺でnpm installしないといけないけど試したらこけた
RUN yarn install

CMD ["npm", "run", "dev"]
# CMD ["bash"]
