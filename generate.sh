#!/bin/bash

INPUT=$1
LANG=$2
TAG=$3
NAME=$(echo $INPUT | sed -e 's/\.yml$//g' | sed -e 's/\.json$//g' )

mkdir artifacts/ output/

echo "Generate spec $INPUT for lang $LANG"

case $LANG in
asciidoc | markdown)
  java -jar /swagger2markup-cli/build/libs/swagger2markup-cli-0.9.1.jar generate \
  -i $INPUT \
  -l $LANG \
  -o output/$NAME/$LANG/
;;
*)
  java -jar /swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
  -i $INPUT \
  -l $LANG \
  -o output/$NAME/$LANG/
;;
esac

cd output/$NAME/$LANG
zip -r ../../swagger-$NAME-$LANG-$TAG.zip .
