#  https://github.#com/docker-library/official-images/blob/master/library/node
FROM alpine:3.6
RUN echo -e "http://mirrors.aliyun.com/alpine/v3.6/community\nhttp://mirrors.aliyun.com/alpine/v3.6/main" > /etc/apk/repositories


# apk search node  to find newest node package on alpine

RUN addgroup -g 1000 node \
    && adduser -u 1000 -G node -s /bin/sh -D node \
    && apk add --update --no-cache nodejs-current nodejs-current-npm nodejs-current-dev

RUN  apk add --update --no-cache git bash openssh
RUN npm config set registry https://registry.npm.taobao.org && npm install -g pm2@latest && npm install -g typescript@2.1.5 && npm cache clean