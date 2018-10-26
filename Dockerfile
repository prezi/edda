FROM netflixoss/tomcat:7.0.64

#ADD ./target/scala-2.11/edda_2.11-3.0.0-SNAPSHOT.war /tomcat/webapps/edda.war
ADD ./edda-2.3.0.war /tomcat/webapps/edda.war
RUN mkdir /tomcat/webapps/ROOT &&\
  cd /tomcat/webapps/ROOT &&\
  jar xf ../edda.war &&\
  cd .. &&\
  rm edda.war

RUN mkdir -p /tomcat/webapps/ROOT/WEB-INF/classes
#ADD ./edda.properties /tomcat/webapps/ROOT/WEB-INF/classes/edda.properties

EXPOSE 8080

CMD ["/tomcat/bin/catalina.sh", "run"]
