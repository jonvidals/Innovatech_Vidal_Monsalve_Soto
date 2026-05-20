FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

COPY Springboot-API-REST/pom.xml .
COPY Springboot-API-REST/src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
RUN addgroup --system springuser && adduser --system springuser --ingroup springuser
COPY --from=build /app/target/*.jar app.jar
USER springuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]