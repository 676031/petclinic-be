FROM maven:3.5-jdk-8-alpine
WORKDIR /
COPY . /
RUN mvn clean install

FROM openjdk:8-jre-alpine
WORKDIR /
COPY --from=1 /target/petclinic.jar /
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/petclinic.jar"]