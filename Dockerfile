FROM openjdk:9

#COPY ./target/http_client-0.0.1-SNAPSHOT.jar /usr/src/myapp/http_client-0.0.1-SNAPSHOT.jar
#CMD ["java", "-jar", "--add-modules=jdk.incubator.httpclient", "/usr/src/myapp/http_client-0.0.1-SNAPSHOT.jar"]

# The application's jar file
ARG JAR_FILE=target/ssl-client-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} ssl-client-0.0.1-SNAPSHOT.jar

ENV JAVA_OPTIONS="-Djavax.net.ssl.trustStore=/var/run/secrets/java.io/keystores/truststore.jks -Djavax.net.ssl.trustStorePassword=changeit"
# Run the jar file 
#ENTRYPOINT ["java $JAVA_OPTIONS","-jar","-Djava.security.egd=file:/dev/./urandom", "/ssl-client-0.0.1-SNAPSHOT.jar"]
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTIONS -Djava.security.egd=file:/dev/./urandom -jar /ssl-client-0.0.1-SNAPSHOT.jar"]
