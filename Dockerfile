FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

# Copy Gradle wrapper and config files
COPY gradle gradle
COPY gradlew .
COPY gradlew.bat .
COPY build.gradle .
COPY settings.gradle .
COPY gradle.properties .

# Make gradlew executable
RUN chmod +x gradlew

# Download dependencies (cache layer)
RUN ./gradlew dependencies --no-daemon || true

# Copy source code
COPY src src

# Build with Vaadin production mode
RUN ./gradlew clean build -Pvaadin.productionMode --no-daemon

# Runtime stage
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Copy the built JAR
COPY --from=build /app/build/libs/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
