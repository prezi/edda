# Copyright 2014 Netflix, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM netflixoss/tomcat:7.0.64

ADD ./target/scala-2.11/edda_2.11-3.0.0-SNAPSHOT.war /tomcat/webapps/edda.war
#ADD build/libs/edda-2.4.0-SNAPSHOT.war /tomcat/webapps/edda.war
#ADD edda-2.1.war /tomcat/webapps/edda.war

RUN mkdir /tomcat/webapps/ROOT &&\
  cd /tomcat/webapps/ROOT &&\
  jar xf ../edda.war &&\
  cd .. &&\
  rm edda.war

RUN mkdir -p /tomcat/webapps/ROOT/WEB-INF/classes && touch /tmp/eddaLeader
ADD ./edda.properties /tomcat/webapps/ROOT/WEB-INF/classes/edda.properties

EXPOSE 8080

CMD ["/tomcat/bin/catalina.sh", "run"]
