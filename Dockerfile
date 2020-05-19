FROM nginx:1.17.10
# Copy files
COPY nginx.conf /etc/nginx/conf.d/default.conf
#COPY dist/angular-ci-cd /usr/share/nginx/html
EXPOSE 80
