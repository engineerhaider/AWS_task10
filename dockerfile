# Use an official Java runtime as a parent image
FROM openjdk:11-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven executable and the project object model file
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Copy the source code
COPY src src

# Package the application
RUN ./mvnw package -DskipTests

# Run the JAR file
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]
