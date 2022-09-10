FROM docker.io/library/openjdk:8-jdk-alpine

MAINTAINER Reabetswe Mahlare "reamahlare24@gmail.com"

RUN addgroup -S spring && adduser -S spring -G spring

USER spring:spring

COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", ""]

