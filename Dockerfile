ARG ARCH=
FROM ${ARCH}openjdk:16-slim-buster

VOLUME /data
EXPOSE 8081

COPY geysermc/ /home/qumine/

RUN apt update \
&& apt install -y unzip wget \
&& groupadd -g 4242 -r qumine \
&& useradd -g 4242 -m -N -r -u 4242 qumine

RUN wget -o /home/qumine/geysermc.jar https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/752/artifact/bootstrap/standalone/target/Geyser.jar

USER qumine
WORKDIR /home/qumine/
ENTRYPOINT [ "java", "-jar", "geysermc.jar"]