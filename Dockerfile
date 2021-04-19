FROM openjdk:8-jdk-alpine
LABEL maintainer="lisapetclinic.azurewebsites.net"
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]