FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install maven -y
RUN apt-get install git -y
WORKDIR /app
RUN git clone https://github.com/676031/petclinic-be.git
RUN cp ./petclinic-be/* /app -r
RUN mvn clean install
RUN cp ./target/petclinic.jar /app
CMD ["mvn spring-boot:run"]