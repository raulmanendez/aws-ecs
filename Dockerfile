# Build stage
FROM maven:3.8.4-openjdk-8-slim AS build

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean install -DskipTests

# Runtime stage
FROM openjdk:8-jdk-slim

WORKDIR /app

COPY --from=build /app/target/micro_starter_one-0.0.1-SNAPSHOT.jar .

# Set environment variables
ENV SPRING_PROFILES_ACTIVE=prod

ENTRYPOINT ["java", "-jar", "micro_starter_one-0.0.1-SNAPSHOT.jar"]



