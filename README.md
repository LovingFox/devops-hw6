# devops-hw6

**Dockerfile**

Install:

    git clone https://github.com/LovingFox/devops-hw6.git
    cd devops-hw6
    docker build -t boxfuse:v0.1 .
    docker run --rm -d -p 80:8080 --name boxfuse boxfuse:v0.1
Test:

    curl 0.0.0.0:80/hello-1.0/
  Stop:

    docker stop boxfuse

**Dockerfile.tomcat:9.0**

Install:

    git clone https://github.com/LovingFox/devops-hw6.git
    cd devops-hw6
    docker build -f Dockerfile.tomcat\:9.0 -t boxfuse:v0.2
    docker run --rm -d -p 80:8080 --name boxfuse boxfuse:v0.2 .
Test:

    curl 0.0.0.0:80
  Stop:

    docker stop boxfuse

