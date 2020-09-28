FROM node:alpine AS builder
RUN mkdir -p /app
WORKDIR /app
COPY . .
RUN npm install

FROM nginx:alpine
COPY --from=builder /app /usr/share/nginx/html/
EXPOSE 80
#FROM node:12

#RUN apt-get update && \
#    apt-get upgrade -y && \
#    apt-get install -y libglu1 build-essential && \
#    apt-get clean

#RUN npm i --unsafe-perm -g gridsome@0.7.20

#RUN mkdir -p /app
#WORKDIR /app
