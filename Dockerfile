FROM node:14.8.0-alpine
RUN apk update && apk upgrade
RUN apk add git npm

RUN mkdir -p /revealjs
ADD reveal /
RUN npm install
#################
#Install Plugins
#################

# Install MathJax
RUN git clone https://github.com/mathjax/MathJax.git /MathJax

ADD ./docker-entrypoint.sh /
RUN chmod u+x /docker-entrypoint.sh
EXPOSE 8000
EXPOSE 35729
CMD ["npm", "start"]