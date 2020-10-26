FROM java:8-jdk-alpine
# https://spring.io/guides/gs/spring-boot-docker/

ENV appName = demo

# Add additional software
RUN apk --update --no-cache add ca-certificates && \
    rm -rf /var/cache/apk/*

VOLUME /tmp

COPY /target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar /app.jar
