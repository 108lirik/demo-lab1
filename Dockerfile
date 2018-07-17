FROM openjdk:8-jre-alpine

RUN mkdir -p /opt/demo
COPY demo-0.0.6-SNAPSHOT.jar /opt/demo/
WORKDIR /opt/demo/

CMD ["java", "-jar", "/opt/demo/demo-0.0.6-SNAPSHOT.jar"]
