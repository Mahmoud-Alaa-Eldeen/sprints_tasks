FROM httpd:2.4
 
COPY ./html_page/ /usr/local/apache2/htdocs/

RUN  echo "Listen 9999" >> /usr/local/apache2/conf/httpd.conf


EXPOSE 9999/tcp

ENV CONTAINER=docker

CMD echo $CONTAINER
