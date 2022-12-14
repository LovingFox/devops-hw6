FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && \
    apt-get -y install tomcat9 default-jdk maven git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    cd boxfuse-sample-java-war-hello && \
    mvn package
RUN cp boxfuse-sample-java-war-hello/target/hello-*.war /var/lib/tomcat9/webapps/
EXPOSE 8080
ENV CATALINA_HOME=/usr/share/tomcat9 \
    CATALINA_BASE=/var/lib/tomcat9 \
    CATALINA_TMPDIR=/tmp \
    JAVA_OPTS=-Djava.awt.headless=true
CMD ["/bin/bash", "-c", "/usr/libexec/tomcat9/tomcat-update-policy.sh; /usr/libexec/tomcat9/tomcat-start.sh"]
