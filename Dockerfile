# Use an official OpenJDK runtime as a base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file (replace "your-app.jar" with your actual JAR file name)
COPY target/your-app.jar /app/your-app.jar

# Expose the port your application will listen on (replace 8080 with your actual port)
EXPOSE 8080

# Command to run your application
CMD ["java", "-jar", "your-app.jar"]
