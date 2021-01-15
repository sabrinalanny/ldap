FROM openjdk:8-jre-alpine
WORKDIR /app
LABEL maintainer="sabrina@sqtecnologia.com"
COPY target/ldapapi-1.0.jar /app/spring-boot-app.jar
ENTRYPOINT ["java","-jar","spring-boot-app.jar"]