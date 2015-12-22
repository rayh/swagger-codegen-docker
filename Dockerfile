FROM java:7

RUN apt-get update -q
RUN apt-get install -y -q maven

RUN git clone https://github.com/swagger-api/swagger-codegen.git
RUN cd swagger-codegen && mvn package

RUN apt-get install -y zip

RUN git clone https://github.com/Swagger2Markup/swagger2markup-cli.git
RUN cd swagger2markup-cli && bash gradlew build

WORKDIR /scripts
ADD generate.sh generate.sh

ENTRYPOINT ["/scripts/generate.sh"]
