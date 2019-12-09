FROM alpine/git
WORKDIR /
RUN git clone https://github.com/676031/petclinic-be.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /
COPY --from=0 /petclinic-be /
RUN mvn clean install

FROM openjdk:8-jre-alpine
WORKDIR /
COPY --from=1 /target/petclinic.jar /
ENTRYPOINT ["mvn spring-boot:run"]
