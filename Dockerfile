#Build satge
FROM openjdk:11 AS base
WORKDIR /opt/helo-spring
COPY ./ ./
RUN ./gradlew assemble \
   && rm -rf /root/.gradle

#Runtime stage
FROM amazoncorretto:11
WORKDIR /opt/helo-spring
COPY --from=base /opt/helo-spring/build/libs/helo-spring-0.0.1-SNAPSHOT.jar ./
CMD java -jar helo-spring-0.0.1-SNAPSHOT.jar