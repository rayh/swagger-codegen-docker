FROM java:7

RUN apt-get update -q
RUN apt-get install -y -q maven

RUN git clone https://github.com/swagger-api/swagger-codegen.git
WORKDIR swagger-codegen
RUN mvn package

RUN apt-get install -y zip

ADD generate.sh generate.sh


ENTRYPOINT ["/swagger-codegen/generate.sh"]
