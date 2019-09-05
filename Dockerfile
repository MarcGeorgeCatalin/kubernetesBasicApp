FROM maven:3.6.1-jdk-12 as maven_layer
WORKDIR /opt/basicApp
COPY src src
COPY pom.xml .
RUN mvn clean package -DskipTests

FROM openjdk:8-jdk
WORKDIR /opt/basicApp/
COPY --from=maven_layer /opt/basicApp/target/BasicApp-0.0.1-SNAPSHOT.jar BasicApp.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "BasicApp.jar"]
