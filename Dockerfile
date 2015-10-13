# Pull base image
FROM nginx:latest

MAINTAINER Raymond Torino <raymond@loansolutions.ph>

# Download packages
RUN apt-get update
RUN apt-get install -y curl git build-essential

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

# Cleanup
RUN apt-get clean

# Update NPM
RUN npm install -g npm

# Install global build dependency
RUN npm install -g gulp

# Clean NPM cache
RUN npm cache clean

# Expose ports
EXPOSE 443
EXPOSE 80

# Start nginx
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

