FROM openjdk:8-jre-alpine

WORKDIR /app

COPY target/*.jar .

CMD java -jar *.jar

