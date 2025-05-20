# Use official OpenJDK image as base
FROM openjdk:17-jdk-alpine
# Copy the packaged jar file from target directory
COPY target/*.jar app.jar
# Expose port 8080 (default Spring Boot port)
EXPOSE 8080
# Run the jar file
ENTRYPOINT ["java", "-jar", "/app.jar"]
