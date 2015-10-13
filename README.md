# NGINX and Node.js
A docker image with NGINX and Node.js and gulp as global build dependency installed in it. Useful to serve up a single page application built with node.

## Usage

Make a `Dockerfile` something like this:

```bash
FROM loansolutions/nginx-node:latest

# Install and build the application
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN npm install \
  && npm run build

COPY default.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]
```

The `default.conf` would look something like this.

```
server {
  listen       80;
  server_name  localhost;

  root /usr/src/app/build;
  index index.html index.htm;

  location / {
    try_files $uri /index.html;
  }
}
```