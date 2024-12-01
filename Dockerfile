FROM openjdk:11-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file from the Gradle build output to the container
COPY build/libs/spring-boot-docket-demo-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080
EXPOSE 9002

# Set the entrypoint for the container
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
