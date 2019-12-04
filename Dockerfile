FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/676031/petclinic-be.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/petclinic-be /app
RUN mvn clean install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/petclinic.jar /app
CMD ["mvn spring-boot:run"]