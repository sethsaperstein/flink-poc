#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /code/src
COPY pom.xml /code/pom.xml
RUN mvn -f /code/pom.xml clean package

#
# Package stage
#
FROM flink:1.15
COPY --from=build /code/target/flink-poc-0.1.jar /opt/flink/app/flink-poc-0.1.jar
