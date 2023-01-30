ARG ARCH=
ARG IMAGE_BASE=16-alpine

FROM ${ARCH}node:$IMAGE_BASE
LABEL Name="Node.js Demo App" Version=4.8.5
LABEL org.opencontainers.image.source = "https://github.com/benc-uk/nodejs-demoapp"
ENV NODE_ENV production
WORKDIR /app 

RUN apk update && \
    apk add openrc util-linux nginx && \
    mkdir /run/openrc && \
    touch /run/openrc/softlevel 

# For Docker layer caching do this BEFORE copying in rest of app
COPY src/package*.json ./
RUN npm install --production --silent

# NPM is done, now copy in the rest of the project to the workdir
COPY src/. .

RUN chmod a+x start.sh

# Port 80 for our nginx proxy 
EXPOSE 80
ENTRYPOINT ["./start.sh"]
