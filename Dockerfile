FROM maven:3.5-jdk-8-alpine
WORKDIR /
COPY . /
RUN mvn clean install

FROM openjdk:8-jre-alpine
WORKDIR /
RUN pwd
COPY --from=0 /target/petclinic.jar /
RUN pwd
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/petclinic.jar"]