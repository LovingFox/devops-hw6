FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && \
    apt-get -y install tomcat9 default-jdk maven git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    cd boxfuse-sample-java-war-hello && \
    mvn package
RUN cp target/hello-*.war /var/lib/tomcat9/webapps/
