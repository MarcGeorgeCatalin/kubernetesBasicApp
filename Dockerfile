FROM alpine:3.10.2 AS git_layer
RUN apk update && apk upgrade && apk add --no-cache bash git openssh
RUN git clone https://github.com/MarcGeorgeCatalin/kubernetesBasicApp.git

FROM maven:3.6.1-jdk-12 as maven_layer
WORKDIR /opt/basicApp
COPY --from=git_layer kubernetesBasicApp .
RUN mvn clean package -DskipTests

FROM openjdk:8-jdk
WORKDIR /opt/basicApp/
COPY --from=maven_layer /opt/basicApp/target/BasicApp-0.0.1-SNAPSHOT.jar BasicApp.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "BasicApp.jar"]
