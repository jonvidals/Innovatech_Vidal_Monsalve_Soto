FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
FROM openjdk:17-jdk-slim
WORKDIR /app
RUN addgroup --system springuser && adduser --system springuser --ingroup springuser
COPY --from=build /app/target/*.jar app.jar
USER springuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]