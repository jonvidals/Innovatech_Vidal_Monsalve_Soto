FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /build

# Copiar todo el proyecto
COPY . .

# Compilar el proyecto
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

RUN addgroup --system springuser && adduser --system springuser --ingroup springuser

# Copiar el JAR compilado
COPY --from=build /build/target/*.jar app.jar

USER springuser

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]
