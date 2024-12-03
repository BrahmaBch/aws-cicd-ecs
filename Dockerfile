# Use the official OpenJDK 11 image to create the container image
FROM openjdk:11-jdk-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy Gradle wrapper and other necessary files
COPY gradlew . 
COPY gradle /gradle
COPY build.gradle .
COPY settings.gradle .
COPY src /src

# Build the Spring Boot application
RUN ./gradlew build -x test

# Create a smaller image for running the app
FROM openjdk:11-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR from the build image
COPY --from=build /app/build/libs/*.jar app.jar

# Expose port 6001 (default Spring Boot app port)
EXPOSE 6001

# Command to run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
