FROM debian:bookworm
COPY sys-root /
ENV PATH="$PATH:/opt/xmage/java/jre1.8.0_201/bin"
WORKDIR /opt/xmage/xmage/mage-server
EXPOSE 17171 17172
CMD java -Xms256M -Xmx512M -Dfile.encoding=UTF-8 -Djava.security.policy=./config/security.policy -Dlog4j.configuration=file:./config/log4j.properties -jar ./lib/mage-server-1.4.50.jar
