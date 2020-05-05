FROM tomcat:9-jre11

RUN mkdir -p /data/hapi/lucenefiles && chmod 775 /data/hapi/lucenefiles
COPY target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]