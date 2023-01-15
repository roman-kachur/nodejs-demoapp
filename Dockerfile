ARG ARCH=
ARG IMAGE_BASE=16-alpine

FROM ${ARCH}node:$IMAGE_BASE
LABEL Name="Node.js Demo App" Version=4.8.5
LABEL org.opencontainers.image.source = "https://github.com/roman-kachur/nodejs-demoapp"
ENV NODE_ENV production
WORKDIR /app 
ENV PORT=80

# For Docker layer caching do this BEFORE copying in rest of app
#COPY src/package*.json ./
COPY note.txt ./
#RUN npm install --production --silent

# NPM is done, now copy in the rest of the project to the workdir
#COPY src/. .

# Port 80 for our Express server 
#EXPOSE 80
#ENTRYPOINT ["npm", "start"]
