FROM maven AS builder
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn install -DskipTests

FROM openjdk:17
COPY --from=builder /build/target/*.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]
