FROM openjdk:8-jdk-slim
WORKDIR /app
COPY target/JavaSpring-0.0.1-SNAPSHOT.jar /0.0.1-SNAPSHOT
EXPOSE 8081
CMD ["java","-jar","JavaSpring-0.0.1-SNAPSHOT.jar"]
