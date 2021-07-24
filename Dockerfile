ARG ARCH=
FROM ${ARCH}openjdk:17-oraclelinux8

VOLUME /data
EXPOSE 19132

COPY geysermc/ /home/qumine/

RUN microdnf update \
&& microdnf install unzip \
&& groupadd -g 4242 -r qumine \
&& useradd -g 4242 -m -N -r -u 4242 qumine

RUN curl -L --output /home/qumine/geysermc.jar https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/775/artifact/bootstrap/standalone/target/Geyser.jar \
&& chown -R qumine:qumine /home/qumine

USER qumine
WORKDIR /home/qumine/
ENTRYPOINT [ "java", "-jar", "geysermc.jar"]