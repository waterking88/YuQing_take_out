FROM adoptopenjdk:8-jre-hotspot
WORKDIR /YuQing_take_out
COPY YuQing_take_out-1.0-SNAPSHOT.jar .
ENTRYPOINT ["java", "-jar", "YuQing_take_out-1.0-SNAPSHOT.jar","--spring.profiles.active=prod"]
